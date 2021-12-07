//
//  KeyFac.swift
//  Cosmostation
//
//  Created by 정용주 on 2021/07/08.
//  Copyright © 2021 wannabit. All rights reserved.
//

import Foundation

class KeyFac {
    
    static func getDpAddressPath(_ mnemonic: [String], _ path:Int, _ chain:ChainType, _ newbip:Bool) -> String {
        var resultAddress = ""
        if (BaseData.instance.getUsingEnginerMode()) {
            resultAddress = CKey.getDpAddressPath(mnemonic, path, chain, newbip)
        } else {
            resultAddress = WKey.getDpAddressPath(mnemonic, path, chain, newbip)
        }
        return resultAddress
    }
    
    static func getDpAddressFetchCustomPath(_ mnemonic: [String], _ path: UInt32, _ chain: ChainType, _ pathType: Int) -> String {
        var resultAddress = ""
        if (BaseData.instance.getUsingEnginerMode()) {
            resultAddress = CKey.getDpAddressFetchCustomPath(mnemonic, path, chain, pathType)
        } else {
            resultAddress = WKey.getDpAddressFetchCustomPath(mnemonic, path, chain, pathType)
        }
        return resultAddress
    }
    
    static func getPrivateRaw(_ mnemonic: [String], _ account: Account) -> Data {
        if (BaseData.instance.getUsingEnginerMode()) {
            return CKey.getPrivateRaw(mnemonic, account)
        } else {
            return WKey.getPrivateRaw(mnemonic, account)
        }
    }
    
    static func getPublicRaw(_ mnemonic: [String], _ account: Account) -> Data {
        if (BaseData.instance.getUsingEnginerMode()) {
            return CKey.getPublicRaw(mnemonic, account)
        } else {
            return WKey.getPublicRaw(mnemonic, account)
        }
    }
    
    static func getStdTx(_ words: [String], _ msgList: Array<Msg>, _ stdMsg: StdSignMsg, _ account: Account, _ fee: Fee, _ memo: String) -> StdTx {
        if (BaseData.instance.getUsingEnginerMode()) {
            return CKey.getStdTx(words, msgList, stdMsg, account, fee, memo)
        } else {
            return WKey.getStdTx(words, msgList, stdMsg, account, fee, memo)
        }
    }
    
    static func isValidStringPrivateKey(_ input: String) -> Bool {
        let pKeyRegEx = "^(0x|0X)?[a-fA-F0-9]{64}"
        let pKeyPred = NSPredicate(format:"SELF MATCHES %@", pKeyRegEx)
        return pKeyPred.evaluate(with: input)
    }
    
    static func getPrivateFromString(_ hexInput: String) -> Data {
        if (hexInput.starts(with: "0x") || hexInput.starts(with: "0X")) {
            return hexInput.substring(from: 2).hexadecimal!
        }
        return hexInput.hexadecimal!
    }
    
    static func getPublicFromString(_ hexInput: String) -> Data {
        let privateKey = getPrivateFromString(hexInput)
        return getPublicFromPrivateKey(privateKey)
    }
    
    static func getPublicFromPrivateKey(_ dataInput: Data) -> Data {
        return WKey.getPublicFromString(dataInput)
    }
    
}
