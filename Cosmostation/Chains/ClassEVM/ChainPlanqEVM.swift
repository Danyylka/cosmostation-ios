//
//  ChainPlanqEVM.swift
//  Cosmostation
//
//  Created by 차소민 on 10/24/24.
//  Copyright © 2024 wannabit. All rights reserved.
//

import Foundation

class ChainPlanqEVM: BaseChain  {
    
    override init() {
        super.init()
        
        name = "Planq"
        tag = "planq60"
        logo1 = "chainPlanq"
        apiName = "planq"
        accountKeyType = AccountKeyType(.ETH_Keccak256, "m/44'/60'/0'/0/X")
        
        
        cosmosEndPointType = .UseLCD
        stakeDenom = "aplanq"
        bechAccountPrefix = "plq"
        validatorPrefix = "plqvaloper"
        grpcHost = "grpc.planq.network"
        lcdUrl = "https://planq.api.m.stavr.tech/"
        
        supportEvm = true
        coinSymbol = "PLANQ"
        coinGeckoId = "planq"
        coinLogo = "tokenPlq"
        evmRpcURL = "https://planq-rpc.nodies.app"
    }
}
