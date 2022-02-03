//
//  Cw20Token.swift
//  Cosmostation
//
//  Created by yongjoo jung on 2022/01/29.
//  Copyright © 2022 wannabit. All rights reserved.
//

import Foundation

public class Cw20Token {
    var id: Int64?
    var contract_address: String?
    var denom: String = ""
    var decimal: Int16 = 6
    var display: Int64?
    var logo: String = ""
    var amount: String = "0"
    
    init(_ dictionary: NSDictionary?) {
        self.id = dictionary?["id"] as? Int64
        self.contract_address = dictionary?["contract_address"] as? String
        self.denom = dictionary?["denom"] as? String ?? ""
        self.decimal = dictionary?["decimal"] as? Int16 ?? 6
        self.display = dictionary?["display"] as? Int64
        self.logo = dictionary?["logo"] as? String ?? ""
    }
    
    func setAmount(_ rawAmount: String) {
        self.amount = rawAmount
    }
    
    func getAmount() -> NSDecimalNumber {
        return NSDecimalNumber.init(string: amount)
    }
    
    func getImgUrl() -> URL {
        if let rawUrl = URL(string: logo) {
            return rawUrl
        }
        return URL(string: "https://raw.githubusercontent.com/cosmostation/cosmostation_token_resource/master/coin_image/juno/cw20/cw20-unknown.png")!
    }
}
