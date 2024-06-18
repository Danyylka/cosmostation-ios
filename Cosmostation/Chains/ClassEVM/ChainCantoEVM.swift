//
//  ChainCantoEVM.swift
//  Cosmostation
//
//  Created by yongjoo jung on 2/22/24.
//  Copyright © 2024 wannabit. All rights reserved.
//

import Foundation

class ChainCantoEVM: BaseChain  {
    
    override init() {
        super.init()
        
        name = "Canto"
        tag = "canto60"
        logo1 = "chainCantoEvm"
        logo2 = "chainCanto2"
        apiName = "canto"
        accountKeyType = AccountKeyType(.ETH_Keccak256, "m/44'/60'/0'/0/X")
        
        
        supportCosmosGrpc = true
        stakeDenom = "acanto"
        bechAccountPrefix = "canto"
        validatorPrefix = "cantovaloper"
        grpcHost = "grpc-canto.cosmostation.io"
        
        
        supportEvm = true
        coinSymbol = "CANTO"
        coinGeckoId = "canto"
        coinLogo = "tokenCanto"
        evmRpcURL = "https://rpc-canto-evm.cosmostation.io"
        
        initFetcher()
    }
}
