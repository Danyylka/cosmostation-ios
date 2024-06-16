//
//  ChainHumansEVM.swift
//  Cosmostation
//
//  Created by yongjoo jung on 2/22/24.
//  Copyright © 2024 wannabit. All rights reserved.
//

import Foundation

class ChainHumansEVM: BaseChain  {
    
    override init() {
        super.init()
        
        name = "Humans"
        tag = "humans60"
        logo1 = "chainHumansEvm"
        logo2 = "chainHumans2"
        supportCosmos = true
        supportEvm = true
        apiName = "humans"
        
        stakeDenom = "aheart"
        coinSymbol = "HEART"
        coinGeckoId = "humans-ai"
        coinLogo = "tokenHeart"

        accountKeyType = AccountKeyType(.ETH_Keccak256, "m/44'/60'/0'/0/X")
        bechAccountPrefix = "human"
        validatorPrefix = "humanvaloper"
        grpcHost = "grpc-humans.cosmostation.io"
        evmRpcURL = "https://rpc-humans-evm.cosmostation.io"
        
        initFetcher()
    }
}
