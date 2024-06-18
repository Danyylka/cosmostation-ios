//
//  ChainSecret529.swift
//  Cosmostation
//
//  Created by yongjoo jung on 2023/10/04.
//  Copyright © 2023 wannabit. All rights reserved.
//

import Foundation

class ChainSecret529: BaseChain  {
    
    override init() {
        super.init()
        
        name = "Secret"
        tag = "secret529"
        logo1 = "chainSecret"
        logo2 = "chainSecret2"
        apiName = "secret"
        accountKeyType = AccountKeyType(.COSMOS_Secp256k1, "m/44'/529'/0'/0/X")
        
        
        supportCosmosGrpc = true
        stakeDenom = "uscrt"
        bechAccountPrefix = "secret"
        validatorPrefix = "secretvaloper"
        grpcHost = "grpc-secret.cosmostation.io"
        
        initFetcher()
    }
}

