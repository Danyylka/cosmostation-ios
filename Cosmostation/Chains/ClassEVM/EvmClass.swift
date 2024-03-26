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
import SwiftyJSON

class EvmClass: CosmosClass {
    
    var supportCosmos = false
    
    var coinSymbol = ""
    var coinGeckoId = ""
    var coinLogo = ""
    
    lazy var evmRpcURL = ""
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
    
    override func fetchData(_ id: Int64) {
        mintscanErc20Tokens.removeAll()
        Task {
            do {
                let erc20Tokens = try await self.fetchErc20Info()
                let balanceJson = try await fetchEvmBalance(self.evmAddress)
                
                if let erc20Tokens = erc20Tokens {
                    self.mintscanErc20Tokens = erc20Tokens
                }
                if let balance = balanceJson?["result"].stringValue.hexToNSDecimal {
                    self.evmBalances = balance()
//                    print("evmBalances ", tag, "   ", evmBalances)
                }
                await fetchAllErc20Balance(id)
            } catch {
                print("Error Evm", self.tag,  error)
                //TODO Handle Error
            }
            
            if (supportCosmos) {
                await self.fetchCosmosData(id)
            } else {
                DispatchQueue.main.async(execute: {
                    self.fetched = true
                    self.allCoinValue = self.allCoinValue()
                    self.allCoinUSDValue = self.allCoinValue(true)
                    BaseData.instance.updateRefAddressesCoinValue(
                        RefAddress(id, self.tag, self.bechAddress, self.evmAddress,
                                   self.evmBalances.stringValue, self.allCoinUSDValue.stringValue,
                                   nil, (self.evmBalances != NSDecimalNumber.zero ? 1 : 0) ))
                    NotificationCenter.default.post(name: Notification.Name("FetchData"), object: self.tag, userInfo: nil)
                });
            }
        }
    }
    
    
    func fetchCosmosData(_ id: Int64) async {
        cosmosAuth = nil
        cosmosBalances = nil
        cosmosVestings.removeAll()
        cosmosDelegations.removeAll()
        cosmosUnbondings.removeAll()
        cosmosRewards.removeAll()
        cosmosCommissions.removeAll()
        
        let channel = getConnection()
        if let auth = try? await fetchAuth(channel),
           let balance = try? await fetchBalance(channel),
           let delegations = try? await fetchDelegation(channel),
           let unbonding = try? await fetchUnbondings(channel),
           let rewards = try? await fetchRewards(channel),
           let commission = try? await fetchCommission(channel),
           let rewardaddr = try? await fetchRewardAddress(channel) {
            self.cosmosAuth = auth
            self.cosmosBalances = balance
            delegations?.forEach({ delegation in
                if (delegation.balance.amount != "0") {
                    self.cosmosDelegations.append(delegation)
                }
            })
            if (unbonding != nil) {
                self.cosmosUnbondings = unbonding!
            }
            if (rewards != nil) {
                self.cosmosRewards = rewards!
            }
            commission?.commission.forEach { commi in
                if (commi.getAmount().compare(NSDecimalNumber.zero).rawValue > 0) {
                    self.cosmosCommissions.append(Cosmos_Base_V1beta1_Coin(commi.denom, commi.getAmount()))
                }
            }
            self.rewardAddress = (rewardaddr ?? "").replacingOccurrences(of: "\"", with: "")
        }
        
        DispatchQueue.main.async {
            WUtils.onParseVestingAccount(self)
            self.fetched = true
            self.allCoinValue = self.allCoinValue()
            self.allCoinUSDValue = self.allCoinValue(true)
            
            BaseData.instance.updateRefAddressesCoinValue(
                RefAddress(id, self.tag, self.bechAddress, self.evmAddress,
                           self.allStakingDenomAmount().stringValue, self.allCoinUSDValue.stringValue,
                           nil, self.cosmosBalances?.filter({ BaseData.instance.getAsset(self.apiName, $0.denom) != nil }).count))
            NotificationCenter.default.post(name: Notification.Name("FetchData"), object: self.tag, userInfo: nil)
            try? channel.close()
        }
    }
    
    
    //fetch only balance for add account check
    override func fetchPreCreate() {
        //Do not using Task, only DispatchQueue : make slow
//        DispatchQueue(label: "evmBalance", attributes: .concurrent).async {
//            if let url = URL(string: self.getEvmRpc()),
//               let web3 = try? Web3.new(url),
//               let balance = try? web3.eth.getBalance(address: EthereumAddress.init(self.evmAddress)!) {
//                self.web3 = web3
//                self.evmBalances = NSDecimalNumber(string: String(balance))
//            }
//            
//            DispatchQueue.main.async(execute: {
//                self.fetched = true
//                NotificationCenter.default.post(name: Notification.Name("FetchPreCreate"), object: self.tag, userInfo: nil)
//            });
//        }
        Task {
            let balanceJson = try await fetchEvmBalance(self.evmAddress)
            if let balance = balanceJson?["result"].stringValue.hexToNSDecimal {
                self.evmBalances = balance()
            }
            
            DispatchQueue.main.async(execute: {
                self.fetched = true
                NotificationCenter.default.post(name: Notification.Name("FetchPreCreate"), object: self.tag, userInfo: nil)
            });
        }
    }
    
    //check account payable with lowest fee
    override func isTxFeePayable() -> Bool {
        if (supportCosmos) {
            return super.isTxFeePayable()
        }
        return evmBalances.compare(EVM_BASE_FEE).rawValue > 0
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
    
    func getEvmRpc() -> String {
        if let endpoint = UserDefaults.standard.string(forKey: KEY_CHAIN_EVM_RPC_ENDPOINT +  " : " + self.name) {
            return endpoint.trimmingCharacters(in: .whitespaces)
        }
        return evmRpcURL
    }
}

extension EvmClass {
    
    func fetchErc20Info() async throws -> [MintscanToken]?  {
        return try await AF.request(BaseNetWork.msErc20InfoUrl(self), method: .get).serializingDecodable([MintscanToken].self).value
    }
    
    func fetchEvmBalance(_ address: String) async throws -> JSON? {
        let param: Parameters = ["method": "eth_getBalance", "params": [address, "latest"], "id" : 1, "jsonrpc" : "2.0"]
        return try await AF.request(getEvmRpc(), method: .post, parameters: param, encoding: JSONEncoding.default).serializingDecodable(JSON.self).value
    }
    
    func fetchAllErc20Balance(_ id: Int64) async  {
        let userDisplaytoken = BaseData.instance.getDisplayErc20s(id, tag)
        await mintscanErc20Tokens.concurrentForEach { token in
            if (self.supportCosmos) {
                await self.fetchErc20Balance(token)
                
            } else {
                if (userDisplaytoken == nil) {
                    if (token.isdefault == true) {
                        await self.fetchErc20Balance(token)
                    }
                } else {
                    if (userDisplaytoken?.contains(token.address!) == true) {
                        await self.fetchErc20Balance(token)
                    }
                }
            }
        }
        
        DispatchQueue.main.async {
            self.allTokenValue = self.allTokenValue()
            self.allTokenUSDValue = self.allTokenValue(true)
            
            BaseData.instance.updateRefAddressesTokenValue(
                RefAddress(id, self.tag, "", self.evmAddress,
                           nil, nil, self.allTokenUSDValue.stringValue, nil))
            NotificationCenter.default.post(name: Notification.Name("FetchTokens"), object: self.tag, userInfo: nil)
        }
    }
    
    func fetchErc20Balance(_ tokenInfo: MintscanToken) async {
        let data = "0x70a08231000000000000000000000000" + self.evmAddress.stripHexPrefix()
        let param: Parameters = ["method": "eth_call", "id" : 1, "jsonrpc" : "2.0",
                                 "params": [["data": data, "to" : tokenInfo.address], "latest"]]
        if let erc20BalanceJson = try? await AF.request(getEvmRpc(), method: .post, parameters: param, encoding: JSONEncoding.default).serializingDecodable(JSON.self).value {
            let erc20Balance = erc20BalanceJson["result"].stringValue.hexToNSDecimal
            tokenInfo.setAmount(erc20Balance().stringValue)
//            print("", tag, "   ", tokenInfo.symbol, "  ", tokenInfo.amount)
        }
    }
}


func ALLEVMCLASS() -> [EvmClass] {
    var result = [EvmClass]()
    result.append(ChainEthereum())
//    result.append(ChainAltheaEVM())
    result.append(ChainBaseEVM())
    result.append(ChainCantoEVM())
    result.append(ChainDymensionEVM())
    result.append(ChainEvmosEVM())
    result.append(ChainHumansEVM())
    result.append(ChainKavaEVM())
    result.append(ChainOktEVM())
    result.append(ChainOptimism())
    result.append(ChainPolygon())
    result.append(ChainXplaEVM())
    
    //Add cosmos chain id for ibc
    result.forEach { chain in
        if let chainId = BaseData.instance.mintscanChains?["chains"].arrayValue.filter({ $0["chain"].stringValue == chain.apiName }).first?["chain_id"].stringValue {
            chain.chainId = chainId
        }
    }
    return result
}

let DEFUAL_DISPALY_EVM = ["ethereum60", "dymension60", "kava60"]

let EVM_BASE_FEE = NSDecimalNumber.init(string: "588000000000000")
