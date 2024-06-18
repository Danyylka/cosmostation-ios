//
//  ChainInjective.swift
//  Cosmostation
//
//  Created by yongjoo jung on 2023/08/23.
//  Copyright © 2023 wannabit. All rights reserved.
//

import Foundation

class ChainInjective: BaseChain  {
    
    override init() {
        super.init()
        
        name = "Injective"
        tag = "injective60"
        logo1 = "chainInjective"
        logo2 = "chainInjective2"
        apiName = "injective"
        accountKeyType = AccountKeyType(.INJECTIVE_Secp256k1, "m/44'/60'/0'/0/X")
        
        
        supportCosmosGrpc = true
        stakeDenom = "inj"
        bechAccountPrefix = "inj"
        validatorPrefix = "injvaloper"
        grpcHost = "grpc-injective.cosmostation.io"
        
        initFetcher()
    }
}
