//
//  WalletCrytoCell.swift
//  Cosmostation
//
//  Created by 정용주 on 2021/04/14.
//  Copyright © 2021 wannabit. All rights reserved.
//

import UIKit

class WalletCrytoCell: UITableViewCell {
    
    @IBOutlet weak var rootCardView: CardView!
    @IBOutlet weak var totalAmount: UILabel!
    @IBOutlet weak var totalValue: UILabel!
    @IBOutlet weak var availableAmount: UILabel!
    @IBOutlet weak var delegatedAmount: UILabel!
    @IBOutlet weak var unbondingAmount: UILabel!
    @IBOutlet weak var rewardAmount: UILabel!
    @IBOutlet weak var vestingAmount: UILabel!
    @IBOutlet weak var vestingLayer: UIView!
    @IBOutlet weak var btnDelegate: UIButton!
    @IBOutlet weak var btnProposal: UIButton!
    @IBOutlet weak var btnNtf: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        availableAmount.font = UIFontMetrics(forTextStyle: .footnote).scaledFont(for: Font_13_footnote)
        vestingAmount.font = UIFontMetrics(forTextStyle: .footnote).scaledFont(for: Font_13_footnote)
        delegatedAmount.font = UIFontMetrics(forTextStyle: .footnote).scaledFont(for: Font_13_footnote)
        unbondingAmount.font = UIFontMetrics(forTextStyle: .footnote).scaledFont(for: Font_13_footnote)
        rewardAmount.font = UIFontMetrics(forTextStyle: .footnote).scaledFont(for: Font_13_footnote)
    }
    
    var actionDelegate: (() -> Void)? = nil
    var actionVote: (() -> Void)? = nil
    var actionNFT: (() -> Void)? = nil
    
    @IBAction func onClickDelegate(_ sender: Any) {
        actionDelegate?()
    }
    @IBAction func onClickVote(_ sender: Any) {
        actionVote?()
    }
    @IBAction func onClickNFT(_ sender: UIButton) {
        actionNFT?()
    }
    
    override func prepareForReuse() {
        vestingLayer.isHidden = true
    }
    
    func updateView(_ account: Account?, _ chainType: ChainType?) {
        let totalToken = WUtils.getAllMainAsset(CRYPTO_MAIN_DENOM)
        totalAmount.attributedText = WUtils.displayAmount2(totalToken.stringValue, totalAmount.font!, 8, 6)
        totalValue.attributedText = WUtils.dpUserCurrencyValue(CRYPTO_MAIN_DENOM, totalToken, 8, totalValue.font)
        availableAmount.attributedText = WUtils.displayAmount2(BaseData.instance.getAvailable_gRPC(CRYPTO_MAIN_DENOM), availableAmount.font!, 8, 6)
        delegatedAmount.attributedText = WUtils.displayAmount2(BaseData.instance.getDelegatedSum_gRPC(), delegatedAmount.font!, 8, 6)
        unbondingAmount.attributedText = WUtils.displayAmount2(BaseData.instance.getUnbondingSum_gRPC(), unbondingAmount.font, 8, 6)
        rewardAmount.attributedText = WUtils.displayAmount2(BaseData.instance.getRewardSum_gRPC(CRYPTO_MAIN_DENOM), rewardAmount.font, 8, 6)
        
        let vesting = BaseData.instance.getVestingAmount_gRPC(CRYPTO_MAIN_DENOM)
        if (vesting.compare(NSDecimalNumber.zero).rawValue > 0) {
            vestingLayer.isHidden = false
            vestingAmount.attributedText = WUtils.displayAmount2(BaseData.instance.getVesting_gRPC(CRYPTO_MAIN_DENOM), vestingAmount.font!, 8, 6)
        }
        BaseData.instance.updateLastTotal(account, totalToken.multiplying(byPowerOf10: -8).stringValue)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        btnDelegate.borderColor = UIColor.init(named: "_font05")
        btnProposal.borderColor = UIColor.init(named: "_font05")
        btnNtf.borderColor = UIColor.init(named: "_font05")
    }
    
}
