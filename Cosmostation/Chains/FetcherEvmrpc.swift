//
//  FetcherEvmrpc.swift
//  Cosmostation
//
//  Created by yongjoo jung on 6/15/24.
//  Copyright © 2024 wannabit. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import BigInt

class FetcherEvmrpc {
    
    var chain: BaseChain!
    
    var evmBalances = NSDecimalNumber.zero
    var mintscanErc20Tokens = [MintscanToken]()
    
    init(_ chain: BaseChain) {
        self.chain = chain
    }
    
    deinit {
    }
    
    
    func fetchEvmData(_ id: Int64) async -> Bool {
        mintscanErc20Tokens.removeAll()
        
        do {
            let erc20Tokens = try await self.fetchErc20Info()
            let balanceJson = try await fetchEvmBalance(self.chain.evmAddress!)
            if let erc20Tokens = erc20Tokens {
                self.mintscanErc20Tokens = erc20Tokens
            }
            if let balance = balanceJson?["result"].stringValue.hexToNSDecimal {
                self.evmBalances = balance()
            }
            
//            print("fetchAllErc20Balance start ", chain.tag)
            let userDisplaytoken = BaseData.instance.getDisplayErc20s(id, self.chain.tag)
            await mintscanErc20Tokens.concurrentForEach { erc20 in
                if (self.chain.supportCosmos) {
                    await self.fetchErc20Balance(erc20)
                } else {
                    if (userDisplaytoken == nil) {
                        if (erc20.isdefault == true) {
                            await self.fetchErc20Balance(erc20)
                        }
                    } else {
                        if (userDisplaytoken?.contains(erc20.address!) == true) {
                            await self.fetchErc20Balance(erc20)
                        }
                    }
                }
            }
//            print("fetchAllErc20Balance end ", chain.tag)
            return true
            
        } catch {
//            print("evm error \(error)")
//            throw CommonError.evmErrpr
            return false
        }
    }
    
    func allCoinValue(_ usd: Bool? = false) -> NSDecimalNumber {
        let msPrice = BaseData.instance.getPrice(chain.coinGeckoId, usd)
        return evmBalances.multiplying(by: msPrice).multiplying(byPowerOf10: -18, withBehavior: handler6)
    }
    
    func tokenValue(_ address: String, _ usd: Bool? = false) -> NSDecimalNumber {
        if let tokenInfo = mintscanErc20Tokens.filter({ $0.address == address }).first {
            let msPrice = BaseData.instance.getPrice(tokenInfo.coinGeckoId, usd)
            return msPrice.multiplying(by: tokenInfo.getAmount()).multiplying(byPowerOf10: -tokenInfo.decimals!, withBehavior: handler6)
        }
        return NSDecimalNumber.zero
    }
    
    func allTokenValue(_ usd: Bool? = false) -> NSDecimalNumber {
        var result = NSDecimalNumber.zero
        mintscanErc20Tokens.forEach { tokenInfo in
            let msPrice = BaseData.instance.getPrice(tokenInfo.coinGeckoId, usd)
            let value = msPrice.multiplying(by: tokenInfo.getAmount()).multiplying(byPowerOf10: -tokenInfo.decimals!, withBehavior: handler6)
            result = result.adding(value)
        }
        return result
    }
    
}

//about mintscan api
extension FetcherEvmrpc {
    
    func fetchErc20Info() async throws -> [MintscanToken]?  {
        return try await AF.request(BaseNetWork.msErc20InfoUrl(chain.apiName), method: .get).serializingDecodable([MintscanToken].self).value
    }
    
    func fetchEvmBalance(_ address: String) async throws -> JSON? {
        let param: Parameters = ["method": "eth_getBalance", "params": [address, "latest"], "id" : 1, "jsonrpc" : "2.0"]
        return try await AF.request(getEvmRpc(), method: .post, parameters: param, encoding: JSONEncoding.default).serializingDecodable(JSON.self).value
    }
    
    func fetchAllErc20Balance(_ id: Int64) async {
        let userDisplaytoken = BaseData.instance.getDisplayErc20s(id, self.chain.tag)
        Task {
            await mintscanErc20Tokens.concurrentForEach { erc20 in
                if (self.chain.supportCosmos) {
                    await self.fetchErc20Balance(erc20)
                } else {
                    if (userDisplaytoken == nil) {
                        if (erc20.isdefault == true) {
                            await self.fetchErc20Balance(erc20)
                        }
                    } else {
                        if (userDisplaytoken?.contains(erc20.address!) == true) {
                            await self.fetchErc20Balance(erc20)
                        }
                    }
                }
            }
        }
    }
    
    func fetchErc20Balance(_ tokenInfo: MintscanToken) async {
        let data = "0x70a08231000000000000000000000000" + self.chain.evmAddress!.stripHexPrefix()
        let param: Parameters = ["method": "eth_call", "id" : 1, "jsonrpc" : "2.0",
                                 "params": [["data": data, "to" : tokenInfo.address], "latest"]]
        if let erc20BalanceJson = try? await AF.request(getEvmRpc(), method: .post, parameters: param, encoding: JSONEncoding.default).serializingDecodable(JSON.self).value {
            let erc20Balance = erc20BalanceJson["result"].stringValue.hexToNSDecimal
//            print("fetchErc20Balance ", tokenInfo.symbol, "  ", erc20Balance().stringValue)
            tokenInfo.setAmount(erc20Balance().stringValue)
        }
    }
    
    func getEvmRpc() -> String {
        if let endpoint = UserDefaults.standard.string(forKey: KEY_CHAIN_EVM_RPC_ENDPOINT +  " : " + chain.name) {
            return endpoint.trimmingCharacters(in: .whitespaces)
        }
        return chain.evmRpcURL
    }
    
}
