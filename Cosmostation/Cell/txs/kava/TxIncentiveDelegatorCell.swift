//
//  TxIncentiveDelegatorCell.swift
//  Cosmostation
//
//  Created by 정용주 on 2021/08/31.
//  Copyright © 2021 wannabit. All rights reserved.
//

import UIKit

class TxIncentiveDelegatorCell: TxCell {
    @IBOutlet weak var txIcon: UIImageView!
    @IBOutlet weak var sender: UILabel!
    @IBOutlet weak var multiplier: UILabel!
    @IBOutlet weak var kavaAmountLabel: UILabel!
    @IBOutlet weak var hardAmountLabel: UILabel!
    @IBOutlet weak var swpAmountLabel: UILabel!
    @IBOutlet weak var usdxAmountLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    override func onBindMsg(_ chain: ChainType, _ response: Cosmos_Tx_V1beta1_GetTxResponse, _ position: Int) {
        txIcon.image = txIcon.image?.withRenderingMode(.alwaysTemplate)
        txIcon.tintColor = WUtils.getChainColor(chain)
        
        //temp
        kavaAmountLabel.isHidden = true
        hardAmountLabel.isHidden = true
        swpAmountLabel.isHidden = true
        usdxAmountLabel.isHidden = true
        
        if let msg = try? Kava_Incentive_V1beta1_MsgClaimDelegatorReward.init(serializedData: response.tx.body.messages[position].value) {
            sender.text = msg.sender
            multiplier.text = msg.denomsToClaim[0].multiplierName
        }
    }
    
    func onBind(_ chaintype: ChainType, _ msg: Msg, _ tx: TxInfo, _ position: Int) {
        txIcon.image = txIcon.image?.withRenderingMode(.alwaysTemplate)
        txIcon.tintColor = WUtils.getChainColor(chaintype)
        
        sender.text = msg.value.sender
        multiplier.text = msg.value.denoms_to_claim?[0].multiplier_name
        
        let incentiveCoins = tx.simpleIncentives(position)
        if let kavaToken = incentiveCoins.filter({ $0.denom == KAVA_MAIN_DENOM }).first {
            kavaAmountLabel.attributedText = WUtils.displayAmount2(kavaToken.amount, kavaAmountLabel.font!, 6, 6)
        } else {
            kavaAmountLabel.attributedText = WUtils.displayAmount2("0", kavaAmountLabel.font!, 6, 6)
        }
        if let hardToken = incentiveCoins.filter({ $0.denom == KAVA_HARD_DENOM }).first {
            hardAmountLabel.attributedText = WUtils.displayAmount2(hardToken.amount, hardAmountLabel.font!, 6, 6)
        } else {
            hardAmountLabel.attributedText = WUtils.displayAmount2("0", hardAmountLabel.font!, 6, 6)
        }
        if let swpToken = incentiveCoins.filter({ $0.denom == KAVA_SWAP_DENOM }).first {
            swpAmountLabel.attributedText = WUtils.displayAmount2(swpToken.amount, swpAmountLabel.font!, 6, 6)
        } else {
            swpAmountLabel.attributedText = WUtils.displayAmount2("0", swpAmountLabel.font!, 6, 6)
        }
        if let usdxToken = incentiveCoins.filter({ $0.denom == KAVA_USDX_DENOM }).first {
            usdxAmountLabel.attributedText = WUtils.displayAmount2(usdxToken.amount, usdxAmountLabel.font!, 6, 6)
        } else {
            usdxAmountLabel.attributedText = WUtils.displayAmount2("0", usdxAmountLabel.font!, 6, 6)
        }
    }
    
}
