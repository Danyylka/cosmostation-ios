//
//  ChainOkt996Secp.swift
//  Cosmostation
//
//  Created by yongjoo jung on 2023/10/07.
//  Copyright © 2023 wannabit. All rights reserved.
//

import Foundation

class ChainOkt996Secp: BaseChain {
}
/*
 class ChainOkt996Secp: ChainOkt996Keccak {
 
 override init() {
 super.init()
 
 tag = "okt996_Secp"
 
 accountKeyType = AccountKeyType(.COSMOS_Secp256k1, "m/44'/996'/0'/0/X")
 }
 
 override func setInfoWithSeed(_ seed: Data, _ lastPath: String) {
 privateKey = KeyFac.getPriKeyFromSeed(accountKeyType.pubkeyType, seed, getHDPath(lastPath))
 publicKey = KeyFac.getPubKeyFromPrivateKey(privateKey!, accountKeyType.pubkeyType)
 bechAddress = KeyFac.getAddressFromPubKey(publicKey!, accountKeyType.pubkeyType, bechAccountPrefix)
 evmAddress = KeyFac.convertBech32ToEvm(bechAddress)
 //        print("", tag, " ", bechAddress, "  ", evmAddress)
 }
 
 override func setInfoWithPrivateKey(_ priKey: Data) {
 privateKey = priKey
 publicKey = KeyFac.getPubKeyFromPrivateKey(privateKey!, accountKeyType.pubkeyType)
 bechAddress = KeyFac.getAddressFromPubKey(publicKey!, accountKeyType.pubkeyType, bechAccountPrefix)
 evmAddress = KeyFac.convertBech32ToEvm(bechAddress)
 }
 }
 */
