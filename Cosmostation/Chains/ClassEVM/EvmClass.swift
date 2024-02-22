//
//  evmClass.swift
//  Cosmostation
//
//  Created by yongjoo jung on 2023/08/19.
//  Copyright © 2023 wannabit. All rights reserved.
//

import Foundation
import web3swift
import Alamofire
import BigInt

class EvmClass: CosmosClass {
    
    var supportCosmos = false
    
    var coinSymbol = ""
    var coinGeckoId = ""
    var coinLogo = ""
    
    lazy var rpcURL = ""
    lazy var explorerURL = ""
    lazy var addressURL = ""
    lazy var txURL = ""
    
    var web3: web3?
    var evmBalances = NSDecimalNumber.zero
    
    lazy var mintscanErc20Tokens = [MintscanToken]()
    
    override func setInfoWithSeed(_ seed: Data, _ lastPath: String) {
        privateKey = KeyFac.getPriKeyFromSeed(accountKeyType.pubkeyType, seed, getHDPath(lastPath))
        publicKey = KeyFac.getPubKeyFromPrivateKey(privateKey!, accountKeyType.pubkeyType)
        evmAddress = KeyFac.getAddressFromPubKey(publicKey!, accountKeyType.pubkeyType, nil)
        if (supportCosmos) {
            bechAddress = KeyFac.convertEvmToBech32(evmAddress, bechAccountPrefix!)
        }
        if (supportStaking) {
            bechOpAddress = KeyFac.getOpAddressFromAddress(bechAddress, validatorPrefix)
        }
    }
    
    override func setInfoWithPrivateKey(_ priKey: Data) {
        privateKey = priKey
        publicKey = KeyFac.getPubKeyFromPrivateKey(privateKey!, accountKeyType.pubkeyType)
        evmAddress = KeyFac.getAddressFromPubKey(publicKey!, accountKeyType.pubkeyType, nil)
        if (supportCosmos) {
            bechAddress = KeyFac.convertEvmToBech32(evmAddress, bechAccountPrefix!)
        }
        if (supportStaking) {
            bechOpAddress = KeyFac.getOpAddressFromAddress(bechAddress, validatorPrefix)
        }
    }
    
    //fetch account onchaindata from web3 info
    override func fetchData(_ id: Int64) async {
        if (supportCosmos) {
            if let rawParam = try? await self.fetchChainParam(),
               let erc20s = try? await self.fetchErc20Info(),
               let balance = try? await fetchBalance() {
                mintscanChainParam = rawParam
                mintscanErc20Tokens = erc20s
                evmBalances = NSDecimalNumber(string: balance.description)
            }
            fetchGrpcData(id)
            fetchAllErc20Balance(id)
            
        } else {
            if let erc20s = try? await self.fetchErc20Info(),
                let balance = try? await fetchBalance() {
                mintscanErc20Tokens = erc20s
                evmBalances = NSDecimalNumber(string: balance.description)
            }
            
            DispatchQueue.main.async {
                self.fetched = true
                self.allCoinValue = self.allCoinValue()
                self.allCoinUSDValue = self.allCoinValue(true)
                
                BaseData.instance.updateRefAddressesMain(
                    RefAddress(id, self.tag, "", self.evmAddress,
                               self.evmBalances.stringValue, self.allCoinUSDValue.stringValue, nil, 1))
                NotificationCenter.default.post(name: Notification.Name("FetchData"), object: self.tag, userInfo: nil)
                
                self.fetchAllErc20Balance(id)
            }
        }
    }
    
    //fetch only balance for add account check
    override func fetchPreCreate() {
        Task {
            if let balance = try? await fetchBalance() {
                evmBalances = NSDecimalNumber(string: balance.description)
            }
            DispatchQueue.global().async {
                self.fetched = true
                NotificationCenter.default.post(name: Notification.Name("FetchPreCreate"), object: self.tag, userInfo: nil)
            }
        }
    }
    
    //check account payable with lowest fee
    override func isTxFeePayable() -> Bool {
        return evmBalances.compare(EVM_BASE_FEE).rawValue > 0
    }
    
    func getWeb3Connection() -> web3? {
        guard let url = URL(string: rpcURL) else { return  nil }
        if (self.web3 == nil || self.web3?.provider.session == nil) {
            return try? Web3.new(url)
        }
        return web3
    }
    
    override func allCoinValue(_ usd: Bool? = false) -> NSDecimalNumber {
        if (supportCosmos) {
            return super.allCoinValue(usd)
        } else {
            let msPrice = BaseData.instance.getPrice(coinGeckoId, usd)
            return evmBalances.multiplying(by: msPrice).multiplying(byPowerOf10: -18, withBehavior: handler6)
        }
    }
    
    override func tokenValue(_ address: String, _ usd: Bool? = false) -> NSDecimalNumber {
        if let tokenInfo = mintscanErc20Tokens.filter({ $0.address == address }).first {
            let msPrice = BaseData.instance.getPrice(tokenInfo.coinGeckoId, usd)
            return msPrice.multiplying(by: tokenInfo.getAmount()).multiplying(byPowerOf10: -tokenInfo.decimals!, withBehavior: handler6)
        }
        return NSDecimalNumber.zero
    }
    
    override func allTokenValue(_ usd: Bool? = false) -> NSDecimalNumber {
        var result = NSDecimalNumber.zero
        mintscanErc20Tokens.forEach { tokenInfo in
            let msPrice = BaseData.instance.getPrice(tokenInfo.coinGeckoId, usd)
            let value = msPrice.multiplying(by: tokenInfo.getAmount()).multiplying(byPowerOf10: -tokenInfo.decimals!, withBehavior: handler6)
            result = result.adding(value)
        }
        return result
    }
    
    deinit {
        web3 = nil
    }
}

extension EvmClass {
    func fetchErc20Info() async throws -> [MintscanToken] {
//        print("fetchErc20Info ", BaseNetWork.msErc20InfoUrl(self))
        return try await AF.request(BaseNetWork.msErc20InfoUrl(self), method: .get).serializingDecodable([MintscanToken].self).value
    }
    
    func fetchBalance() async throws -> NSDecimalNumber {
        if let balance = try? getWeb3Connection()?.eth.getBalance(address: EthereumAddress.init(evmAddress)!) {
            return NSDecimalNumber(string: balance?.description)
        }
        return NSDecimalNumber.zero
    }
}

extension EvmClass {
    func fetchAllErc20Balance(_ id: Int64) {
        let group = DispatchGroup()
        mintscanErc20Tokens.forEach { token in
            if (token.isdefault == true) {
                fetchErc20Balance(group, EthereumAddress.init(evmAddress)!, token)
            }
        }
        
        group.notify(queue: .main) {
            self.allTokenValue = self.allTokenValue()
            self.allTokenUSDValue = self.allTokenValue(true)
            
            BaseData.instance.updateRefAddressesToken(
                RefAddress(id, self.tag, "", self.evmAddress,
                           nil, nil, self.allTokenUSDValue.stringValue, nil))
            NotificationCenter.default.post(name: Notification.Name("FetchTokens"), object: nil, userInfo: nil)
        }
    }
    
    func fetchErc20Balance(_ group: DispatchGroup, _ accountEthAddr: EthereumAddress, _ tokenInfo: MintscanToken) {
        group.enter()
        DispatchQueue.global().async {
            let contractAddress = EthereumAddress.init(tokenInfo.address!)
            let erc20token = ERC20(web3: self.getWeb3Connection()!, provider: self.getWeb3Connection()!.provider, address: contractAddress!)
            if let erc20Balance = try? erc20token.getBalance(account: accountEthAddr) {
                tokenInfo.setAmount(String(erc20Balance))
//                print("erc20Balance ", tokenInfo.symbol, "  ", erc20Balance)
                group.leave()
            } else {
                group.leave()
            }
        }
    }
}


func ALLEVMCLASS() -> [EvmClass] {
    var result = [EvmClass]()
    result.append(ChainEthereum())
    result.append(ChainKava_EVM())
    
    //Add cosmos chain id for ibc
    result.forEach { chain in
        if let chainId = BaseData.instance.mintscanChains?["chains"].arrayValue.filter({ $0["chain"].stringValue == chain.apiName }).first?["chain_id"].stringValue {
            chain.chainId = chainId
        }
    }
    return result
}

let DEFUAL_DISPALY_EVM = ["ethereum60"]

let EVM_BASE_FEE = NSDecimalNumber.init(string: "588000000000000")
