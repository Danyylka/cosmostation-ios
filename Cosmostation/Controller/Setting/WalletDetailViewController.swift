//
//  WalletDetailViewController.swift
//  Cosmostation
//
//  Created by yongjoo on 03/04/2019.
//  Copyright © 2019 wannabit. All rights reserved.
//

import UIKit
import QRCode
import Alamofire
import UserNotifications
import GRPC
import NIO

class WalletDetailViewController: BaseViewController, PasswordViewDelegate {

    var accountId: Int64?
    var option: Int?
    
    @IBOutlet weak var cardAddress: CardView!
    @IBOutlet weak var chainImg: UIImageView!
    @IBOutlet weak var walletName: UILabel!
    @IBOutlet weak var walletAddress: UILabel!
    
    @IBOutlet weak var cardPush: CardView!
    @IBOutlet weak var pushMsg: UILabel!
    @IBOutlet weak var pushSwitch: UISwitch!
    
    @IBOutlet weak var cardInfo: CardView!
    @IBOutlet weak var chainName: UILabel!
    @IBOutlet weak var importDate: UILabel!
    @IBOutlet weak var importState: UILabel!
    @IBOutlet weak var pathTitle: UILabel!
    @IBOutlet weak var keyPath: UILabel!
    @IBOutlet weak var noKeyMsg: UILabel!
    
    @IBOutlet weak var cardReward: CardView!
    @IBOutlet weak var rewardCard: CardView!
    @IBOutlet weak var rewardAddress: UILabel!
    
    @IBOutlet weak var actionBtn1: UIButton!
    @IBOutlet weak var actionBtn2: UIButton!
    
    @IBOutlet weak var constraint1: NSLayoutConstraint!
    @IBOutlet weak var constraint2: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    func updateView() {
        account = BaseData.instance.selectAccountById(id: accountId!)
        chainType = WUtils.getChainType(account!.account_base_chain)
        
        if (WUtils.isGRPC(chainType!)) {
            self.onFetchRewardAddress_gRPC(account!.account_address)
            self.onFetchgRPCNodeInfo()
        } else {
            self.onFetchNodeInfo()
        }
        walletName.text = WUtils.getWalletName(account)
        walletAddress.text = account!.account_address
        walletAddress.adjustsFontSizeToFitWidth = true
        cardAddress.backgroundColor = WUtils.getChainBg(chainType!)
        cardPush.backgroundColor = WUtils.getChainBg(chainType!)
        pushSwitch.onTintColor = WUtils.getChainColor(chainType!)
        cardInfo.backgroundColor = WUtils.getChainBg(chainType!)
        cardReward.backgroundColor = WUtils.getChainBg(chainType!)
        if (chainType == ChainType.COSMOS_MAIN) {
            chainImg.image = UIImage(named: "cosmosWhMain")
            keyPath.text = BASE_PATH.appending(account!.account_path)
            
        } else if (chainType == ChainType.IRIS_MAIN) {
            chainImg.image = UIImage(named: "irisWh")
            keyPath.text = BASE_PATH.appending(account!.account_path)
            cardPush.isHidden = true
            constraint2.priority = .defaultHigh
            constraint1.priority = .defaultLow
            
        } else if (chainType == ChainType.BINANCE_MAIN) {
            chainImg.image = UIImage(named: "binanceChImg")
            keyPath.text = BNB_BASE_PATH.appending(account!.account_path)
            cardPush.isHidden = true
            constraint2.priority = .defaultHigh
            constraint1.priority = .defaultLow
            
        } else if (chainType == ChainType.IOV_MAIN) {
            chainImg.image = UIImage(named: "chainStarname")
            keyPath.text = IOV_BASE_PATH.appending(account!.account_path)
            cardPush.isHidden = true
            constraint2.priority = .defaultHigh
            constraint1.priority = .defaultLow
            
        } else if (chainType == ChainType.BAND_MAIN) {
            chainImg.image = UIImage(named: "chainBandprotocal")
            keyPath.text = BAND_BASE_PATH.appending(account!.account_path)
            cardPush.isHidden = true
            constraint2.priority = .defaultHigh
            constraint1.priority = .defaultLow
            
        } else if (chainType == ChainType.CERTIK_MAIN) {
            chainImg.image = UIImage(named: "certikChainImg")
            keyPath.text = BASE_PATH.appending(account!.account_path)
            cardPush.isHidden = true
            constraint2.priority = .defaultHigh
            constraint1.priority = .defaultLow
            
        } else if (chainType == ChainType.AKASH_MAIN) {
            chainImg.image = UIImage(named: "akashChainImg")
            keyPath.text = BASE_PATH.appending(account!.account_path)
            cardPush.isHidden = true
            constraint2.priority = .defaultHigh
            constraint1.priority = .defaultLow
            
        } else if (chainType! == ChainType.PERSIS_MAIN) {
            chainImg.image = UIImage(named: "chainpersistence")
            keyPath.text = PERSIS_BASE_PATH.appending(account!.account_path)
            cardPush.isHidden = true
            constraint2.priority = .defaultHigh
            constraint1.priority = .defaultLow
            
        } else if (chainType! == ChainType.SENTINEL_MAIN) {
            chainImg.image = UIImage(named: "chainsentinel")
            keyPath.text = BASE_PATH.appending(account!.account_path)
            cardPush.isHidden = true
            constraint2.priority = .defaultHigh
            constraint1.priority = .defaultLow
            
        } else if (chainType! == ChainType.CRYPTO_MAIN) {
            chainImg.image = UIImage(named: "chaincrypto")
            keyPath.text = CRYPTO_BASE_PATH.appending(account!.account_path)
            cardPush.isHidden = true
            constraint2.priority = .defaultHigh
            constraint1.priority = .defaultLow
            
        } else if (chainType! == ChainType.SIF_MAIN) {
            chainImg.image = UIImage(named: "chainsifchain")
            keyPath.text = BASE_PATH.appending(account!.account_path)
            cardPush.isHidden = true
            constraint2.priority = .defaultHigh
            constraint1.priority = .defaultLow
            
        } else if (chainType! == ChainType.KI_MAIN) {
            chainImg.image = UIImage(named: "chainKifoundation")
            keyPath.text = BASE_PATH.appending(account!.account_path)
            cardPush.isHidden = true
            constraint2.priority = .defaultHigh
            constraint1.priority = .defaultLow
            
        } else if (chainType! == ChainType.OSMOSIS_MAIN) {
            chainImg.image = UIImage(named: "chainOsmosis")
            keyPath.text = BASE_PATH.appending(account!.account_path)
            cardPush.isHidden = true
            constraint2.priority = .defaultHigh
            constraint1.priority = .defaultLow
            
        } else if (chainType == ChainType.MEDI_MAIN) {
            chainImg.image = UIImage(named: "chainMedibloc")
            keyPath.text = MEDI_BASE_PATH.appending(account!.account_path)
            cardPush.isHidden = true
            constraint2.priority = .defaultHigh
            constraint1.priority = .defaultLow
            
        } else if (chainType == ChainType.EMONEY_MAIN) {
            chainImg.image = UIImage(named: "chainEmoney")
            keyPath.text = BASE_PATH.appending(account!.account_path)
            cardPush.isHidden = true
            constraint2.priority = .defaultHigh
            constraint1.priority = .defaultLow
            
        } else if (chainType == ChainType.RIZON_MAIN) {
            chainImg.image = UIImage(named: "chainRizon")
            keyPath.text = BASE_PATH.appending(account!.account_path)
            cardPush.isHidden = true
            constraint2.priority = .defaultHigh
            constraint1.priority = .defaultLow
            
        } else if (chainType == ChainType.JUNO_MAIN) {
            chainImg.image = UIImage(named: "chainJuno")
            keyPath.text = BASE_PATH.appending(account!.account_path)
            cardPush.isHidden = true
            constraint2.priority = .defaultHigh
            constraint1.priority = .defaultLow
            
        } else if (chainType == ChainType.REGEN_MAIN) {
            chainImg.image = UIImage(named: "chainRegen")
            keyPath.text = BASE_PATH.appending(account!.account_path)
            cardPush.isHidden = true
            constraint2.priority = .defaultHigh
            constraint1.priority = .defaultLow
            
        } else if (chainType == ChainType.BITCANA_MAIN) {
            chainImg.image = UIImage(named: "chainBitcanna")
            keyPath.text = BASE_PATH.appending(account!.account_path)
            cardPush.isHidden = true
            constraint2.priority = .defaultHigh
            constraint1.priority = .defaultLow
            
        } else if (chainType == ChainType.ALTHEA_MAIN) {
            chainImg.image = UIImage(named: "chainAlthea")
            keyPath.text = BASE_PATH.appending(account!.account_path)
            cardPush.isHidden = true
            constraint2.priority = .defaultHigh
            constraint1.priority = .defaultLow
            
        } else if (chainType == ChainType.GRAVITY_BRIDGE_MAIN) {
            chainImg.image = UIImage(named: "chainGravitybridge")
            keyPath.text = BASE_PATH.appending(account!.account_path)
            cardPush.isHidden = true
            constraint2.priority = .defaultHigh
            constraint1.priority = .defaultLow
            
        } else if (chainType == ChainType.STARGAZE_MAIN) {
            chainImg.image = UIImage(named: "chainStargaze")
            keyPath.text = BASE_PATH.appending(account!.account_path)
            cardPush.isHidden = true
            constraint2.priority = .defaultHigh
            constraint1.priority = .defaultLow
            
        } else if (chainType == ChainType.COMDEX_MAIN) {
            chainImg.image = UIImage(named: "chainComdex")
            keyPath.text = BASE_PATH.appending(account!.account_path)
            cardPush.isHidden = true
            constraint2.priority = .defaultHigh
            constraint1.priority = .defaultLow
            
        } else if (chainType == ChainType.INJECTIVE_MAIN) {
            chainImg.image = UIImage(named: "chainInjective")
            keyPath.text = ETH_NON_LEDGER_PATH.appending(account!.account_path)
            cardPush.isHidden = true
            constraint2.priority = .defaultHigh
            constraint1.priority = .defaultLow
            
        } else if (chainType == ChainType.BITSONG_MAIN) {
            chainImg.image = UIImage(named: "chainBitsong")
            keyPath.text = BITSONG_BASE_PATH.appending(account!.account_path)
            cardPush.isHidden = true
            constraint2.priority = .defaultHigh
            constraint1.priority = .defaultLow
            
        } else if (chainType == ChainType.DESMOS_MAIN) {
            chainImg.image = UIImage(named: "chainDesmos")
            keyPath.text = DESMOS_BASE_PATH.appending(account!.account_path)
            cardPush.isHidden = true
            constraint2.priority = .defaultHigh
            constraint1.priority = .defaultLow
            
        } else if (chainType == ChainType.CHIHUAHUA_MAIN) {
            chainImg.image = UIImage(named: "chainChihuahua")
            keyPath.text = BASE_PATH.appending(account!.account_path)
            cardPush.isHidden = true
            constraint2.priority = .defaultHigh
            constraint1.priority = .defaultLow
            
        } else if (chainType! == ChainType.AXELAR_MAIN) {
            chainImg.image = UIImage(named: "chainAxelar")
            keyPath.text = BASE_PATH.appending(account!.account_path)
            cardPush.isHidden = true
            constraint2.priority = .defaultHigh
            constraint1.priority = .defaultLow
            
        } else if (chainType! == ChainType.KONSTELLATION_MAIN) {
            chainImg.image = UIImage(named: "chainKonstellation")
            keyPath.text = BASE_PATH.appending(account!.account_path)
            cardPush.isHidden = true
            constraint2.priority = .defaultHigh
            constraint1.priority = .defaultLow
            
        } else if (chainType! == ChainType.EVMOS_MAIN) {
            chainImg.image = UIImage(named: "chainEvmos")
            keyPath.text = ETH_NON_LEDGER_PATH.appending(account!.account_path)
            cardPush.isHidden = true
            constraint2.priority = .defaultHigh
            constraint1.priority = .defaultLow
            
        } else if (chainType! == ChainType.PROVENANCE_MAIN) {
            chainImg.image = UIImage(named: "chainProvenance")
            keyPath.text = PROVENANCE_BASE_PATH.appending(account!.account_path)
            cardPush.isHidden = true
            constraint2.priority = .defaultHigh
            constraint1.priority = .defaultLow
            
        } else if (chainType! == ChainType.CERBERUS_MAIN) {
            chainImg.image = UIImage(named: "chainCerberus")
            keyPath.text = BASE_PATH.appending(account!.account_path)
            cardPush.isHidden = true
            constraint2.priority = .defaultHigh
            constraint1.priority = .defaultLow
            
        } else if (chainType! == ChainType.OMNIFLIX_MAIN) {
            chainImg.image = UIImage(named: "chainOmniflix")
            keyPath.text = BASE_PATH.appending(account!.account_path)
            cardPush.isHidden = true
            constraint2.priority = .defaultHigh
            constraint1.priority = .defaultLow
            
        } else if (chainType! == ChainType.CRESCENT_MAIN) {
            chainImg.image = UIImage(named: "chainCrescent")
            keyPath.text = BASE_PATH.appending(account!.account_path)
            cardPush.isHidden = true
            constraint2.priority = .defaultHigh
            constraint1.priority = .defaultLow
            
        }
        
        else if (chainType == ChainType.KAVA_MAIN) {
            chainImg.image = UIImage(named: "kavaImg")
            if (account!.account_custom_path == 0) { keyPath.text = BASE_PATH.appending(account!.account_path) }
            else { keyPath.text = KAVA_BASE_PATH.appending(account!.account_path) }
            cardPush.isHidden = true
            constraint2.priority = .defaultHigh
            constraint1.priority = .defaultLow
            
       } else if (chainType == ChainType.SECRET_MAIN) {
           chainImg.image = UIImage(named: "secretChainImg")
           if (account!.account_custom_path == 0) { keyPath.text = BASE_PATH.appending(account!.account_path) }
           else { keyPath.text = SECRET_BASE_PATH.appending(account!.account_path) }
           cardPush.isHidden = true
           constraint2.priority = .defaultHigh
           constraint1.priority = .defaultLow
           
       } else if (chainType == ChainType.LUM_MAIN) {
           chainImg.image = UIImage(named: "chainLumnetwork")
           if (account!.account_custom_path == 0) { keyPath.text = BASE_PATH.appending(account!.account_path) }
           else { keyPath.text = LUM_BASE_PATH.appending(account!.account_path) }
           cardPush.isHidden = true
           constraint2.priority = .defaultHigh
           constraint1.priority = .defaultLow
           
       } else if (chainType! == ChainType.FETCH_MAIN) {
           chainImg.image = UIImage(named: "chainfetchai")
           if (account!.account_custom_path == 0) { keyPath.text = BASE_PATH.appending(account!.account_path) }
           else if (account!.account_custom_path == 1) { keyPath.text = ETH_NON_LEDGER_PATH.appending(String(account!.account_path)) }
           else if (account!.account_custom_path == 2) { keyPath.text = ETH_LEDGER_LIVE_PATH_1.appending(String(account!.account_path)) + ETH_LEDGER_LIVE_PATH_2 }
           else { keyPath.text = ETH_LEDGER_LEGACY_PATH.appending(String(account!.account_path)) }
           cardPush.isHidden = true
           constraint2.priority = .defaultHigh
           constraint1.priority = .defaultLow
           
       } else if (chainType == ChainType.OKEX_MAIN) {
           chainImg.image = UIImage(named: "chainOkex")
           if (account!.account_custom_path == 0) { keyPath.text = "(Legacy Tendermint Type) " + OK_BASE_PATH.appending(account!.account_path) }
           else if (account!.account_custom_path == 1) { keyPath.text = "(Legacy Ethermint Type) " + OK_BASE_PATH.appending(account!.account_path) }
           else { keyPath.text = "(Ethereum Type) " + ETH_NON_LEDGER_PATH.appending(String(account!.account_path)) }
           cardPush.isHidden = true
           constraint2.priority = .defaultHigh
           constraint1.priority = .defaultLow
           
       } else if (chainType! == ChainType.UMEE_MAIN) {
           chainImg.image = UIImage(named: "chainUmee")
           keyPath.text = BASE_PATH.appending(account!.account_path)
           cardPush.isHidden = true
           constraint2.priority = .defaultHigh
           constraint1.priority = .defaultLow
           
       }
        
        
        else if (chainType == ChainType.COSMOS_TEST) {
            chainImg.image = UIImage(named: "cosmosTestChainImg")
            keyPath.text = BASE_PATH.appending(account!.account_path)
            cardPush.isHidden = true
            constraint2.priority = .defaultHigh
            constraint1.priority = .defaultLow
            
        } else if (chainType! == ChainType.ALTHEA_TEST) {
            chainImg.image = UIImage(named: "testnetAlthea")
            keyPath.text = BASE_PATH.appending(account!.account_path)
            cardPush.isHidden = true
            constraint2.priority = .defaultHigh
            constraint1.priority = .defaultLow
            
        } else if (chainType! == ChainType.CRESCENT_TEST) {
            chainImg.image = UIImage(named: "testnetCrescent")
            keyPath.text = BASE_PATH.appending(account!.account_path)
            cardPush.isHidden = true
            constraint2.priority = .defaultHigh
            constraint1.priority = .defaultLow
            
        }
        
        importDate.text = WUtils.longTimetoString(account!.account_import_time)
        
        if (account?.account_has_private == true && account?.account_from_mnemonic == true) {
            actionBtn1.setTitle(NSLocalizedString("check_mnemonic", comment: ""), for: .normal)
            actionBtn2.setTitle(NSLocalizedString("check_private_key", comment: ""), for: .normal)
            importState.text = NSLocalizedString("with_mnemonic", comment: "")
            pathTitle.isHidden = false
            keyPath.isHidden = false
            noKeyMsg.isHidden = true
            
        } else if (account?.account_has_private == true && account?.account_from_mnemonic == false) {
            actionBtn1.isHidden = true
            actionBtn2.setTitle(NSLocalizedString("check_private_key", comment: ""), for: .normal)
            importState.text = NSLocalizedString("with_private_key", comment: "")
            pathTitle.isHidden = true
            keyPath.isHidden = true
            noKeyMsg.isHidden = true
            if (chainType == ChainType.OKEX_MAIN) {
                pathTitle.isHidden = false
                noKeyMsg.isHidden = false
                pathTitle.text = "Address Type"
                if (account!.account_custom_path > 0) { noKeyMsg.text = "Ethereum Type Address" }
                else { noKeyMsg.text = "Legacy Tendermint Type Address" }
            }
            
        } else {
            actionBtn1.setTitle(NSLocalizedString("import_menmonic", comment: ""), for: .normal)
            actionBtn2.setTitle(NSLocalizedString("import_private_key", comment: ""), for: .normal)
            importState.text = NSLocalizedString("only_address", comment: "")
            pathTitle.isHidden = true
            keyPath.isHidden = true
            noKeyMsg.isHidden = false
            
        }
        self.updatePushCardView()
        
    }
    
    func updatePushCardView() {
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            if settings.authorizationStatus == .authorized {
                DispatchQueue.main.async {
                    if (self.account!.account_push_alarm) {
                        self.pushSwitch.setOn(true, animated: false)
                        self.pushMsg.text = NSLocalizedString("push_enabled_state_msg", comment: "")
                    } else {
                        self.pushSwitch.setOn(false, animated: false)
                        self.pushMsg.text = NSLocalizedString("push_disabled_state_msg", comment: "")
                    }
                }
            } else {
                DispatchQueue.main.async {
                    self.pushSwitch.setOn(false, animated: false)
                    self.pushMsg.text = NSLocalizedString("push_disabled_state_msg", comment: "")
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.navigationController?.navigationBar.topItem?.title = NSLocalizedString("title_wallet_detail", comment: "")
        self.navigationItem.title = NSLocalizedString("title_wallet_detail", comment: "")
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.stopAvoidingKeyboard()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.topItem?.title = "";
    }

    
    @IBAction func onClickNameChange(_ sender: Any) {
        let nameAlert = UIAlertController(title: NSLocalizedString("change_wallet_name", comment: ""), message: nil, preferredStyle: .alert)
        
        nameAlert.addTextField { (textField) in
            textField.placeholder = NSLocalizedString("wallet_name", comment: "")
        }
        
        nameAlert.addAction(UIAlertAction(title: NSLocalizedString("cancel", comment: ""), style: .cancel, handler: { _ in
            self.dismiss(animated: true, completion: nil)
        }))
        
        nameAlert.addAction(UIAlertAction(title: NSLocalizedString("ok", comment: ""), style: .default, handler: { [weak nameAlert] (_) in
            let textField = nameAlert?.textFields![0]
            let trimmedString = textField?.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            if(trimmedString?.count ?? 0 > 0) {
                self.account!.account_nick_name = trimmedString!
                BaseData.instance.updateAccount(self.account!)
                BaseData.instance.setNeedRefresh(true)
                self.updateView()
            }
        }))
        self.present(nameAlert, animated: true) {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissAlertController))
            nameAlert.view.superview?.subviews[0].addGestureRecognizer(tapGesture)
        }
        
    }
    
    @IBAction func onTogglePush(_ sender: UISwitch) {
        if (sender.isOn) {
            UNUserNotificationCenter.current().getNotificationSettings { (settings) in
                if settings.authorizationStatus == .authorized {
                    DispatchQueue.main.async {
                        self.showWaittingAlert()
                        self.onToggleAlarm(self.account!) { (success) in
                            self.account = BaseData.instance.selectAccountById(id: self.account!.account_id)
                            self.updatePushCardView()
                            self.dismissAlertController()
                        }
                    }
                    
                } else {
                    let alertController = UIAlertController(title: NSLocalizedString("permission_push_title", comment: ""), message: NSLocalizedString("permission_push_msg", comment: ""), preferredStyle: .alert)
                    let settingsAction = UIAlertAction(title: NSLocalizedString("settings", comment: ""), style: .default) { (_) -> Void in
                        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                            return
                        }
                        if UIApplication.shared.canOpenURL(settingsUrl) {
                            UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                            })
                        }
                    }
                    let cancelAction = UIAlertAction(title: NSLocalizedString("cancel", comment: ""), style: .default, handler: nil)
                    alertController.addAction(cancelAction)
                    alertController.addAction(settingsAction)
                    DispatchQueue.main.async {
                        sender.setOn(false, animated: true)
                        self.present(alertController, animated: true, completion: nil)
                    }
                }
            }
            
        } else {
            DispatchQueue.main.async {
                self.showWaittingAlert()
                self.onToggleAlarm(self.account!) { (success) in
                    self.account = BaseData.instance.selectAccountById(id: self.account!.account_id)
                    self.updatePushCardView()
                    self.dismissAlertController()
                }
            }
        }
    }
    
    
    @IBAction func onClickQrCode(_ sender: Any) {
        self.shareAddress(account!.account_address, WUtils.getWalletName(account))
    }
    
    @IBAction func onClickRewardAddressChange(_ sender: UIButton) {
        if (!account!.account_has_private) {
            self.onShowAddMenomicDialog()
            return
        }
        
        if (chainType == ChainType.KAVA_MAIN || chainType! == ChainType.FETCH_MAIN) {
            self.onShowToast("Disabled")
            return
        }
        
//        let mainDenom = WUtils.getMainDenom(chainType)
//        if (WUtils.isGRPC(chainType!)) {
//            let feeAmount = WUtils.getEstimateGasFeeAmount(chainType!, COSMOS_MSG_TYPE_WITHDRAW_MIDIFY, 0)
//            if (BaseData.instance.getAvailableAmount(mainDenom).compare(feeAmount).rawValue < 0) {
//                self.onShowToast(NSLocalizedString("error_not_enough_fee", comment: ""))
//                return
//            }
//            
//        } else {
//            
//            let feeAmount = WUtils.getEstimateGasFeeAmount(chainType!, COSMOS_MSG_TYPE_WITHDRAW_MIDIFY, 0)
//            if (BaseData.instance.availableAmount(mainDenom).compare(feeAmount).rawValue < 0) {
//                self.onShowToast(NSLocalizedString("error_not_enough_fee", comment: ""))
//                return
//            }
//        }
        
        let title = NSLocalizedString("reward_address_notice_title", comment: "")
        let msg1 = NSLocalizedString("reward_address_notice_msg", comment: "")
        let msg2 = NSLocalizedString("reward_address_notice_msg2", comment: "")
        let msg = msg1 + msg2
        let range = (msg as NSString).range(of: msg2)
        let noticeAlert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let attributedMessage: NSMutableAttributedString = NSMutableAttributedString(
            string: msg,
            attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12.0)
            ]
        )
        attributedMessage.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 14.0), range: range)
        attributedMessage.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: range)
        
        noticeAlert.setValue(attributedMessage, forKey: "attributedMessage")
        noticeAlert.addAction(UIAlertAction(title: NSLocalizedString("cancel", comment: ""), style: .cancel, handler: nil))
        noticeAlert.addAction(UIAlertAction(title: NSLocalizedString("continue", comment: ""), style: .default, handler: { _ in
            BaseData.instance.setRecentAccountId(self.account!.account_id)
            let txVC = UIStoryboard(name: "GenTx", bundle: nil).instantiateViewController(withIdentifier: "TransactionViewController") as! TransactionViewController
            txVC.mType = COSMOS_MSG_TYPE_WITHDRAW_MIDIFY
            self.navigationItem.title = ""
            self.navigationController?.pushViewController(txVC, animated: true)
        }))
        self.present(noticeAlert, animated: true) {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissAlertController))
            noticeAlert.view.superview?.subviews[0].addGestureRecognizer(tapGesture)
        }
    }
    
    @IBAction func onClickActionBtn1(_ sender: UIButton) {
        if (account?.account_from_mnemonic == true) {
            self.option = 1
            let passwordVC = UIStoryboard(name: "Password", bundle: nil).instantiateViewController(withIdentifier: "PasswordViewController") as! PasswordViewController
            self.navigationItem.title = ""
            self.navigationController!.view.layer.add(WUtils.getPasswordAni(), forKey: kCATransition)
            passwordVC.mTarget = PASSWORD_ACTION_SIMPLE_CHECK
            passwordVC.resultDelegate = self
            self.navigationController?.pushViewController(passwordVC, animated: false)
            
        } else {
            let restoreMnemonicVC = UIStoryboard(name: "Init", bundle: nil).instantiateViewController(withIdentifier: "RestoreViewController") as! RestoreViewController
            restoreMnemonicVC.chainType = self.chainType
            self.navigationItem.title = ""
            self.navigationController?.pushViewController(restoreMnemonicVC, animated: true)
        }
    }
    
    @IBAction func onClickActionBtn2(_ sender: UIButton) {
        if (account?.account_has_private == true) {
            self.option = 2
            let passwordVC = UIStoryboard(name: "Password", bundle: nil).instantiateViewController(withIdentifier: "PasswordViewController") as! PasswordViewController
            self.navigationItem.title = ""
            self.navigationController!.view.layer.add(WUtils.getPasswordAni(), forKey: kCATransition)
            passwordVC.mTarget = PASSWORD_ACTION_SIMPLE_CHECK
            passwordVC.resultDelegate = self
            self.navigationController?.pushViewController(passwordVC, animated: false)
            
        } else {
            let restorePKeyVC = UIStoryboard(name: "Init", bundle: nil).instantiateViewController(withIdentifier: "KeyRestoreViewController") as! KeyRestoreViewController
            restorePKeyVC.chainType = self.chainType
            self.navigationItem.title = ""
            self.navigationController?.pushViewController(restorePKeyVC, animated: true)
        }
    }
    
    
    @IBAction func onClickDelete(_ sender: Any) {
        let dpChains = BaseData.instance.dpSortedChains()
        var accountSum = 0;
        dpChains.forEach { chain in
            let accountNum = BaseData.instance.selectAllAccountsByChain(chain).count
            accountSum = accountSum + accountNum
        }
        if (accountSum <= 1) {
            self.onShowToast(NSLocalizedString("error_reserve_1_account", comment: ""))
            return
        }
        
        let deleteAlert = UIAlertController(title: NSLocalizedString("delete_wallet", comment: ""), message: NSLocalizedString("delete_wallet_msg", comment: ""), preferredStyle: .alert)
        deleteAlert.addAction(UIAlertAction(title: NSLocalizedString("delete", comment: ""), style: .destructive, handler: { _ in
            self.confirmDelete()
        }))
        deleteAlert.addAction(UIAlertAction(title: NSLocalizedString("close", comment: ""), style: .default, handler: { _ in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(deleteAlert, animated: true) {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissAlertController))
            deleteAlert.view.superview?.subviews[0].addGestureRecognizer(tapGesture)
        }
    }
    
    func confirmDelete() {
        if (self.account!.account_has_private) {
            let passwordVC = UIStoryboard(name: "Password", bundle: nil).instantiateViewController(withIdentifier: "PasswordViewController") as! PasswordViewController
            self.navigationItem.title = ""
            self.navigationController!.view.layer.add(WUtils.getPasswordAni(), forKey: kCATransition)
            passwordVC.mTarget = PASSWORD_ACTION_DELETE_ACCOUNT
            passwordVC.resultDelegate = self
            self.navigationController?.pushViewController(passwordVC, animated: false)
            
        } else {
            self.onDeleteWallet(account!)
        }
    }
    
    func passwordResponse(result: Int) {
        if (result == PASSWORD_RESUKT_OK) {
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(310), execute: {
                if (self.option == 1) {
                    let walletCheckVC = WalletCheckViewController(nibName: "WalletCheckViewController", bundle: nil)
                    walletCheckVC.hidesBottomBarWhenPushed = true
                    walletCheckVC.accountId = self.accountId
                    self.navigationItem.title = ""
                    self.navigationController?.pushViewController(walletCheckVC, animated: true)
                    
                } else if (self.option == 2) {
                    let walletCheckPkeyVC = WalletCheckPKeyViewController(nibName: "WalletCheckPKeyViewController", bundle: nil)
                    walletCheckPkeyVC.hidesBottomBarWhenPushed = true
                    walletCheckPkeyVC.accountId = self.accountId
                    self.navigationItem.title = ""
                    self.navigationController?.pushViewController(walletCheckPkeyVC, animated: true)
                }
                
            })
            
        } else if (result == PASSWORD_RESUKT_OK_FOR_DELETE) {
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(310), execute: {
                self.onDeleteWallet(self.account!)
            })
            
        }
    }
    
    func onFetchRewardAddress_gRPC(_ address: String) {
        DispatchQueue.global().async {
            var responseAddress = ""
            let group = MultiThreadedEventLoopGroup(numberOfThreads: 1)
            defer { try! group.syncShutdownGracefully() }
            
            let channel = BaseNetWork.getConnection(self.chainType!, group)!
            defer { try! channel.close().wait() }
            
            let req = Cosmos_Distribution_V1beta1_QueryDelegatorWithdrawAddressRequest.with {
                $0.delegatorAddress = address
            }
            do {
                let response = try Cosmos_Distribution_V1beta1_QueryClient(channel: channel).delegatorWithdrawAddress(req).response.wait()
                responseAddress = response.withdrawAddress.replacingOccurrences(of: "\"", with: "")
            } catch {
                print("onFetchRedelegation_gRPC failed: \(error)")
            }
            DispatchQueue.main.async(execute: {
                self.rewardAddress.text = responseAddress
                if (responseAddress != address) {
                    self.rewardAddress.textColor = UIColor.init(hexString: "f31963")
                }
                self.rewardAddress.adjustsFontSizeToFitWidth = true
                self.rewardCard.isHidden = false
            });
        }
    }
    
    
    func onFetchNodeInfo() {
        let request = Alamofire.request(BaseNetWork.nodeInfoUrl(chainType), method: .get, parameters: [:], encoding: URLEncoding.default, headers: [:])
        request.responseJSON { (response) in
            switch response.result {
            case .success(let res):
                guard let responseData = res as? NSDictionary, let nodeInfo = responseData.object(forKey: "node_info") as? NSDictionary else {
                    return
                }
                self.chainName.text = NodeInfo.init(nodeInfo).network
            case .failure(let error):
                print("onFetchTopValidatorsInfo ", error)
            }
        }
    }
    
    func onFetchgRPCNodeInfo() {
        DispatchQueue.global().async {
            var chainId = ""
            let group = MultiThreadedEventLoopGroup(numberOfThreads: 1)
            defer { try! group.syncShutdownGracefully() }
            
            let channel = BaseNetWork.getConnection(self.chainType!, group)!
            defer { try! channel.close().wait() }
            
            let req = Cosmos_Base_Tendermint_V1beta1_GetNodeInfoRequest()
            
            do {
                let response = try Cosmos_Base_Tendermint_V1beta1_ServiceClient(channel: channel).getNodeInfo(req).response.wait()
                chainId = response.nodeInfo.network
                
            } catch {
                print("onFetchgRPCNodeInfo failed: \(error)")
            }
            DispatchQueue.main.async(execute: {
                self.chainName.text = chainId
            });
        }
    }
    
}
