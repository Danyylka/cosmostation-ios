//
//  TxIbcReceiveCell.swift
//  Cosmostation
//
//  Created by yongjoo jung on 2021/07/05.
//  Copyright © 2021 wannabit. All rights reserved.
//

import UIKit

class TxIbcReceiveCell: TxCell {
    @IBOutlet weak var txIcon: UIImageView!
    @IBOutlet weak var senderLabel: UILabel!
    @IBOutlet weak var receipientLabel: UILabel!
    @IBOutlet weak var receivedAmountLabel: UILabel!
    @IBOutlet weak var receivedDenomLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        receivedAmountLabel.font = UIFontMetrics(forTextStyle: .caption1).scaledFont(for: Font_12_caption1)
    }
    
    override func onBindMsg(_ chainConfig: ChainConfig, _ response: Cosmos_Tx_V1beta1_GetTxResponse, _ position: Int) {
        txIcon.image = txIcon.image?.withRenderingMode(.alwaysTemplate)
        txIcon.tintColor = chainConfig.chainColor
        
        let msg = try! Ibc_Core_Channel_V1_MsgRecvPacket.init(serializedData: response.tx.body.messages[position].value)
        if let dicData = try! JSONSerialization.jsonObject(with: msg.packet.data, options: []) as? [String: Any] {
            senderLabel.text = dicData["sender"] as? String
            receipientLabel.text = dicData["receiver"] as? String
            
            var denom = dicData["denom"] as! String
            denom = String(denom.split(separator: "/").last!)
            
            let receivedCoin = Coin.init(denom, dicData["amount"] as! String)
            WDP.dpCoin(chainConfig, receivedCoin, receivedDenomLabel, receivedAmountLabel)
        }
    }
}


