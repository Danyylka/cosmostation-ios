//
//  CommonPoolCell.swift
//  Cosmostation
//
//  Created by 정용주 on 2021/09/06.
//  Copyright © 2021 wannabit. All rights reserved.
//

import UIKit

class CommonPoolCell: UITableViewCell {
    
    @IBOutlet weak var poolPairLabel: UILabel!
    @IBOutlet weak var totalLiquidityValueLabel: UILabel!
    @IBOutlet weak var liquidity1AmountLabel: UILabel!
    @IBOutlet weak var liquidity1DenomLabel: UILabel!
    @IBOutlet weak var liquidity2AmountLabel: UILabel!
    @IBOutlet weak var liquidity2DenomLabel: UILabel!
    
    @IBOutlet weak var availableCoin0AmountLabel: UILabel!
    @IBOutlet weak var availableCoin0DenomLabel: UILabel!
    @IBOutlet weak var availableCoin1AmountLabel: UILabel!
    @IBOutlet weak var availableCoin1DenomLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        
        liquidity1AmountLabel.font = UIFontMetrics(forTextStyle: .footnote).scaledFont(for: Font_13_footnote)
        liquidity2AmountLabel.font = UIFontMetrics(forTextStyle: .footnote).scaledFont(for: Font_13_footnote)
        availableCoin0AmountLabel.font = UIFontMetrics(forTextStyle: .footnote).scaledFont(for: Font_13_footnote)
        availableCoin1AmountLabel.font = UIFontMetrics(forTextStyle: .footnote).scaledFont(for: Font_13_footnote)
    }
    
    func onBindOsmoPoolView(_ pool: Osmosis_Gamm_V1beta1_Pool) {
        //dp pool info
        let coin0 = Coin.init(pool.poolAssets[0].token.denom, pool.poolAssets[0].token.amount)
        let coin1 = Coin.init(pool.poolAssets[1].token.denom, pool.poolAssets[1].token.amount)
        let coin0BaseDenom = BaseData.instance.getBaseDenom(coin0.denom)
        let coin1BaseDenom = BaseData.instance.getBaseDenom(coin1.denom)
        let coin0Symbol = WUtils.getOsmosisTokenName(coin0.denom)
        let coin1Symbol = WUtils.getOsmosisTokenName(coin1.denom)
        let coin0Decimal = WUtils.getOsmosisCoinDecimal(coin0.denom)
        let coin1Decimal = WUtils.getOsmosisCoinDecimal(coin1.denom)
        
        poolPairLabel.text = "#" + String(pool.id) + " " + coin0Symbol + " : " + coin1Symbol
        
        let coin0Value = WUtils.usdValue(coin0BaseDenom, NSDecimalNumber.init(string: coin0.amount), coin0Decimal)
        let coin1Value = WUtils.usdValue(coin1BaseDenom, NSDecimalNumber.init(string: coin1.amount), coin1Decimal)
        let poolValue = coin0Value.adding(coin1Value)
        let nf = WUtils.getNumberFormatter(2)
        let formatted = "$ " + nf.string(from: poolValue)!
        totalLiquidityValueLabel.attributedText = WUtils.getDpAttributedString(formatted, 2, totalLiquidityValueLabel.font)
        
        WUtils.DpOsmosisTokenName(liquidity1DenomLabel, coin0.denom)
        liquidity1DenomLabel.adjustsFontSizeToFitWidth = true
        WUtils.DpOsmosisTokenName(liquidity2DenomLabel, coin1.denom)
        liquidity2DenomLabel.adjustsFontSizeToFitWidth = true
        liquidity1AmountLabel.attributedText = WUtils.displayAmount2(coin0.amount, liquidity1AmountLabel.font, coin0Decimal, 6)
        liquidity2AmountLabel.attributedText = WUtils.displayAmount2(coin1.amount, liquidity2AmountLabel.font, coin1Decimal, 6)
        
        
        //dp available
        let availableCoin0 = BaseData.instance.getAvailable_gRPC(coin0.denom)
        let availableCoin1 = BaseData.instance.getAvailable_gRPC(coin1.denom)
        
        WUtils.DpOsmosisTokenName(availableCoin0DenomLabel, coin0.denom)
        availableCoin0DenomLabel.adjustsFontSizeToFitWidth = true
        WUtils.DpOsmosisTokenName(availableCoin1DenomLabel, coin1.denom)
        availableCoin1DenomLabel.adjustsFontSizeToFitWidth = true
        availableCoin0AmountLabel.attributedText = WUtils.displayAmount2(availableCoin0, availableCoin0AmountLabel.font, coin0Decimal, 6)
        availableCoin1AmountLabel.attributedText = WUtils.displayAmount2(availableCoin1, availableCoin1AmountLabel.font, coin1Decimal, 6)
    }
    
    func onBindKavaPoolView(_ pool: SwapPool) {
        //dp pool info
        let nf = WUtils.getNumberFormatter(2)
        let coin0 = pool.coins[0]
        let coin1 = pool.coins[1]
        let coin0Decimal = WUtils.getKavaCoinDecimal(coin0.denom)
        let coin1Decimal = WUtils.getKavaCoinDecimal(coin1.denom)
        let coin0price = WUtils.getKavaPriceFeed(coin0.denom)
        let coin1price = WUtils.getKavaPriceFeed(coin1.denom)
        let coin0Value = NSDecimalNumber.init(string: coin0.amount).multiplying(by: coin0price).multiplying(byPowerOf10: -coin0Decimal, withBehavior: WUtils.handler2)
        let coin1Value = NSDecimalNumber.init(string: coin1.amount).multiplying(by: coin1price).multiplying(byPowerOf10: -coin1Decimal, withBehavior: WUtils.handler2)

        poolPairLabel.text = coin0.denom.uppercased() + " : " + coin1.denom.uppercased()

        let poolValue = coin0Value.adding(coin1Value)
        let poolValueFormatted = "$ " + nf.string(from: poolValue)!
        totalLiquidityValueLabel.attributedText = WUtils.getDpAttributedString(poolValueFormatted, 2, totalLiquidityValueLabel.font)

        WUtils.DpKavaTokenName(liquidity1DenomLabel, coin0.denom)
        WUtils.DpKavaTokenName(liquidity2DenomLabel, coin1.denom)
        liquidity1AmountLabel.attributedText = WUtils.displayAmount2(coin0.amount, liquidity1AmountLabel.font, coin0Decimal, 6)
        liquidity2AmountLabel.attributedText = WUtils.displayAmount2(coin1.amount, liquidity2AmountLabel.font, coin1Decimal, 6)
        
        
        //dp available
        let availableCoin0 = BaseData.instance.availableAmount(coin0.denom)
        let availableCoin1 = BaseData.instance.availableAmount(coin1.denom)
        
        WUtils.DpKavaTokenName(availableCoin0DenomLabel, coin0.denom)
        WUtils.DpKavaTokenName(availableCoin1DenomLabel, coin1.denom)
        availableCoin0AmountLabel.attributedText = WUtils.displayAmount2(availableCoin0.stringValue, availableCoin0AmountLabel.font, coin0Decimal, 6)
        availableCoin1AmountLabel.attributedText = WUtils.displayAmount2(availableCoin1.stringValue, availableCoin1AmountLabel.font, coin1Decimal, 6)
    }
    
    func onBindGdexPoolView(_ pool: Tendermint_Liquidity_V1beta1_Pool) {
        //dp pool info
        let nf = WUtils.getNumberFormatter(2)
        let coin0Denom = pool.reserveCoinDenoms[0]
        let coin1Denom = pool.reserveCoinDenoms[1]
        let coin0Amount = WUtils.getGdexLpAmount(pool.reserveAccountAddress, coin0Denom)
        let coin1Amount = WUtils.getGdexLpAmount(pool.reserveAccountAddress, coin1Denom)
        let coin0Decimal = WUtils.getCosmosCoinDecimal(coin0Denom)
        let coin1Decimal = WUtils.getCosmosCoinDecimal(coin1Denom)
        
        poolPairLabel.text = WUtils.getCosmosTokenName(coin0Denom) + " : " + WUtils.getCosmosTokenName(coin1Denom)
        
        let poolValue = WUtils.getGdexPoolValue(pool)
        let poolValueFormatted = "$ " + nf.string(from: poolValue)!
        totalLiquidityValueLabel.attributedText = WUtils.getDpAttributedString(poolValueFormatted, 2, totalLiquidityValueLabel.font)
        
        WUtils.DpCosmosTokenName(liquidity1DenomLabel, coin0Denom)
        WUtils.DpCosmosTokenName(liquidity2DenomLabel, coin1Denom)
        liquidity1AmountLabel.attributedText = WUtils.displayAmount2(coin0Amount.stringValue, liquidity1AmountLabel.font, coin0Decimal, 6)
        liquidity2AmountLabel.attributedText = WUtils.displayAmount2(coin1Amount.stringValue, liquidity2AmountLabel.font, coin1Decimal, 6)
        
        
        //dp available
        let availableCoin0 = BaseData.instance.getAvailable_gRPC(coin0Denom)
        let availableCoin1 = BaseData.instance.getAvailable_gRPC(coin1Denom)
        
        WUtils.DpCosmosTokenName(availableCoin0DenomLabel, coin0Denom)
        availableCoin0DenomLabel.adjustsFontSizeToFitWidth = true
        WUtils.DpCosmosTokenName(availableCoin1DenomLabel, coin1Denom)
        availableCoin1DenomLabel.adjustsFontSizeToFitWidth = true
        availableCoin0AmountLabel.attributedText = WUtils.displayAmount2(availableCoin0, availableCoin0AmountLabel.font, coin0Decimal, 6)
        availableCoin1AmountLabel.attributedText = WUtils.displayAmount2(availableCoin1, availableCoin1AmountLabel.font, coin1Decimal, 6)
        
    }
}
