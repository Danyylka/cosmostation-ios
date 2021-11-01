//
//  WalletCosmosCell.swift
//  Cosmostation
//
//  Created by yongjoo on 27/09/2019.
//  Copyright © 2019 wannabit. All rights reserved.
//

import UIKit

class WalletCosmosCell: UITableViewCell {
    
    @IBOutlet weak var denomTitle: UILabel!
    @IBOutlet weak var totalAmount: UILabel!
    @IBOutlet weak var totalValue: UILabel!
    @IBOutlet weak var availableAmount: UILabel!
    @IBOutlet weak var delegatedAmount: UILabel!
    @IBOutlet weak var unbondingAmount: UILabel!
    @IBOutlet weak var rewardAmount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        availableAmount.font = UIFontMetrics(forTextStyle: .footnote).scaledFont(for: Font_13_footnote)
        delegatedAmount.font = UIFontMetrics(forTextStyle: .footnote).scaledFont(for: Font_13_footnote)
        unbondingAmount.font = UIFontMetrics(forTextStyle: .footnote).scaledFont(for: Font_13_footnote)
        rewardAmount.font = UIFontMetrics(forTextStyle: .footnote).scaledFont(for: Font_13_footnote)
    }
    
    var actionDelegate: (() -> Void)? = nil
    var actionVote: (() -> Void)? = nil
    var actionGravity: (() -> Void)? = nil
    var actionWalletConnect: (() -> Void)? = nil
    
    @IBAction func onClickDelegate(_ sender: Any) {
        actionDelegate?()
    }
    @IBAction func onClickVote(_ sender: Any) {
        actionVote?()
    }
    @IBAction func onClickGravityDex(_ sender: Any) {
        actionGravity?()
    }
    @IBAction func onClickWalletConnect(_ sender: Any) {
        actionWalletConnect?()
    }
    
    func updateView(_ account: Account?, _ chainType: ChainType?) {
        if (chainType == ChainType.COSMOS_MAIN) {
            denomTitle.text = "ATOM"
            let totalAtom = WUtils.getAllMainAsset(COSMOS_MAIN_DENOM)
            totalAmount.attributedText = WUtils.displayAmount2(totalAtom.stringValue, totalAmount.font!, 6, 6)
            totalValue.attributedText = WUtils.dpUserCurrencyValue(COSMOS_MAIN_DENOM, totalAtom, 6, totalValue.font)
            availableAmount.attributedText = WUtils.displayAmount2(BaseData.instance.getAvailable_gRPC(COSMOS_MAIN_DENOM), availableAmount.font!, 6, 6)
            delegatedAmount.attributedText = WUtils.displayAmount2(BaseData.instance.getDelegatedSum_gRPC(), delegatedAmount.font!, 6, 6)
            unbondingAmount.attributedText = WUtils.displayAmount2(BaseData.instance.getUnbondingSum_gRPC(), unbondingAmount.font, 6, 6)
            rewardAmount.attributedText = WUtils.displayAmount2(BaseData.instance.getRewardSum_gRPC(COSMOS_MAIN_DENOM), rewardAmount.font, 6, 6)
            BaseData.instance.updateLastTotal(account, totalAtom.multiplying(byPowerOf10: -6).stringValue)
            
        } else if (chainType == ChainType.COSMOS_TEST) {
            denomTitle.text = "MUON"
            let totalAtom = WUtils.getAllMainAsset(COSMOS_TEST_DENOM)
            totalAmount.attributedText = WUtils.displayAmount2(totalAtom.stringValue, totalAmount.font!, 6, 6)
            totalValue.attributedText = WUtils.dpUserCurrencyValue(COSMOS_TEST_DENOM, totalAtom, 6, totalValue.font)
            availableAmount.attributedText = WUtils.displayAmount2(BaseData.instance.getAvailable_gRPC(COSMOS_TEST_DENOM), availableAmount.font!, 6, 6)
            delegatedAmount.attributedText = WUtils.displayAmount2(BaseData.instance.getDelegatedSum_gRPC(), delegatedAmount.font!, 6, 6)
            unbondingAmount.attributedText = WUtils.displayAmount2(BaseData.instance.getUnbondingSum_gRPC(), unbondingAmount.font, 6, 6)
            rewardAmount.attributedText = WUtils.displayAmount2(BaseData.instance.getRewardSum_gRPC(COSMOS_TEST_DENOM), rewardAmount.font, 6, 6)
            BaseData.instance.updateLastTotal(account, totalAtom.multiplying(byPowerOf10: -6).stringValue)
            
        }
        
        
    }
    
}
