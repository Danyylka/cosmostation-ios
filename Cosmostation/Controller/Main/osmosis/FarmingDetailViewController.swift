//
//  FarmingDetailViewController.swift
//  Cosmostation
//
//  Created by 정용주 on 2021/08/14.
//  Copyright © 2021 wannabit. All rights reserved.
//

import UIKit
import SwiftProtobuf

class FarmingDetailViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var loadingImg: LoadingImageView!
    @IBOutlet weak var farmDetailTableView: UITableView!
    
    @IBOutlet weak var topPoolIDLabel: UILabel!
    @IBOutlet weak var topPoolPairLabel: UILabel!
    @IBOutlet weak var topApr1dayLabel: UILabel!
    @IBOutlet weak var topArp7dayLabel: UILabel!
    @IBOutlet weak var topArp14DayLabel: UILabel!
    @IBOutlet weak var topAvailableAmountLabel: UILabel!
    @IBOutlet weak var topAvailableDenomLabel: UILabel!
    @IBOutlet weak var topAvailableValueLabel: UILabel!
    
    var mPool: Osmosis_Gamm_Balancer_V1beta1_Pool!
    var mPoolGauges: Array<Osmosis_Incentives_Gauge>!
    var mLockUps: Array<Osmosis_Lockup_PeriodLock>!
    var mBondedList: Array<Osmosis_Lockup_PeriodLock> = Array<Osmosis_Lockup_PeriodLock>()
    var mUnbondingList: Array<Osmosis_Lockup_PeriodLock> = Array<Osmosis_Lockup_PeriodLock>()
    var mUnbondedList: Array<Osmosis_Lockup_PeriodLock> = Array<Osmosis_Lockup_PeriodLock>()
    
    var coin0: Coin!
    var coin1: Coin!
    var coin0Symbol: String!
    var coin1Symbol: String!
    var lpCoinPrice = NSDecimalNumber.zero
    var poolValue = NSDecimalNumber.zero
    var nf: NumberFormatter!
    var apr1Day = NSDecimalNumber.zero
    var apr7Day = NSDecimalNumber.zero
    var apr14Day = NSDecimalNumber.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.account = BaseData.instance.selectAccountById(id: BaseData.instance.getRecentAccountId())
        self.chainType = ChainFactory.getChainType(account!.account_base_chain)
        self.chainConfig = ChainFactory.getChainConfig(chainType)
        
        topApr1dayLabel.font = UIFontMetrics(forTextStyle: .footnote).scaledFont(for: Font_13_footnote)
        topArp7dayLabel.font = UIFontMetrics(forTextStyle: .footnote).scaledFont(for: Font_13_footnote)
        topArp14DayLabel.font = UIFontMetrics(forTextStyle: .footnote).scaledFont(for: Font_13_footnote)
        
        self.farmDetailTableView.delegate = self
        self.farmDetailTableView.dataSource = self
        self.farmDetailTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.farmDetailTableView.register(UINib(nibName: "EarnBondedCell", bundle: nil), forCellReuseIdentifier: "EarnBondedCell")
        self.farmDetailTableView.register(UINib(nibName: "EarnUnbondingCell", bundle: nil), forCellReuseIdentifier: "EarnUnbondingCell")
        self.farmDetailTableView.register(UINib(nibName: "EarnUnbondedCell", bundle: nil), forCellReuseIdentifier: "EarnUnbondedCell")
        
        if #available(iOS 15.0, *) {
            self.farmDetailTableView.sectionHeaderTopPadding = 0.0
        }
        
        print("mPool ", mPool.id)
        print("mPoolGauges ", mPoolGauges.count)
        print("mLockUps ", mLockUps.count)
        
        coin0 = Coin.init(mPool.poolAssets[0].token.denom, mPool.poolAssets[0].token.amount)
        coin1 = Coin.init(mPool.poolAssets[1].token.denom, mPool.poolAssets[1].token.amount)
        let coin0Symbol =  WUtils.getSymbol(chainConfig, coin0.denom)
        let coin1Symbol = WUtils.getSymbol(chainConfig, coin1.denom)
        lpCoinPrice = WUtils.getOsmoLpTokenPerUsdPrice(mPool)
        nf = WUtils.getNumberFormatter(2)
        
        let coin0Value = WUtils.usdValue(chainConfig!, coin0.denom, NSDecimalNumber.init(string: coin0.amount))
        let coin1Value = WUtils.usdValue(chainConfig!, coin1.denom, NSDecimalNumber.init(string: coin1.amount))
        poolValue = coin0Value.adding(coin1Value)
        
        
        //display title
        if (mLockUps.count > 0) {
            topPoolIDLabel.text = "MY EARNING #" + String(mPool.id)
            topPoolIDLabel.textColor = UIColor.init(named: "osmosis")
        } else {
            topPoolIDLabel.text = "EARNING #" + String(mPool.id)
        }
        
        topPoolPairLabel.text = coin0Symbol + " / " + coin1Symbol
        
        
        //display ARPs
        if (mPoolGauges.count == 3 && mPoolGauges[0].distributedCoins.count > 0 && mPoolGauges[1].distributedCoins.count > 0 && mPoolGauges[2].distributedCoins.count > 0) {
            let gauge0Amount = mPoolGauges[0].coins.filter { $0.denom == OSMOSIS_MAIN_DENOM }.first?.amount ?? "0"
            let incentive1Day = NSDecimalNumber.init(string: gauge0Amount).subtracting(NSDecimalNumber.init(string: mPoolGauges[0].distributedCoins[0].amount))
            let incentiveValue1Day = WUtils.usdValue(chainConfig!, OSMOSIS_MAIN_DENOM, incentive1Day)
            
            let gauge1Amount = mPoolGauges[1].coins.filter { $0.denom == OSMOSIS_MAIN_DENOM }.first?.amount ?? "0"
            let incentive7Day = NSDecimalNumber.init(string: gauge1Amount).subtracting(NSDecimalNumber.init(string: mPoolGauges[1].distributedCoins[0].amount))
            var incentiveValue7Day = WUtils.usdValue(chainConfig!, OSMOSIS_MAIN_DENOM, incentive7Day)
            
            let gauge2Amount = mPoolGauges[2].coins.filter { $0.denom == OSMOSIS_MAIN_DENOM }.first?.amount ?? "0"
            let incentive14Day = NSDecimalNumber.init(string: gauge2Amount).subtracting(NSDecimalNumber.init(string: mPoolGauges[2].distributedCoins[0].amount))
            var incentiveValue14Day = WUtils.usdValue(chainConfig!, OSMOSIS_MAIN_DENOM, incentive14Day)
            
            
            incentiveValue14Day = incentiveValue14Day.adding(incentiveValue7Day).adding(incentiveValue1Day)
            incentiveValue7Day = incentiveValue7Day.adding(incentiveValue1Day)
            
            apr1Day = incentiveValue1Day.multiplying(by: NSDecimalNumber.init(value: 36500)).dividing(by: poolValue, withBehavior: WUtils.handler12)
            apr7Day = incentiveValue7Day.multiplying(by: NSDecimalNumber.init(value: 36500)).dividing(by: poolValue, withBehavior: WUtils.handler12)
            apr14Day = incentiveValue14Day.multiplying(by: NSDecimalNumber.init(value: 36500)).dividing(by: poolValue, withBehavior: WUtils.handler12)
        }
        topApr1dayLabel.attributedText = WUtils.displayPercent(apr1Day, topApr1dayLabel.font)
        topArp7dayLabel.attributedText = WUtils.displayPercent(apr7Day, topArp7dayLabel.font)
        topArp14DayLabel.attributedText = WUtils.displayPercent(apr14Day, topArp14DayLabel.font)
        
        
        //display LP coin available
        let lpCoin = BaseData.instance.getAvailable_gRPC("gamm/pool/" + String(mPool.id))
        let lpCoinValue = NSDecimalNumber.init(string: lpCoin).multiplying(by: lpCoinPrice).multiplying(byPowerOf10: -18, withBehavior: WUtils.handler2)
        let formattedLpCoinValue = "$ " + nf.string(from: lpCoinValue)!
        
        topAvailableDenomLabel.text = "GAMM-" + String(mPool.id)
        topAvailableAmountLabel.attributedText = WDP.dpAmount(lpCoin, topAvailableAmountLabel.font, 18, 18)
        topAvailableValueLabel.attributedText = WUtils.getDpAttributedString(formattedLpCoinValue, 2, topAvailableValueLabel.font)
        
        
        mLockUps.forEach { lockup in
            let now = Date.init().millisecondsSince1970
            let endTime = lockup.endTime.date.millisecondsSince1970
            if (endTime == -62135596800000) {
                mBondedList.append(lockup)
            } else if (endTime > now) {
                mUnbondingList.append(lockup)
            } else {
                mUnbondedList.append(lockup)
            }
        }
        farmDetailTableView.reloadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.navigationController?.navigationBar.topItem?.title = NSLocalizedString("title_farm_detail_osmosis", comment: "")
        self.navigationItem.title = NSLocalizedString("title_farm_detail_osmosis", comment: "")
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if (section == 0 && mBondedList.count == 0) { return 0 }
        else if (section == 1 && mUnbondingList.count == 0) { return 0 }
        else if (section == 2 && mUnbondedList.count == 0) { return 0 }
        else { return 30 }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = CommonHeader(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        if (section == 0) {
            view.headerTitleLabel.text = "Bonded";
            view.headerCntLabel.text = String(self.mBondedList.count)
        } else if (section == 1) {
            view.headerTitleLabel.text = "Unbonding";
            view.headerCntLabel.text = String(self.mUnbondingList.count)
        } else {
            view.headerTitleLabel.text = "Unbonded";
            view.headerCntLabel.text = String(self.mUnbondedList.count)
        }
        return view
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
            return mBondedList.count
        } else if (section == 1) {
            return mUnbondingList.count
        } else if (section == 2) {
            return mUnbondedList.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.section == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier:"EarnBondedCell") as? EarnBondedCell
            let lock = mBondedList[indexPath.row]
            cell?.onBindView(lock, mPool, mPoolGauges)
            cell?.actionUnbonding = { self.onClickUnbonding(lock) }
            return cell!
            
        } else if (indexPath.section == 1) {
            let cell = tableView.dequeueReusableCell(withIdentifier:"EarnUnbondingCell") as? EarnUnbondingCell
            let lock = mUnbondingList[indexPath.row]
            cell?.onBindView(lock, mPool, mPoolGauges)
            return cell!
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier:"EarnUnbondedCell") as? EarnUnbondedCell
            let lock = mUnbondedList[indexPath.row]
            cell?.onBindView(lock, mPool, mPoolGauges)
            cell?.actionUnlock = { self.onClickUnLock(lock)}
            return cell!
        }
    }
    
    @IBAction func onClickNewEarning(_ sender: UIButton) {
        if (!account!.account_has_private) {
            self.onShowAddMenomicDialog()
            return
        }
        
        let lpCoin = BaseData.instance.getAvailableAmount_gRPC("gamm/pool/" + String(mPool.id))
        if (lpCoin.compare(NSDecimalNumber.zero).rawValue <= 0) {
            self.onShowToast(NSLocalizedString("error_not_enough_available", comment: ""))
            return
        }
        
        self.onShowUnbondingDuration()
    }
    
    func onStartNewEaring(_ duration: Int64) {
        let txVC = UIStoryboard(name: "GenTx", bundle: nil).instantiateViewController(withIdentifier: "TransactionViewController") as! TransactionViewController
        txVC.mType = TASK_TYPE_OSMOSIS_LOCK
        txVC.mPool = mPool
        txVC.mLockupDuration = duration
        self.navigationItem.title = ""
        self.navigationController?.pushViewController(txVC, animated: true)
    }
    
    
    func onClickUnbonding(_ lock: Osmosis_Lockup_PeriodLock) {
        if (!account!.account_has_private) {
            self.onShowAddMenomicDialog()
            return
        }
        
        var lockups = Array<Osmosis_Lockup_PeriodLock>()
        var totalToUnbonding = NSDecimalNumber.zero
        mBondedList.forEach { lockup in
            if (lockup.duration.seconds == lock.duration.seconds) {
                lockups.append(lockup)
                totalToUnbonding = totalToUnbonding.adding(NSDecimalNumber.init(string: lockup.coins[0].amount))
            }
        }
        
        if (lockups.count > 1) {
            onShowSameClassToUnbonding(lockups, totalToUnbonding, lock)
        } else {
            self.onStartUnbonding(lockups)
        }
    }
    
    func onStartUnbonding(_ lockups: Array<Osmosis_Lockup_PeriodLock>) {
        let txVC = UIStoryboard(name: "GenTx", bundle: nil).instantiateViewController(withIdentifier: "TransactionViewController") as! TransactionViewController
        txVC.mType = TASK_TYPE_OSMOSIS_BEGIN_UNLCOK
        txVC.mLockups = lockups
        self.navigationItem.title = ""
        self.navigationController?.pushViewController(txVC, animated: true)
    }
    
    
    func onClickUnLock(_ lock: Osmosis_Lockup_PeriodLock) {
        if (!account!.account_has_private) {
            self.onShowAddMenomicDialog()
            return
        }
        
        var lockups = Array<Osmosis_Lockup_PeriodLock>()
        var totalUnlock = NSDecimalNumber.zero
        mUnbondedList.forEach { lockup in
            lockups.append(lockup)
            totalUnlock = totalUnlock.adding(NSDecimalNumber.init(string: lockup.coins[0].amount))
        }

        if (lockups.count > 1) {
            onShowSameClassToUnLock(lockups, totalUnlock, lock)
        } else {
            self.onStartUnLock(lockups)
        }
    }
    
    func onStartUnLock(_ lockups: Array<Osmosis_Lockup_PeriodLock>) {
        //deprecated
    }
    
    
    func onShowUnbondingDuration() {
        let selectLockupAlert = UIAlertController(title: NSLocalizedString("str_select_osmo_lockup_duration_title", comment: ""), message: "", preferredStyle: .alert)
        let day1Action = UIAlertAction(title: "1 Day", style: .default, handler: { _ in
            self.onStartNewEaring(86400)
        })
        let day7Action = UIAlertAction(title: "7 Days", style: .default, handler: { _ in
            self.onStartNewEaring(604800)
        })
        let day14Action = UIAlertAction(title: "14 Days", style: .default, handler: { _ in
            self.onStartNewEaring(1209600)
        })
        selectLockupAlert.addAction(day1Action)
        selectLockupAlert.addAction(day7Action)
        selectLockupAlert.addAction(day14Action)
        self.present(selectLockupAlert, animated: true) {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissAlertController))
            selectLockupAlert.view.superview?.subviews[0].addGestureRecognizer(tapGesture)
        }
    }
    
    func onShowSameClassToUnbonding(_ lockups: Array<Osmosis_Lockup_PeriodLock>, _ amount: NSDecimalNumber, _ lockup: Osmosis_Lockup_PeriodLock) {
        var msg = ""
        for lockUp in lockups {
            msg = msg + "# " + String(lockUp.id) + "  "
        }
        msg = msg + "\n\n" + amount.multiplying(byPowerOf10: -18, withBehavior: WUtils.handler2).stringValue
        let askUnbondingAllAlert = UIAlertController(title: NSLocalizedString("str_select_osmo_unbonding_all", comment: ""), message: msg, preferredStyle: .alert)
        let unbondingSingleAction = UIAlertAction(title: NSLocalizedString("Unbonding This One", comment: ""), style: .default) { (_) -> Void in
            self.onStartUnbonding([lockup])
        }
        let unbondingAllAction = UIAlertAction(title: NSLocalizedString("Unbonding All", comment: ""), style: .default) { (_) -> Void in
            self.onStartUnbonding(lockups)
        }
        askUnbondingAllAlert.addAction(unbondingSingleAction)
        askUnbondingAllAlert.addAction(unbondingAllAction)
        self.present(askUnbondingAllAlert, animated: true) {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissAlertController))
            askUnbondingAllAlert.view.superview?.subviews[0].addGestureRecognizer(tapGesture)
        }
    }
    
    func onShowSameClassToUnLock(_ lockups: Array<Osmosis_Lockup_PeriodLock>, _ amount: NSDecimalNumber, _ lockup: Osmosis_Lockup_PeriodLock) {
        var msg = ""
        for lockUp in lockups {
            msg = msg + "# " + String(lockUp.id) + "  "
        }
        msg = msg + "\n\n" + amount.multiplying(byPowerOf10: -18, withBehavior: WUtils.handler2).stringValue
        let askUnlockAllAlert = UIAlertController(title: NSLocalizedString("str_select_osmo_unlock_all", comment: ""), message: msg, preferredStyle: .alert)
        let unlockSingleAction = UIAlertAction(title: NSLocalizedString("Unlock This One", comment: ""), style: .default) { (_) -> Void in
            self.onStartUnLock([lockup])
        }
        let unlockAllAction = UIAlertAction(title: NSLocalizedString("Unlock All", comment: ""), style: .default) { (_) -> Void in
            self.onStartUnLock(lockups)
        }
        askUnlockAllAlert.addAction(unlockSingleAction)
        askUnlockAllAlert.addAction(unlockAllAction)
        self.present(askUnlockAllAlert, animated: true) {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissAlertController))
            askUnlockAllAlert.view.superview?.subviews[0].addGestureRecognizer(tapGesture)
        }
    }
    
}
