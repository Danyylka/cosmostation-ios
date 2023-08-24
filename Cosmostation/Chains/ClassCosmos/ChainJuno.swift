//
//  ChainJuno.swift
//  Cosmostation
//
//  Created by yongjoo jung on 2023/08/19.
//  Copyright © 2023 wannabit. All rights reserved.
//

import Foundation

class ChainJuno: CosmosClass  {
    
    override init() {
        super.init()
        
        name = "Juno"
        id = "juno118"
        logo1 = "chainJuno"
        logo2 = "chainJuno2"
        apiName = "juno"
        stakeDenom = "ujuno"
        
        accountKeyType = AccountKeyType(.COSMOS_Secp256k1, "m/44'/118'/0'/0/X")
        accountPrefix = "juno"
        
        grpcHost = "grpc-juno.cosmostation.io"
    }
    
}
