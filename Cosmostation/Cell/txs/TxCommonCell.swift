//
//  TxCommonCell.swift
//  Cosmostation
//
//  Created by 정용주 on 2020/02/12.
//  Copyright © 2020 wannabit. All rights reserved.
//

import UIKit

class TxCommonCell: TxCell {

    @IBOutlet weak var statusImg: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var errorMsg: EdgeInsetLabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var msgCntLabel: UILabel!
    @IBOutlet weak var gasAmountLabel: UILabel!
    
    @IBOutlet weak var feeLayer: UIView!
    @IBOutlet weak var feeAmountLabel: UILabel!
    @IBOutlet weak var feeDenomLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timeGapLabel: UILabel!
    @IBOutlet weak var hashLabel: UILabel!
    @IBOutlet weak var memoLabel: UILabel!
    
    @IBOutlet weak var errorConstraint: NSLayoutConstraint!
    @IBOutlet weak var successConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        
        statusLabel.font = UIFontMetrics(forTextStyle: .caption1).scaledFont(for: Font_12_caption1)
        heightLabel.font = UIFontMetrics(forTextStyle: .caption1).scaledFont(for: Font_12_caption1)
        msgCntLabel.font = UIFontMetrics(forTextStyle: .caption1).scaledFont(for: Font_12_caption1)
        gasAmountLabel.font = UIFontMetrics(forTextStyle: .caption1).scaledFont(for: Font_12_caption1)
        feeAmountLabel.font = UIFontMetrics(forTextStyle: .caption1).scaledFont(for: Font_12_caption1)
        timeLabel.font = UIFontMetrics(forTextStyle: .caption1).scaledFont(for: Font_12_caption1)
        timeGapLabel.font = UIFontMetrics(forTextStyle: .caption2).scaledFont(for: Font_11_caption2)
    }
    
    func setDenomType(_ chainConfig: ChainConfig) {
        WUtils.setDenomTitle(chainConfig.chainType, feeDenomLabel)
    }
    
    override func onBind(_ chainConfig: ChainConfig, _ tx: Cosmos_Tx_V1beta1_GetTxResponse) {
        feeLayer.isHidden = false
        if (tx.txResponse.code != 0) {
            statusImg.image = UIImage(named: "failIc")
            errorMsg.text = tx.txResponse.rawLog
            errorMsg.isHidden = false
            errorConstraint.priority = .defaultHigh
            successConstraint.priority = .defaultLow
        } else {
            statusImg.image = UIImage(named: "successIc")
            statusLabel.text = NSLocalizedString("tx_success", comment: "")
            errorMsg.isHidden = true
            errorConstraint.priority = .defaultLow
            successConstraint.priority = .defaultHigh
        }
        heightLabel.text = String(tx.txResponse.height)
        msgCntLabel.text = String(tx.tx.body.messages.count)
        gasAmountLabel.text = String(tx.txResponse.gasUsed) + " / " + String(tx.txResponse.gasWanted)
        timeLabel.text = WUtils.txTimetoString(input: tx.txResponse.timestamp)
        timeGapLabel.text = WUtils.txTimeGap(input: tx.txResponse.timestamp)
        hashLabel.text = tx.txResponse.txhash
        memoLabel.text = tx.tx.body.memo
        WDP.dpCoin(chainConfig, WUtils.onParseFeeGrpc(chainConfig.chainType, tx), feeDenomLabel, feeAmountLabel)
    }
}
