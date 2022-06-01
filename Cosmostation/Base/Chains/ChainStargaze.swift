//
//  ChainStargaze.swift
//  Cosmostation
//
//  Created by yongjoo jung on 2022/05/10.
//  Copyright © 2022 wannabit. All rights reserved.
//

import UIKit
import Foundation

class ChainStargaze: ChainConfig {
    var chainType = ChainType.STARGAZE_MAIN
    var chainImg = UIImage(named: "chainStargaze")
    var chainInfoImg = UIImage(named: "infoiconStargaze")
    var chainInfoTitle = NSLocalizedString("send_guide_title_stargaze", comment: "")
    var chainInfoMsg = NSLocalizedString("send_guide_msg_stargaze", comment: "")
    var stakeDenomImg = UIImage(named: "tokenStargaze")
    var stakeDenom = "ustars"
    var stakeSymbol = "STARS"
    var accountPrefix = "stars"
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
