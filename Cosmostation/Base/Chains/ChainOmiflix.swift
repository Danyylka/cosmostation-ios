//
//  ChainOmiflix.swift
//  Cosmostation
//
//  Created by yongjoo jung on 2022/05/10.
//  Copyright © 2022 wannabit. All rights reserved.
//

import UIKit
import Foundation

class ChainOmniflix: ChainConfig {
    var chainType = ChainType.OMNIFLIX_MAIN
    var chainImg = UIImage(named: "chainOmniflix")
    var chainInfoImg = UIImage(named: "infoiconOmniflix")
    var chainInfoTitle = NSLocalizedString("send_guide_title_omniflix", comment: "")
    var chainInfoMsg = NSLocalizedString("send_guide_msg_omniflix", comment: "")
    var stakeDenomImg = UIImage(named: "tokenOmniflix")
    var stakeDenom = "uflix"
    var stakeSymbol = "FLIX"
    var accountPrefix = "omniflix"
    var hdPath0 = "m/44'/118'/0'/0/X"
    
    required init(_ chainType: ChainType) {
        self.chainType = chainType
    }
    
    func supportHdPaths() -> Array<String> {
        return [hdPath0]
    }
    
    func getHdPath(_ type: Int, _ path: Int) -> String {
        supportHdPaths()[type].replacingOccurrences(of: "X", with: String(path))
    }
    
    func getDpAddress(_ words: MWords, _ type: Int, _ path: Int) -> String {
        return ""
    }
}

