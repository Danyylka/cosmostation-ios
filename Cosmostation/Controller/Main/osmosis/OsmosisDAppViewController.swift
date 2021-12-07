//
//  OsmosisDAppViewController.swift
//  Cosmostation
//
//  Created by 정용주 on 2021/07/10.
//  Copyright © 2021 wannabit. All rights reserved.
//

import UIKit

class OsmosisDAppViewController: BaseViewController {
    
    @IBOutlet weak var dAppsSegment: UISegmentedControl!
    @IBOutlet weak var swapView: UIView!
    @IBOutlet weak var poolView: UIView!
    @IBOutlet weak var farmingView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        swapView.alpha = 1
        poolView.alpha = 0
        farmingView.alpha = 0
    
        self.account = BaseData.instance.selectAccountById(id: BaseData.instance.getRecentAccountId())
        self.chainType = WUtils.getChainType(account!.account_base_chain)
        
        if #available(iOS 13.0, *) {
            dAppsSegment.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
            dAppsSegment.setTitleTextAttributes([.foregroundColor: UIColor.gray], for: .normal)
            dAppsSegment.selectedSegmentTintColor = TRANS_BG_COLOR_OSMOSIS2
            
        } else {
            dAppsSegment.tintColor = COLOR_OSMOSIS
        }
    }
    
    @IBAction func switchView(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            swapView.alpha = 1
            poolView.alpha = 0
            farmingView.alpha = 0
        } else if sender.selectedSegmentIndex == 1 {
            swapView.alpha = 0
            poolView.alpha = 1
            farmingView.alpha = 0
        } else if sender.selectedSegmentIndex == 2 {
            swapView.alpha = 0
            poolView.alpha = 0
            farmingView.alpha = 1
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.navigationController?.navigationBar.topItem?.title = NSLocalizedString("title_dapp_osmosis", comment: "");
        self.navigationItem.title = NSLocalizedString("title_dapp_osmosis", comment: "");
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }

}

extension WUtils {
    static func DpOsmosisTokenImg(_ imgView: UIImageView, _ denom: String) {
        if (denom == OSMOSIS_MAIN_DENOM) {
            imgView.image = UIImage(named: "tokenOsmosis")
            
        } else if (denom == OSMOSIS_ION_DENOM) {
            imgView.image = UIImage(named: "tokenIon")
            
        } else if (denom.starts(with: "gamm/pool/")) {
            imgView.image = UIImage(named: "tokenPool")
            
        } else if (denom.starts(with: "ibc/")) {
            if let ibcToken = BaseData.instance.getIbcToken(denom.replacingOccurrences(of: "ibc/", with: "")) {
                imgView.af_setImage(withURL: URL(string: ibcToken.moniker!)!)
            } else {
                imgView.image = UIImage(named: "tokenDefaultIbc")
            }
        }
    }
    
    static func DpOsmosisTokenName(_ label: UILabel, _ denom: String) {
        if (denom == OSMOSIS_MAIN_DENOM) {
            label.textColor = COLOR_OSMOSIS
            label.text = "OSMO"
            
        } else if (denom == OSMOSIS_ION_DENOM) {
            label.textColor = COLOR_ION
            label.text = "ION"
            
        } else if (denom.starts(with: "gamm/pool/")) {
            label.textColor = .white
            label.text = "GAMM-" + String(denom.split(separator: "/").last!)
            
        } else if (denom.starts(with: "ibc/")) {
            label.textColor = .white
            if let ibcToken = BaseData.instance.getIbcToken(denom.replacingOccurrences(of: "ibc/", with: "")) {
                label.text = ibcToken.display_denom?.uppercased()
            } else {
                label.text = "UnKnown"
            }
        }
    }
    
    static func getOsmosisTokenImg(_ denom: String) -> UIImage? {
        if (denom == OSMOSIS_MAIN_DENOM) {
            return UIImage(named: "tokenOsmosis")
            
        } else if (denom == OSMOSIS_ION_DENOM) {
            return UIImage(named: "tokenIon")
            
        } else if (denom.starts(with: "gamm/pool/")) {
            return UIImage(named: "tokenPool")
            
        } else if (denom.starts(with: "ibc/")) {
            if let ibcToken = BaseData.instance.getIbcToken(denom.replacingOccurrences(of: "ibc/", with: "")), let url = URL(string: ibcToken.moniker!), let data = try? Data(contentsOf: url) {
                return UIImage(data: data)?.resized(to: CGSize(width: 20, height: 20))
            }
        }
        return UIImage(named: "tokenDefaultIbc")
            
    }
    
    static func getOsmosisTokenName(_ denom: String) -> String {
        if (denom == OSMOSIS_MAIN_DENOM) {
            return "OSMO"
            
        } else if (denom == OSMOSIS_ION_DENOM) {
            return "ION"
            
        } else if (denom.starts(with: "gamm/pool/")) {
            return "GAMM-" + String(denom.split(separator: "/").last!)
            
        } else if (denom.starts(with: "ibc/")) {
            if let ibcToken = BaseData.instance.getIbcToken(denom.replacingOccurrences(of: "ibc/", with: "")) {
                return  ibcToken.display_denom!.uppercased()
            } else {
                return"UnKnown"
            }
        }
        return denom
    }
    
    static func getOsmosisCoinDecimal(_ denom: String?) -> Int16 {
        if (denom?.caseInsensitiveCompare(OSMOSIS_MAIN_DENOM) == .orderedSame) { return 6; }
        else if (denom?.caseInsensitiveCompare(OSMOSIS_ION_DENOM) == .orderedSame) { return 6; }
        else if (denom!.starts(with: "gamm/pool/")) { return 18; }
        else if (denom!.starts(with: "ibc/")) {
            if let ibcToken = BaseData.instance.getIbcToken(denom!.replacingOccurrences(of: "ibc/", with: "")), let deciaml = ibcToken.decimal {
                return deciaml
            }
        }
        return 6;
    }
    
    static func getGaugesByPoolId(_ poolId: UInt64, _ incentivizedPools: Array<Osmosis_Poolincentives_V1beta1_IncentivizedPool>, _ allGauge: Array<Osmosis_Incentives_Gauge>) -> Array<Osmosis_Incentives_Gauge> {
        var gaugeIds = Array<UInt64>()
        var result = Array<Osmosis_Incentives_Gauge>()
        incentivizedPools.forEach { incentivizedPool in
            if (incentivizedPool.poolID == poolId) {
                gaugeIds.append(incentivizedPool.gaugeID)
            }
        }
        allGauge.forEach { gauge in
            if (gaugeIds.contains(gauge.id)){
                result.append(gauge)
            }
        }
        return result
    }
    
    static func getLockupByPoolId(_ poolId: UInt64, _ lockUps: Array<Osmosis_Lockup_PeriodLock>) -> Array<Osmosis_Lockup_PeriodLock> {
        var result = Array<Osmosis_Lockup_PeriodLock>()
        lockUps.forEach { lockup in
            let lpCoin = Coin.init(lockup.coins[0].denom, lockup.coins[0].amount)
            if (lpCoin.osmosisAmmPoolId() == poolId) {
                result.append(lockup)
            }
        }
        return result
    }
    
    static func isAssetHasDenom(_ assets: [Osmosis_Gamm_V1beta1_PoolAsset], _ denom: String?) -> Bool {
        guard let token = assets.filter({ $0.token.denom == denom }).first else {
            return false
        }
        return true
    }
    
    static func getOsmoLpTokenPerUsdPrice(_ pool: Osmosis_Gamm_V1beta1_BalancerPool) -> NSDecimalNumber {
        let coin0 = Coin.init(pool.poolAssets[0].token.denom, pool.poolAssets[0].token.amount)
        let coin1 = Coin.init(pool.poolAssets[1].token.denom, pool.poolAssets[1].token.amount)
        let coin0Value = WUtils.usdValue(BaseData.instance.getBaseDenom(coin0.denom), NSDecimalNumber.init(string: coin0.amount), WUtils.getOsmosisCoinDecimal(coin0.denom))
        let coin1Value = WUtils.usdValue(BaseData.instance.getBaseDenom(coin1.denom), NSDecimalNumber.init(string: coin1.amount), WUtils.getOsmosisCoinDecimal(coin1.denom))
        let poolValue = coin0Value.adding(coin1Value)
        let totalShare = NSDecimalNumber.init(string: pool.totalShares.amount).multiplying(byPowerOf10: -18, withBehavior: handler18)
        return poolValue.dividing(by: totalShare, withBehavior: handler18)
    }
    
    static func getPoolValue(_ pool: Osmosis_Gamm_V1beta1_BalancerPool) -> NSDecimalNumber {
        let coin0 = Coin.init(pool.poolAssets[0].token.denom, pool.poolAssets[0].token.amount)
        let coin1 = Coin.init(pool.poolAssets[1].token.denom, pool.poolAssets[1].token.amount)
        let coin0BaseDenom = BaseData.instance.getBaseDenom(coin0.denom)
        let coin1BaseDenom = BaseData.instance.getBaseDenom(coin1.denom)
        let coin0Decimal = getOsmosisCoinDecimal(coin0.denom)
        let coin1Decimal = getOsmosisCoinDecimal(coin1.denom)
        let coin0Value = usdValue(coin0BaseDenom, NSDecimalNumber.init(string: coin0.amount), coin0Decimal)
        let coin1Value = usdValue(coin1BaseDenom, NSDecimalNumber.init(string: coin1.amount), coin1Decimal)
        return coin0Value.adding(coin1Value)
    }
    
    static func getMyShareLpAmount(_ pool: Osmosis_Gamm_V1beta1_BalancerPool, _ denom: String) -> NSDecimalNumber {
        var result = NSDecimalNumber.zero
        let myShare = BaseData.instance.getAvailableAmount_gRPC("gamm/pool/" + String(pool.id))
        if let totalLpCoin = pool.poolAssets.filter { $0.token.denom == denom }.first?.token.amount {
            result = (NSDecimalNumber.init(string: totalLpCoin)).multiplying(by: myShare).dividing(by: NSDecimalNumber.init(string: pool.totalShares.amount), withBehavior: handler18)
        }
        return result
    }
    
    static func getNextIncentiveAmount(_ pool: Osmosis_Gamm_V1beta1_BalancerPool, _ gauges: Array<Osmosis_Incentives_Gauge>, _ position: UInt) -> NSDecimalNumber  {
        if (gauges.count != 3 || gauges[0].distributedCoins.count <= 0 || gauges[1].distributedCoins.count <= 0 || gauges[2].distributedCoins.count <= 0) { return NSDecimalNumber.zero }
        let incentive1Day = NSDecimalNumber.init(string: gauges[0].coins[0].amount).subtracting(NSDecimalNumber.init(string: gauges[0].distributedCoins[0].amount))
        let incentive7Day = NSDecimalNumber.init(string: gauges[1].coins[0].amount).subtracting(NSDecimalNumber.init(string: gauges[1].distributedCoins[0].amount))
        let incentive14Day = NSDecimalNumber.init(string: gauges[2].coins[0].amount).subtracting(NSDecimalNumber.init(string: gauges[2].distributedCoins[0].amount))
        if (position == 0) {
            return incentive1Day
        } else if (position == 1) {
            return incentive1Day.adding(incentive7Day)
        } else {
            return incentive1Day.adding(incentive7Day).adding(incentive14Day)
        }
    }
    
    static func getPoolArp(_ pool: Osmosis_Gamm_V1beta1_BalancerPool, _ gauges: Array<Osmosis_Incentives_Gauge>, _ position: UInt) -> NSDecimalNumber  {
        let poolValue = getPoolValue(pool)
        let incentiveAmount = getNextIncentiveAmount(pool, gauges, position)
        let incentiveValue = WUtils.usdValue(BaseData.instance.getBaseDenom(OSMOSIS_MAIN_DENOM), incentiveAmount, WUtils.getOsmosisCoinDecimal(OSMOSIS_MAIN_DENOM))
        return incentiveValue.multiplying(by: NSDecimalNumber.init(value: 36500)).dividing(by: poolValue, withBehavior: WUtils.handler12)
    }
    
}

extension UIImage {
    func resized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
