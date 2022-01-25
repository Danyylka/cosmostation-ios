//
//  RestoreViewController.swift
//  Cosmostation
//
//  Created by yongjoo on 28/03/2019.
//  Copyright © 2019 wannabit. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper

class RestoreViewController: BaseViewController , UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, PasswordViewDelegate{
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var cardView: CardView!
    @IBOutlet weak var actionView: UIStackView!
    @IBOutlet weak var keyboardView: UIView!
    @IBOutlet weak var mNeminicImg: UIImageView!
    
    @IBOutlet weak var mNemonicLayer0: BottomLineView!
    @IBOutlet weak var mNemonicLayer1: BottomLineView!
    @IBOutlet weak var mNemonicLayer2: BottomLineView!
    @IBOutlet weak var mNemonicLayer3: BottomLineView!
    @IBOutlet weak var mNemonicLayer4: BottomLineView!
    @IBOutlet weak var mNemonicLayer5: BottomLineView!
    @IBOutlet weak var mNemonicLayer6: BottomLineView!
    @IBOutlet weak var mNemonicLayer7: BottomLineView!
    @IBOutlet weak var mNemonicLayer8: BottomLineView!
    @IBOutlet weak var mNemonicLayer9: BottomLineView!
    @IBOutlet weak var mNemonicLayer10: BottomLineView!
    @IBOutlet weak var mNemonicLayer11: BottomLineView!
    @IBOutlet weak var mNemonicLayer12: BottomLineView!
    @IBOutlet weak var mNemonicLayer13: BottomLineView!
    @IBOutlet weak var mNemonicLayer14: BottomLineView!
    @IBOutlet weak var mNemonicLayer15: BottomLineView!
    @IBOutlet weak var mNemonicLayer16: BottomLineView!
    @IBOutlet weak var mNemonicLayer17: BottomLineView!
    @IBOutlet weak var mNemonicLayer18: BottomLineView!
    @IBOutlet weak var mNemonicLayer19: BottomLineView!
    @IBOutlet weak var mNemonicLayer20: BottomLineView!
    @IBOutlet weak var mNemonicLayer21: BottomLineView!
    @IBOutlet weak var mNemonicLayer22: BottomLineView!
    @IBOutlet weak var mNemonicLayer23: BottomLineView!
    
    @IBOutlet weak var mNemonicInput0: UITextField!
    @IBOutlet weak var mNemonicInput1: UITextField!
    @IBOutlet weak var mNemonicInput2: UITextField!
    @IBOutlet weak var mNemonicInput3: UITextField!
    @IBOutlet weak var mNemonicInput4: UITextField!
    @IBOutlet weak var mNemonicInput5: UITextField!
    @IBOutlet weak var mNemonicInput6: UITextField!
    @IBOutlet weak var mNemonicInput7: UITextField!
    @IBOutlet weak var mNemonicInput8: UITextField!
    @IBOutlet weak var mNemonicInput9: UITextField!
    @IBOutlet weak var mNemonicInput10: UITextField!
    @IBOutlet weak var mNemonicInput11: UITextField!
    @IBOutlet weak var mNemonicInput12: UITextField!
    @IBOutlet weak var mNemonicInput13: UITextField!
    @IBOutlet weak var mNemonicInput14: UITextField!
    @IBOutlet weak var mNemonicInput15: UITextField!
    @IBOutlet weak var mNemonicInput16: UITextField!
    @IBOutlet weak var mNemonicInput17: UITextField!
    @IBOutlet weak var mNemonicInput18: UITextField!
    @IBOutlet weak var mNemonicInput19: UITextField!
    @IBOutlet weak var mNemonicInput20: UITextField!
    @IBOutlet weak var mNemonicInput21: UITextField!
    @IBOutlet weak var mNemonicInput22: UITextField!
    @IBOutlet weak var mNemonicInput23: UITextField!

    var mNemonicLayers: [BottomLineView] = [BottomLineView]()
    var mNemonicInputs: [UITextField] = [UITextField]()
    
    @IBOutlet weak var suggestCollectionView: UICollectionView!
    @IBOutlet weak var wordCntLabel: UILabel!
    var allMnemonicWords = [String]()
    var filteredMnemonicWords = [String]()
    var userInputWords = [String]()
    var mCurrentPosition = 0;
    var customPath = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mNemonicLayers = [self.mNemonicLayer0, self.mNemonicLayer1, self.mNemonicLayer2, self.mNemonicLayer3,
                               self.mNemonicLayer4, self.mNemonicLayer5, self.mNemonicLayer6, self.mNemonicLayer7,
                               self.mNemonicLayer8, self.mNemonicLayer9, self.mNemonicLayer10, self.mNemonicLayer11,
                               self.mNemonicLayer12, self.mNemonicLayer13, self.mNemonicLayer14, self.mNemonicLayer15,
                               self.mNemonicLayer16, self.mNemonicLayer17, self.mNemonicLayer18, self.mNemonicLayer19,
                               self.mNemonicLayer20, self.mNemonicLayer21, self.mNemonicLayer22, self.mNemonicLayer23]
        
        self.mNemonicInputs = [self.mNemonicInput0, self.mNemonicInput1, self.mNemonicInput2, self.mNemonicInput3,
                               self.mNemonicInput4, self.mNemonicInput5, self.mNemonicInput6, self.mNemonicInput7,
                               self.mNemonicInput8, self.mNemonicInput9, self.mNemonicInput10, self.mNemonicInput11,
                               self.mNemonicInput12, self.mNemonicInput13, self.mNemonicInput14, self.mNemonicInput15,
                               self.mNemonicInput16, self.mNemonicInput17, self.mNemonicInput18, self.mNemonicInput19,
                               self.mNemonicInput20, self.mNemonicInput21, self.mNemonicInput22, self.mNemonicInput23]
        
        for i in 0 ..< self.mNemonicInputs.count {
            self.mNemonicInputs[i].inputView = UIView();
            self.mNemonicInputs[i].tag = i
            self.mNemonicInputs[i].addTarget(self, action: #selector(myTargetFunction), for: UIControl.Event.editingDidBegin)
        }
        
        for word in WKey.english {
            allMnemonicWords.append(String(word))
        }
        
        self.suggestCollectionView.delegate = self
        self.suggestCollectionView.dataSource = self
        self.suggestCollectionView.register(UINib(nibName: "MnemonicCell", bundle: nil), forCellWithReuseIdentifier: "MnemonicCell")
        
        self.topView.isHidden = true
        self.cardView.isHidden = true
        self.actionView.isHidden = true
        self.keyboardView.isHidden = true
        
        if (BaseData.instance.getUsingEnginerMode()) {
            self.onShowEnginerModeDialog()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.navigationBar.topItem?.title = NSLocalizedString("title_restore", comment: "")
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: NSLocalizedString("clear_all", comment: ""), style: .done, target: self, action: #selector(clearAll))
        
        if (chainType == nil) {
            self.onShowSelectChainDialog(false)
        } else {
            self.initViewUpdate()
        }
    }
    
    override func onChainSelected(_ chainType: ChainType) {
        self.chainType = chainType
        self.initViewUpdate()
    }
    
    func initViewUpdate() {
        self.mNeminicImg.image = self.mNeminicImg.image?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        self.mNeminicImg.tintColor = WUtils.getChainColor(self.chainType!)
        self.topView.isHidden = false
        self.cardView.isHidden = false
        self.actionView.isHidden = false
        self.keyboardView.isHidden = false
        self.updateFocus()
    }
    
    @objc func clearAll(sender: AnyObject) {
        userInputWords.removeAll()
        for i in 0 ..< self.mNemonicInputs.count {
            self.mNemonicInputs[i].text = ""
        }
        mCurrentPosition = 0
        updateFocus()
        updateWordCnt()
    }
    
    @objc func myTargetFunction(sender: UITextField) {
        mCurrentPosition = sender.tag
        updateFocus()
    }
    
    func updateFocus() {
        for i in 0 ..< self.mNemonicLayers.count {
            self.mNemonicLayers[i].hasFocused = false
        }
        self.mNemonicLayers[mCurrentPosition].hasFocused = true
        self.mNemonicInputs[mCurrentPosition].becomeFirstResponder()
        updateCollectionView()
    }
    
    func updateCollectionView() {
        filteredMnemonicWords.removeAll()
        if ((self.mNemonicInputs[mCurrentPosition].text?.count)! > 0) {
            let match = self.mNemonicInputs[mCurrentPosition].text
            filteredMnemonicWords = allMnemonicWords.filter { $0.starts(with: match ?? "") }
            if (mCurrentPosition == 23 && filteredMnemonicWords.count == 1 && (filteredMnemonicWords[0] == self.mNemonicInputs[mCurrentPosition].text)) {
                filteredMnemonicWords.removeAll()
            }
        }
        self.suggestCollectionView.reloadData()
    }
    
    func updateWordCnt() {
        var checkWords = [String]()
        checkWords.removeAll()
        for i in 0 ..< self.mNemonicInputs.count {
            if((self.mNemonicInputs[i].text?.count)! > 0) {
                checkWords.append(self.mNemonicInputs[i].text!)
            } else {
                break
            }
        }
        self.wordCntLabel.text = String(checkWords.count) + " words"
        if(!(checkWords.count == 12 || checkWords.count == 16 || checkWords.count == 24)) {
            self.wordCntLabel.textColor = UIColor.init(hexString: "f31963")
            return
        }
        for input in checkWords {
            if(!allMnemonicWords.contains(input)) {
                self.wordCntLabel.textColor = UIColor.init(hexString: "f31963")
                return
            }
        }
        self.wordCntLabel.textColor = WUtils.getChainColor(chainType!)
    }
    
    func onValidateUserinput() -> Bool {
        userInputWords.removeAll()
        for i in 0 ..< self.mNemonicInputs.count {
            if((self.mNemonicInputs[i].text?.count)! > 0) {
                userInputWords.append(self.mNemonicInputs[i].text!)
            } else {
                break
            }
        }
        if (!(userInputWords.count == 12 || userInputWords.count == 16 || userInputWords.count == 24)) {
            return false
        }
        for input in userInputWords {
            if (!allMnemonicWords.contains(input)) {
                return false
            }
        }
        if (BTCMnemonic.init(words: userInputWords, password: "", wordListType: .english) == nil) {
            return false
        }
        return true
    }
    
    
    @IBAction func onKeyClick(_ sender: UIButton) {
        let appendedText = (self.mNemonicInputs[mCurrentPosition].text)?.appending(sender.titleLabel?.text ?? "")
        self.mNemonicInputs[mCurrentPosition].text = appendedText
        updateCollectionView()
        updateWordCnt()
    }
    
    @IBAction func onDeleteClick(_ sender: Any) {
        if((self.mNemonicInputs[mCurrentPosition].text?.count)! > 0) {
            let subText = String(self.mNemonicInputs[mCurrentPosition].text?.dropLast() ?? "")
            self.mNemonicInputs[mCurrentPosition].text = subText
            updateCollectionView()
        } else {
            if (mCurrentPosition > 0) {
                mCurrentPosition = mCurrentPosition - 1
            } else {
                self.navigationController?.popViewController(animated: true)
                return
            }
            updateFocus()
        }
        updateWordCnt()
    }
    
    @IBAction func onSpaceClick(_ sender: Any) {
        if(mCurrentPosition < 23) {
            mCurrentPosition = mCurrentPosition + 1
        }
        updateFocus()
        updateWordCnt()
    }
    
    @IBAction func onPasteClick(_ sender: Any) {
        if let words = KeychainWrapper.standard.string(forKey: BaseData.instance.copySalt!)?.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: " ") {
            for i in 0 ..< self.mNemonicInputs.count {
                self.mNemonicInputs[i].text = ""
            }
            for i in 0 ..< self.mNemonicInputs.count {
                if (words.count > i) {
                    self.mNemonicInputs[i].text = words[i].replacingOccurrences(of: ",", with: "")
                        .replacingOccurrences(of: " ", with: "")
                }
            }
            if (words.count < 23) {
                mCurrentPosition = words.count
            } else {
                mCurrentPosition = 23
            }
            updateFocus()
            updateWordCnt()
            return;
        }
        if let myString = UIPasteboard.general.string {
            for i in 0 ..< self.mNemonicInputs.count {
                self.mNemonicInputs[i].text = ""
            }

            let userPaste : [String] = myString.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: " ")
            for i in 0 ..< self.mNemonicInputs.count {
                if(userPaste.count > i) {
                    self.mNemonicInputs[i].text = userPaste[i].replacingOccurrences(of: ",", with: "")
                        .replacingOccurrences(of: " ", with: "")
                }
            }
            if(userPaste.count < 23) {
                mCurrentPosition = userPaste.count
            } else {
                mCurrentPosition = 23
            }
            updateFocus()

        } else {
            self.onShowToast(NSLocalizedString("error_no_clipboard", comment: ""))

        }
        updateWordCnt()
    }
    
    @IBAction func onConfirmClick(_ sender: Any) {
        if(!onValidateUserinput()) {
            self.onShowToast(NSLocalizedString("error_recover_mnemonic", comment: ""))
            
        } else {
            if (self.chainType == ChainType.KAVA_MAIN) {
                self.onSelectBip44()
            } else if (self.chainType == ChainType.SECRET_MAIN) {
                self.onSelectBip44Secret()
            } else if (self.chainType == ChainType.OKEX_MAIN)  {
                self.onSelectKeyTypeForOKex()
            } else if (self.chainType == ChainType.FETCH_MAIN) {
                self.onSelectKeyTypeForFetch()
            }else if (self.chainType == ChainType.LUM_MAIN) {
                self.onSelectBip44Lum()
            } else {
                self.onCheckPassword()
            }
        }
    }
    
    func onSelectBip44() {
        let selectAlert = UIAlertController(title: NSLocalizedString("select_new_path_title", comment: ""), message: "", preferredStyle: .alert)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = NSTextAlignment.left
        let messageText = NSMutableAttributedString(
            string: NSLocalizedString("select_new_path_msg", comment: ""),
            attributes: [
                NSAttributedString.Key.paragraphStyle: paragraphStyle,
                NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: UIFont.TextStyle.caption1)
            ]
        )
        selectAlert.setValue(messageText, forKey: "attributedMessage")
        selectAlert.addAction(UIAlertAction(title: NSLocalizedString("kava_old_path", comment: ""), style: .default, handler: { _ in
            self.customPath = 0
            self.onCheckPassword()
        }))
        selectAlert.addAction(UIAlertAction(title: NSLocalizedString("kava_new_path", comment: ""), style: .default, handler: { _ in
            self.customPath = 1
            self.onCheckPassword()
        }))
        self.present(selectAlert, animated: true) {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissAlertController))
            selectAlert.view.superview?.subviews[0].addGestureRecognizer(tapGesture)
        }
    }
    
    //TODO app already release with new path so we just toggle "usingBip44" for secret case!(maintain warn!!)
    func onSelectBip44Secret() {
        let selectAlert = UIAlertController(title: NSLocalizedString("select_new_path_title", comment: ""), message: "", preferredStyle: .alert)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = NSTextAlignment.left
        let messageText = NSMutableAttributedString(
            string: NSLocalizedString("select_new_path_msg_secret", comment: ""),
            attributes: [
                NSAttributedString.Key.paragraphStyle: paragraphStyle,
                NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: UIFont.TextStyle.caption1)
            ]
        )
        selectAlert.setValue(messageText, forKey: "attributedMessage")
        selectAlert.addAction(UIAlertAction(title: NSLocalizedString("secret_old_path", comment: ""), style: .default, handler: { _ in
            self.customPath = 0
            self.onCheckPassword()
        }))
        selectAlert.addAction(UIAlertAction(title: NSLocalizedString("secret_new_path", comment: ""), style: .default, handler: { _ in
            self.customPath = 1
            self.onCheckPassword()
        }))
        self.present(selectAlert, animated: true) {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissAlertController))
            selectAlert.view.superview?.subviews[0].addGestureRecognizer(tapGesture)
        }
    }
    
    func onSelectKeyTypeForOKex() {
        let selectAlert = UIAlertController(title: NSLocalizedString("select_keytype_okex_title", comment: ""), message: "", preferredStyle: .alert)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = NSTextAlignment.left
        let messageText = NSMutableAttributedString(
            string: NSLocalizedString("select_keytype_okex_msg", comment: ""),
            attributes: [
                NSAttributedString.Key.paragraphStyle: paragraphStyle,
                NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: UIFont.TextStyle.caption1)
            ]
        )
        selectAlert.setValue(messageText, forKey: "attributedMessage")
        selectAlert.addAction(UIAlertAction(title: NSLocalizedString("keytype_okex_old", comment: ""), style: .default, handler: { _ in
            self.customPath = 0
            self.onCheckPassword()
        }))
        selectAlert.addAction(UIAlertAction(title: NSLocalizedString("keytype_okex_new", comment: ""), style: .default, handler: { _ in
            self.customPath = 1
            self.onCheckPassword()
        }))
        selectAlert.addAction(UIAlertAction(title: NSLocalizedString("keytype_okex_eth", comment: ""), style: .default, handler: { _ in
            self.customPath = 2
            self.onCheckPassword()
        }))
        self.present(selectAlert, animated: true) {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissAlertController))
            selectAlert.view.superview?.subviews[0].addGestureRecognizer(tapGesture)
        }
    }
    
    func onSelectKeyTypeForFetch() {
        let selectAlert = UIAlertController(title: NSLocalizedString("select_keytype_fetch_title", comment: ""), message: NSLocalizedString("select_keytype_fetch_msg", comment: ""), preferredStyle: .alert)
        selectAlert.addAction(UIAlertAction(title: NSLocalizedString("fetch_path_0", comment: ""), style: .default, handler: { _ in
            self.customPath = 0
            self.onCheckPassword()
        }))
        selectAlert.addAction(UIAlertAction(title: NSLocalizedString("fetch_path_1", comment: ""), style: .default, handler: { _ in
            self.customPath = 1
            self.onCheckPassword()
        }))
        selectAlert.addAction(UIAlertAction(title: NSLocalizedString("fetch_path_2", comment: ""), style: .default, handler: { _ in
            self.customPath = 2
            self.onCheckPassword()
        }))
        selectAlert.addAction(UIAlertAction(title: NSLocalizedString("fetch_path_3", comment: ""), style: .default, handler: { _ in
            self.customPath = 3
            self.onCheckPassword()
        }))
        self.present(selectAlert, animated: true) {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissAlertController))
            selectAlert.view.superview?.subviews[0].addGestureRecognizer(tapGesture)
        }
    }
    
    func onSelectBip44Lum() {
        let selectAlert = UIAlertController(title: NSLocalizedString("select_new_path_title", comment: ""), message: "", preferredStyle: .alert)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = NSTextAlignment.left
        let messageText = NSMutableAttributedString(
            string: NSLocalizedString("select_keytype_lum_msg", comment: ""),
            attributes: [
                NSAttributedString.Key.paragraphStyle: paragraphStyle,
                NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: UIFont.TextStyle.caption1)
            ]
        )
        selectAlert.setValue(messageText, forKey: "attributedMessage")
        selectAlert.addAction(UIAlertAction(title: NSLocalizedString("lum_path_default", comment: ""), style: .default, handler: { _ in
            self.customPath = 1
            self.onCheckPassword()
        }))
        selectAlert.addAction(UIAlertAction(title: NSLocalizedString("lum_path_airdrop", comment: ""), style: .default, handler: { _ in
            self.customPath = 0
            self.onCheckPassword()
        }))
        self.present(selectAlert, animated: true) {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissAlertController))
            selectAlert.view.superview?.subviews[0].addGestureRecognizer(tapGesture)
        }
    }
    
    func onCheckPassword() {
        let passwordVC = UIStoryboard(name: "Password", bundle: nil).instantiateViewController(withIdentifier: "PasswordViewController") as! PasswordViewController
        self.navigationItem.title = ""
        self.navigationController!.view.layer.add(WUtils.getPasswordAni(), forKey: kCATransition)
        passwordVC.resultDelegate = self
        if (!BaseData.instance.hasPassword()) {
            passwordVC.mTarget = PASSWORD_ACTION_INIT
        } else  {
            passwordVC.mTarget = PASSWORD_ACTION_SIMPLE_CHECK
        }
        self.navigationController?.pushViewController(passwordVC, animated: false)
    }
    
    func passwordResponse(result: Int) {
        if (result == PASSWORD_RESUKT_OK) {
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(610), execute: {
                let restorePathVC = UIStoryboard(name: "Init", bundle: nil).instantiateViewController(withIdentifier: "RestorePathViewController") as! RestorePathViewController
                self.navigationItem.title = ""
                restorePathVC.userInputWords = self.userInputWords
                restorePathVC.userChain = self.chainType
                restorePathVC.customPath = self.customPath
                self.navigationController?.pushViewController(restorePathVC, animated: true)
            })
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredMnemonicWords.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MnemonicCell", for: indexPath) as? MnemonicCell
        cell?.MnemonicLabel.text = filteredMnemonicWords[indexPath.row]
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 32)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.mNemonicInputs[mCurrentPosition].text = filteredMnemonicWords[indexPath.row]
        if (mCurrentPosition < 23) {
            mCurrentPosition = mCurrentPosition + 1
        }
        updateWordCnt()
        updateFocus()
    }
    
    func onShowEnginerModeDialog() {
        let enginerAlert = UIAlertController(title: NSLocalizedString("str_enginer_is_on_title", comment: ""),
                                             message: NSLocalizedString("str_enginer_is_on_msg", comment: ""),
                                             preferredStyle: .alert)
        enginerAlert.addAction(UIAlertAction(title: NSLocalizedString("cancel", comment: ""), style: .default, handler: { _ in
            self.navigationController?.popViewController(animated: true)
        }))
        enginerAlert.addAction(UIAlertAction(title:NSLocalizedString("continue", comment: ""), style: .destructive))
        self.present(enginerAlert, animated: true)
    }
}
