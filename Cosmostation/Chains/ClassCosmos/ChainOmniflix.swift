//
//  ChainOmniflix.swift
//  Cosmostation
//
//  Created by yongjoo jung on 2023/10/04.
//  Copyright © 2023 wannabit. All rights reserved.
//

import Foundation

class ChainOmniflix: BaseChain  {
    
    override init() {
        super.init()
        
        name = "Omniflix"
        tag = "omniflix118"
        logo1 = "chainOmniflix"
        logo2 = "chainOmniflix2"
        apiName = "omniflix"
        accountKeyType = AccountKeyType(.COSMOS_Secp256k1, "m/44'/118'/0'/0/X")
        
        
        supportCosmosGrpc = true
        stakeDenom = "uflix"
        bechAccountPrefix = "omniflix"
        validatorPrefix = "omniflixvaloper"
        grpcHost = "grpc-omniflix.cosmostation.io"
        
        initFetcher()
    }
}

