//
//  MyValidatorViewController.swift
//  Cosmostation
//
//  Created by yongjoo on 22/03/2019.
//  Copyright © 2019 wannabit. All rights reserved.
//

import UIKit
import Alamofire

class MyValidatorViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource, ClaimRewardAllDelegate {
    
    @IBOutlet weak var myValidatorCnt: UILabel!
    @IBOutlet weak var btnSort: UIView!
    @IBOutlet weak var sortType: UILabel!
    @IBOutlet weak var myValidatorTableView: UITableView!
    
    var mainTabVC: MainTabViewController!
    var refresher: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.account = BaseData.instance.selectAccountById(id: BaseData.instance.getRecentAccountId())
        self.chainType = WUtils.getChainType(account!.account_base_chain)
        
        self.myValidatorTableView.delegate = self
        self.myValidatorTableView.dataSource = self
        self.myValidatorTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.myValidatorTableView.register(UINib(nibName: "MyValidatorCell", bundle: nil), forCellReuseIdentifier: "MyValidatorCell")
        self.myValidatorTableView.register(UINib(nibName: "ClaimRewardAllCell", bundle: nil), forCellReuseIdentifier: "ClaimRewardAllCell")
        self.myValidatorTableView.register(UINib(nibName: "PromotionCell", bundle: nil), forCellReuseIdentifier: "PromotionCell")
        self.myValidatorTableView.rowHeight = UITableView.automaticDimension
        self.myValidatorTableView.estimatedRowHeight = UITableView.automaticDimension

        self.refresher = UIRefreshControl()
        self.refresher.addTarget(self, action: #selector(onRequestFetch), for: .valueChanged)
        self.refresher.tintColor = UIColor.white
        self.myValidatorTableView.addSubview(refresher)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(onStartSort))
        self.btnSort.addGestureRecognizer(tap)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.mainTabVC = ((self.parent)?.parent)?.parent as? MainTabViewController
        self.balances = BaseData.instance.selectBalanceById(accountId: self.account!.account_id)
        self.onSortingMy()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(self.onFetchDone(_:)), name: Notification.Name("onFetchDone"), object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: Notification.Name("onFetchDone"), object: nil)
    }
    
    @objc func onFetchDone(_ notification: NSNotification) {
        self.onSortingMy()
        self.refresher.endRefreshing()
    }
    
    @objc func onSortingMy() {
        if (WUtils.isGRPC(chainType!)) {
            self.myValidatorCnt.text = String(BaseData.instance.mMyValidators_gRPC.count)
        } else {
            self.myValidatorCnt.text = String(BaseData.instance.mMyValidator.count)
        }
        
        if (BaseData.instance.getMyValidatorSort() == 0) {
            self.sortType.text = NSLocalizedString("sort_by_my_delegate", comment: "")
            sortByDelegated()
        } else if (BaseData.instance.getMyValidatorSort() == 1) {
            self.sortType.text = NSLocalizedString("sort_by_name", comment: "")
            sortByName()
        } else {
            self.sortType.text = NSLocalizedString("sort_by_reward", comment: "")
            sortByReward()
        }
        self.myValidatorTableView.reloadData()
    }
    
    @objc func onRequestFetch() {
        if (!mainTabVC.onFetchAccountData()) {
            self.refresher.endRefreshing()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (WUtils.isGRPC(chainType!)) {
            if (BaseData.instance.mMyValidators_gRPC.count < 1) { return 1; }
            else if (BaseData.instance.mMyValidators_gRPC.count == 1) { return 1; }
            else { return BaseData.instance.mMyValidators_gRPC.count + 1; }
            
        } else {
            if (BaseData.instance.mMyValidator.count < 1) { return 1; }
            else if (BaseData.instance.mMyValidator.count == 1) { return 1; }
            else { return BaseData.instance.mMyValidator.count + 1; }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (WUtils.isGRPC(chainType!)) {
            if (BaseData.instance.mMyValidators_gRPC.count < 1) {
                let cell:PromotionCell? = tableView.dequeueReusableCell(withIdentifier:"PromotionCell") as? PromotionCell
                cell?.cardView.backgroundColor = WUtils.getChainBg(chainType)
                return cell!
                
            } else if (BaseData.instance.mMyValidators_gRPC.count == 1) {
                let cell:MyValidatorCell? = tableView.dequeueReusableCell(withIdentifier:"MyValidatorCell") as? MyValidatorCell
                cell?.updateView(BaseData.instance.mMyValidators_gRPC[indexPath.row], self.chainType)
                return cell!
                
            } else {
                if (indexPath.row == BaseData.instance.mMyValidators_gRPC.count) {
                    let cell:ClaimRewardAllCell? = tableView.dequeueReusableCell(withIdentifier:"ClaimRewardAllCell") as? ClaimRewardAllCell
                    self.onSetClaimAllItem(cell!)
                    return cell!
                } else {
                    let cell:MyValidatorCell? = tableView.dequeueReusableCell(withIdentifier:"MyValidatorCell") as? MyValidatorCell
                    cell?.updateView(BaseData.instance.mMyValidators_gRPC[indexPath.row], self.chainType)
                    return cell!
                }
            }
            
        } else {
            if (BaseData.instance.mMyValidator.count < 1) {
                let cell:PromotionCell? = tableView.dequeueReusableCell(withIdentifier:"PromotionCell") as? PromotionCell
                cell?.cardView.backgroundColor = WUtils.getChainBg(chainType)
                return cell!
                
            } else if (BaseData.instance.mMyValidator.count == 1) {
                let cell:MyValidatorCell? = tableView.dequeueReusableCell(withIdentifier:"MyValidatorCell") as? MyValidatorCell
                let validator = BaseData.instance.mMyValidator[indexPath.row]
                self.onSetValidatorItem(cell!, validator, indexPath)
                return cell!
                
            } else {
                if (indexPath.row == BaseData.instance.mMyValidator.count) {
                    let cell:ClaimRewardAllCell? = tableView.dequeueReusableCell(withIdentifier:"ClaimRewardAllCell") as? ClaimRewardAllCell
                    self.onSetClaimAllItem(cell!)
                    return cell!
                } else {
                    let cell:MyValidatorCell? = tableView.dequeueReusableCell(withIdentifier:"MyValidatorCell") as? MyValidatorCell
                    let validator = BaseData.instance.mMyValidator[indexPath.row]
                    self.onSetValidatorItem(cell!, validator, indexPath)
                    return cell!
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (WUtils.isGRPC(chainType!)) {
            if (BaseData.instance.mMyValidators_gRPC.count == 0) {
                if let cosmostation = BaseData.instance.mAllValidators_gRPC.filter({ $0.description_p.moniker == "Cosmostation" }).first {
                    self.onStartDelegate(cosmostation, nil)
                }
            }
            if (BaseData.instance.mMyValidators_gRPC.count > 0 && indexPath.row != BaseData.instance.mMyValidators_gRPC.count) {
                let validatorDetailVC = UIStoryboard(name: "MainStoryboard", bundle: nil).instantiateViewController(withIdentifier: "VaildatorDetailViewController") as! VaildatorDetailViewController
                validatorDetailVC.mValidator_gRPC = BaseData.instance.mMyValidators_gRPC[indexPath.row]
                validatorDetailVC.hidesBottomBarWhenPushed = true
                self.navigationItem.title = ""
                self.navigationController?.pushViewController(validatorDetailVC, animated: true)
            }
            
        } else {
            if (BaseData.instance.mMyValidator.count == 0) {
                if let cosmostation = BaseData.instance.mAllValidator.filter({ $0.description.moniker == "Cosmostation" }).first {
                    self.onStartDelegate(nil, cosmostation)
                }
            }
            if (BaseData.instance.mMyValidator.count > 0 && indexPath.row != BaseData.instance.mMyValidator.count) {
                let validatorDetailVC = UIStoryboard(name: "MainStoryboard", bundle: nil).instantiateViewController(withIdentifier: "VaildatorDetailViewController") as! VaildatorDetailViewController
                validatorDetailVC.mValidator = BaseData.instance.mMyValidator[indexPath.row]
                validatorDetailVC.hidesBottomBarWhenPushed = true
                self.navigationItem.title = ""
                self.navigationController?.pushViewController(validatorDetailVC, animated: true)
            }
        }
    }
    
    func onSetValidatorItem(_ cell: MyValidatorCell, _ validator: Validator, _ indexPath: IndexPath) {
        cell.cardView.backgroundColor = WUtils.getChainBg(chainType)
        cell.monikerLabel.text = validator.description.moniker
        cell.monikerLabel.adjustsFontSizeToFitWidth = true
        cell.freeEventImg.isHidden = true
        if (validator.jailed) {
            cell.revokedImg.isHidden = false
            cell.validatorImg.layer.borderColor = UIColor(hexString: "#f31963").cgColor
        } else {
            cell.revokedImg.isHidden = true
            cell.validatorImg.layer.borderColor = UIColor(hexString: "#4B4F54").cgColor
        }
        cell.validatorImg.af_setImage(withURL: URL(string: WUtils.getMonikerImgUrl(chainType!, validator.operator_address))!)
        
        let delegated = BaseData.instance.delegatedAmountByValidator(validator.operator_address)
        cell.myDelegatedAmoutLabel.attributedText = WUtils.displayAmount2(delegated.stringValue, cell.myDelegatedAmoutLabel.font, WUtils.mainDivideDecimal(chainType), 6)
        
        let unbonding = BaseData.instance.unbondingAmountByValidator(validator.operator_address)
        cell.myUndelegatingAmountLabel.attributedText =  WUtils.displayAmount2(unbonding.stringValue, cell.myUndelegatingAmountLabel.font, WUtils.mainDivideDecimal(chainType), 6)
        
        let reward = BaseData.instance.rewardAmountByValidator(WUtils.getMainDenom(chainType), validator.operator_address)
        cell.rewardAmoutLabel.attributedText = WUtils.displayAmount2(reward.stringValue, cell.rewardAmoutLabel.font, WUtils.mainDivideDecimal(chainType), 6)
    }
    
    func onSetClaimAllItem(_ cell: ClaimRewardAllCell) {
        WUtils.setDenomTitle(chainType!, cell.denomLabel)
        if (WUtils.isGRPC(chainType!)) {
            cell.totalRewardLabel.attributedText = WUtils.displayAmount2(BaseData.instance.getRewardSum_gRPC(WUtils.getMainDenom(chainType)), cell.totalRewardLabel.font, WUtils.mainDivideDecimal(chainType), 6)
            cell.delegate = self
            
        } else {
            cell.totalRewardLabel.attributedText = WUtils.displayAmount2(BaseData.instance.rewardAmount(WUtils.getMainDenom(chainType)).stringValue, cell.totalRewardLabel.font, WUtils.mainDivideDecimal(chainType), 6)
            cell.delegate = self
        }
    }
    
    func didTapClaimAll(_ sender: UIButton) {
        if (!self.account!.account_has_private) {
            self.onShowAddMenomicDialog()
            return
        }
        if (WUtils.isGRPC(chainType!)) {
            var claimAbleValidators = Array<Cosmos_Staking_V1beta1_Validator>()
            var toClaimValidators  = Array<Cosmos_Staking_V1beta1_Validator>()
            let feeAmountSingle = WUtils.getEstimateGasFeeAmount(chainType!, COSMOS_MSG_TYPE_WITHDRAW_DEL, 1)
            let mainDenom = WUtils.getMainDenom(chainType)
            
            BaseData.instance.mMyValidators_gRPC.forEach { validator in
                if (BaseData.instance.getReward_gRPC(mainDenom, validator.operatorAddress).compare(feeAmountSingle).rawValue > 0) {
                    claimAbleValidators.append(validator)
                }
            }
            if (claimAbleValidators.count == 0) {
                self.onShowToast(NSLocalizedString("error_not_enough_reward", comment: ""))
                return;
            }
            claimAbleValidators.sort {
                let reward0 = BaseData.instance.getReward_gRPC(mainDenom, $0.operatorAddress)
                let reward1 = BaseData.instance.getReward_gRPC(mainDenom, $1.operatorAddress)
                return reward0.compare(reward1).rawValue > 0 ? true : false
            }
            if (claimAbleValidators.count > 16) {
                toClaimValidators = Array(claimAbleValidators[0..<16])
            } else {
                toClaimValidators = claimAbleValidators
            }

            let feeAmount = WUtils.getEstimateGasFeeAmount(chainType!, COSMOS_MSG_TYPE_WITHDRAW_DEL, toClaimValidators.count)
            if (BaseData.instance.getAvailableAmount_gRPC(mainDenom).compare(feeAmount).rawValue < 0) {
                self.onShowToast(NSLocalizedString("error_not_enough_fee", comment: ""))
                return
            }
            
            let txVC = UIStoryboard(name: "GenTx", bundle: nil).instantiateViewController(withIdentifier: "TransactionViewController") as! TransactionViewController
            txVC.mRewardTargetValidators_gRPC = toClaimValidators
            txVC.mType = COSMOS_MSG_TYPE_WITHDRAW_DEL
            txVC.hidesBottomBarWhenPushed = true
            self.navigationItem.title = ""
            self.navigationController?.pushViewController(txVC, animated: true)

        } else {
            var claimAbleValidators = Array<Validator>()
            var toClaimValidators  = Array<Validator>()
            let feeAmountSingle = WUtils.getEstimateGasFeeAmount(chainType!, COSMOS_MSG_TYPE_WITHDRAW_DEL, 1)
            let mainDenom = WUtils.getMainDenom(chainType)
            
            BaseData.instance.mAllValidator.forEach { validator in
                if (BaseData.instance.rewardAmountByValidator(mainDenom, validator.operator_address).compare(feeAmountSingle).rawValue > 0) {
                    claimAbleValidators.append(validator)
                }
            }
            if (claimAbleValidators.count == 0) {
                self.onShowToast(NSLocalizedString("error_not_enough_reward", comment: ""))
                return;
            }
            claimAbleValidators.sort {
                let reward0 = BaseData.instance.rewardAmountByValidator(mainDenom, $0.operator_address)
                let reward1 = BaseData.instance.rewardAmountByValidator(mainDenom, $1.operator_address)
                return reward0.compare(reward1).rawValue > 0 ? true : false
            }
            if (claimAbleValidators.count > 16) {
                toClaimValidators = Array(claimAbleValidators[0..<16])
            } else {
                toClaimValidators = claimAbleValidators
            }
            
            let feeAmount = WUtils.getEstimateGasFeeAmount(chainType!, COSMOS_MSG_TYPE_WITHDRAW_DEL, toClaimValidators.count)
            if (BaseData.instance.availableAmount(mainDenom).compare(feeAmount).rawValue < 0) {
                self.onShowToast(NSLocalizedString("error_not_enough_fee", comment: ""))
                return
            }
            
            let txVC = UIStoryboard(name: "GenTx", bundle: nil).instantiateViewController(withIdentifier: "TransactionViewController") as! TransactionViewController
            txVC.mRewardTargetValidators = toClaimValidators
            txVC.mType = COSMOS_MSG_TYPE_WITHDRAW_DEL
            txVC.hidesBottomBarWhenPushed = true
            self.navigationItem.title = ""
            self.navigationController?.pushViewController(txVC, animated: true)
        }
    }
    
    func onStartDelegate(_ validator_gRPC: Cosmos_Staking_V1beta1_Validator?, _ validator: Validator?) {
        if (!account!.account_has_private) {
            self.onShowAddMenomicDialog()
            return
        }
        
        let mainDenom = WUtils.getMainDenom(chainType)
        if (WUtils.isGRPC(chainType)) {
            let feeAmount = WUtils.getEstimateGasFeeAmount(chainType!, COSMOS_MSG_TYPE_DELEGATE, 0)
            if (BaseData.instance.getDelegatable_gRPC(mainDenom).compare(feeAmount).rawValue <= 0) {
                self.onShowToast(NSLocalizedString("error_not_enough_available", comment: ""))
                return
            }
            
            let txVC = UIStoryboard(name: "GenTx", bundle: nil).instantiateViewController(withIdentifier: "TransactionViewController") as! TransactionViewController
            txVC.mType = COSMOS_MSG_TYPE_DELEGATE
            txVC.mTargetValidator_gRPC = validator_gRPC
            self.navigationItem.title = ""
            self.navigationController?.pushViewController(txVC, animated: true)
            
        } else {
            let feeAmount = WUtils.getEstimateGasFeeAmount(chainType!, COSMOS_MSG_TYPE_DELEGATE, 0)
            if (BaseData.instance.availableAmount(mainDenom).compare(feeAmount).rawValue < 0) {
                self.onShowToast(NSLocalizedString("error_not_enough_available", comment: ""))
                return
            }
            
            let txVC = UIStoryboard(name: "GenTx", bundle: nil).instantiateViewController(withIdentifier: "TransactionViewController") as! TransactionViewController
            txVC.mType = COSMOS_MSG_TYPE_DELEGATE
            txVC.mTargetValidator = validator
            self.navigationItem.title = ""
            self.navigationController?.pushViewController(txVC, animated: true)
        }
    }
    
    @objc func onStartSort() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: NSLocalizedString("cancel", comment: ""), style: UIAlertAction.Style.cancel, handler: nil))
        alert.addAction(UIAlertAction(title: NSLocalizedString("sort_by_name", comment: ""), style: UIAlertAction.Style.default, handler: { (action) in
            BaseData.instance.setMyValidatorSort(1)
            self.onSortingMy()
        }))
        alert.addAction(UIAlertAction(title: NSLocalizedString("sort_by_my_delegate", comment: ""), style: UIAlertAction.Style.default, handler: { (action) in
            BaseData.instance.setMyValidatorSort(0)
            self.onSortingMy()
        }))
        alert.addAction(UIAlertAction(title: NSLocalizedString("sort_by_reward", comment: ""), style: UIAlertAction.Style.default, handler: { (action) in
            BaseData.instance.setMyValidatorSort(2)
            self.onSortingMy()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func sortByName() {
        if (WUtils.isGRPC(chainType!)) {
            BaseData.instance.mMyValidators_gRPC.sort{
                if ($0.description_p.moniker == "Cosmostation") { return true }
                if ($1.description_p.moniker == "Cosmostation") { return false }
                if ($0.jailed && !$1.jailed) { return false }
                if (!$0.jailed && $1.jailed) { return true }
                return $0.description_p.moniker < $1.description_p.moniker
            }
            
        } else {
            BaseData.instance.mMyValidator.sort{
                if ($0.description.moniker == "Cosmostation") { return true }
                if ($1.description.moniker == "Cosmostation") { return false }
                if ($0.jailed && !$1.jailed) { return false }
                if (!$0.jailed && $1.jailed) { return true }
                return $0.description.moniker < $1.description.moniker
            }
        }
    }
    
    func sortByDelegated() {
        if (WUtils.isGRPC(chainType!)) {
            BaseData.instance.mMyValidators_gRPC.sort {
                if ($0.description_p.moniker == "Cosmostation") { return true }
                if ($1.description_p.moniker == "Cosmostation") { return false }
                if ($0.jailed && !$1.jailed) { return false }
                if (!$0.jailed && $1.jailed) { return true }
                let firstVal = BaseData.instance.getDelegated_gRPC($0.operatorAddress)
                let seconVal = BaseData.instance.getDelegated_gRPC($1.operatorAddress)
                return firstVal.compare(seconVal).rawValue > 0 ? true : false
            }
            
        } else {
            BaseData.instance.mMyValidator.sort{
                if ($0.description.moniker == "Cosmostation") { return true }
                if ($1.description.moniker == "Cosmostation") { return false }
                if ($0.jailed && !$1.jailed) { return false }
                if (!$0.jailed && $1.jailed) { return true }
                let firstVal = BaseData.instance.delegatedAmountByValidator($0.operator_address)
                let seconVal = BaseData.instance.delegatedAmountByValidator($1.operator_address)
                return firstVal.compare(seconVal).rawValue > 0 ? true : false
            }
            
        }
    }
    
    func sortByReward() {
        if (WUtils.isGRPC(chainType!)) {
            BaseData.instance.mMyValidators_gRPC.sort {
                if ($0.description_p.moniker == "Cosmostation") { return true }
                if ($1.description_p.moniker == "Cosmostation") { return false }
                if ($0.jailed && !$1.jailed) { return false }
                if (!$0.jailed && $1.jailed) { return true }
                let firstVal = BaseData.instance.getReward_gRPC(WUtils.getMainDenom(self.chainType), $0.operatorAddress)
                let seconVal = BaseData.instance.getReward_gRPC(WUtils.getMainDenom(self.chainType), $1.operatorAddress)
                return firstVal.compare(seconVal).rawValue > 0 ? true : false
            }
            
        } else {
            BaseData.instance.mMyValidator.sort{
                if ($0.description.moniker == "Cosmostation") { return true }
                if ($1.description.moniker == "Cosmostation") { return false }
                if ($0.jailed && !$1.jailed) { return false }
                if (!$0.jailed && $1.jailed) { return true }
                let reward0 = BaseData.instance.rewardAmountByValidator(WUtils.getMainDenom(chainType), $0.operator_address)
                let reward1 = BaseData.instance.rewardAmountByValidator(WUtils.getMainDenom(chainType), $1.operator_address)
                return reward0.compare(reward1).rawValue > 0 ? true : false
            }
        }
        
    }
}
