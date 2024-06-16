//
//  ChainTeritori.swift
//  Cosmostation
//
//  Created by yongjoo jung on 2023/10/04.
//  Copyright © 2023 wannabit. All rights reserved.
//

import Foundation

class ChainTeritori: BaseChain  {
    
    override init() {
        super.init()
        
        name = "Teritori"
        tag = "teritori118"
        logo1 = "chainTeritori"
        logo2 = "chainTeritori2"
        supportCosmos = true
        apiName = "teritori"
        
        stakeDenom = "utori"
        accountKeyType = AccountKeyType(.COSMOS_Secp256k1, "m/44'/118'/0'/0/X")
        bechAccountPrefix = "tori"
        validatorPrefix = "torivaloper"
//        supportCw721 = true
        grpcHost = "grpc-teritori.cosmostation.io"
        
        initFetcher()
    }
}
