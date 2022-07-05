//
//  TxLockTokenCell.swift
//  Cosmostation
//
//  Created by yongjoo jung on 2021/07/05.
//  Copyright © 2021 wannabit. All rights reserved.
//

import UIKit

class TxLockTokenCell: TxCell {
    @IBOutlet weak var txIcon: UIImageView!
    @IBOutlet weak var txOwenerLabel: UILabel!
    @IBOutlet weak var txDurationLabel: UILabel!
    @IBOutlet weak var txLockDenomLabel: UILabel!
    @IBOutlet weak var txLockAmountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        
        txLockAmountLabel.font = UIFontMetrics(forTextStyle: .caption1).scaledFont(for: Font_12_caption1)
    }
    
    override func onBindMsg(_ chainConfig: ChainConfig, _ response: Cosmos_Tx_V1beta1_GetTxResponse, _ position: Int) {
        txIcon.image = txIcon.image?.withRenderingMode(.alwaysTemplate)
        txIcon.tintColor = chainConfig.chainColor
        
        let msg = try! Osmosis_Lockup_MsgLockTokens.init(serializedData: response.tx.body.messages[position].value)
        
        txOwenerLabel.text = msg.owner
        txOwenerLabel.adjustsFontSizeToFitWidth = true
        
        let durationDay = msg.duration.seconds / 86400
        txDurationLabel.text = String(durationDay) + " days"
        
        let coinLock = Coin.init(msg.coins[0].denom, msg.coins[0].amount)
        WDP.dpCoin(chainConfig, coinLock, txLockDenomLabel, txLockAmountLabel)
    }
    
}
