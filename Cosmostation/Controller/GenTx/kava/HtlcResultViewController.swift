//
//  HtlcResultViewController.swift
//  Cosmostation
//
//  Created by 정용주 on 2020/04/16.
//  Copyright © 2020 wannabit. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import HDWalletKit
import Alamofire
import GRPC
import NIO


class HtlcResultViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var htlcResultTableView: UITableView!
    @IBOutlet weak var bottomControlLayer: UIStackView!
    @IBOutlet weak var btnSentWallet: UIButton!
    @IBOutlet weak var btnReceievedWallet: UIButton!
    
    @IBOutlet weak var errorCard: CardView!
    @IBOutlet weak var errorMsgLabel: UILabel!
    @IBOutlet weak var errorCodeLabel: UILabel!
    
    @IBOutlet weak var loadingLayer: UIView!
    @IBOutlet weak var loadingImg: LoadingImageView!
    @IBOutlet weak var loadingProgressLabel: UILabel!
    
    var mHtlcDenom: String?
    var mHtlcToSendAmount = Array<Coin>()
    var mHtlcToChain: ChainType?
    var mHtlcToAccount: Account?
    var mHtlcSendFee: Fee?
    var mHtlcClaimFee: Fee?
    
    var mTimeStamp: Int64?
    var mRandomNumber: String?
    var mRandomNumberHash: String?
    
    var mSendHash: String?
    var mSendTxInfo: TxInfo?
    var mClaimHash: String?
    var mClaimTxInfo: TxInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.account = BaseData.instance.selectAccountById(id: BaseData.instance.getRecentAccountId())
        self.chainType = WUtils.getChainType(account!.account_base_chain)
        
        self.htlcResultTableView.delegate = self
        self.htlcResultTableView.dataSource = self
        self.htlcResultTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.htlcResultTableView.register(UINib(nibName: "HtlcResultSentCell", bundle: nil), forCellReuseIdentifier: "HtlcResultSentCell")
        self.htlcResultTableView.register(UINib(nibName: "HtlcResultClaimCell", bundle: nil), forCellReuseIdentifier: "HtlcResultClaimCell")
        self.htlcResultTableView.rowHeight = UITableView.automaticDimension
        self.htlcResultTableView.estimatedRowHeight = UITableView.automaticDimension
        

        self.loadingProgressLabel.text = NSLocalizedString("htlc_swap_progress_0", comment: "")
        self.loadingImg.onStartAnimation()
        self.onCheckCreateHtlcSwap()
        
    }
    
    func onUpdateProgress(_ step: Int) {
        if (step == 1) {
            loadingProgressLabel.text = NSLocalizedString("htlc_swap_progress_1", comment: "")
        } else if (step == 2) {
            loadingProgressLabel.text = NSLocalizedString("htlc_swap_progress_2", comment: "")
        } else if (step == 3) {
            loadingProgressLabel.text = NSLocalizedString("htlc_swap_progress_3", comment: "")
        }
    }
    
    var mTxFetchCnt = 2
    func onUpdateView(_ errorMSg: String) {
        self.loadingLayer.isHidden = false
        if (!errorMSg.isEmpty) {
            //TODO handle error case
            self.bottomControlLayer.isHidden = false
            self.loadingLayer.isHidden = true
            self.errorCard.isHidden = false
            self.errorCodeLabel.text = errorMSg
            
        } else {
            mTxFetchCnt = mTxFetchCnt - 1
            if (mTxFetchCnt == 0) {
                if (mSendTxInfo != nil && mClaimTxInfo != nil) {
                    self.htlcResultTableView.reloadData()
                    self.htlcResultTableView.isHidden = false
                    self.bottomControlLayer.isHidden = false
                    self.loadingLayer.isHidden = true
                    
                } else {
                    //TODO handle error case
                    self.bottomControlLayer.isHidden = false
                    self.loadingLayer.isHidden = true
                    self.errorCard.isHidden = false
                    self.errorCodeLabel.text = errorMSg
                    
                }
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (mSendTxInfo != nil && mClaimTxInfo != nil) {
            return 2
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row == 0 && mSendTxInfo != nil) {
            return onSetHtlcSentItems(tableView, indexPath);
        } else if (indexPath.row == 1 && mClaimTxInfo != nil) {
            return onSetHtlcClaimItems(tableView, indexPath);
        } else {
            let cell:HtlcResultSentCell? = tableView.dequeueReusableCell(withIdentifier:"HtlcResultSentCell") as? HtlcResultSentCell
            return cell!
        }
    }
    
    func onSetHtlcSentItems(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        let cell:HtlcResultSentCell? = tableView.dequeueReusableCell(withIdentifier:"HtlcResultSentCell") as? HtlcResultSentCell
        let msg = mSendTxInfo?.getMsgs()[0]
        cell?.sendImg.image = cell?.sendImg.image?.withRenderingMode(.alwaysTemplate)
        cell?.sendImg.tintColor = WUtils.getChainColor(chainType!)
        if (self.chainType == ChainType.BINANCE_MAIN) {
            cell?.blockHeightLabel.text = mSendTxInfo?.height
            cell?.txHashLabel.text = mSendTxInfo?.hash
            cell?.memoLabel.text = mSendTxInfo?.tx?.value.memo
            
            let sendCoin = msg?.value.getAmounts()![0]
            cell?.sentAmountLabel.attributedText = WUtils.displayAmount2(sendCoin?.amount, cell!.sentAmountLabel.font!, 8, 8)
            WUtils.setDenomTitle(chainType!, cell!.sentDenom)
            
            cell?.feeLabel.attributedText = WUtils.displayAmount2(FEE_BNB_TRANSFER, cell!.feeLabel.font!, 0, 8)
            WUtils.setDenomTitle(chainType!, cell!.feeDenom)
            
            cell?.senderLabel.text = msg?.value.from
            cell?.relayRecipientLabel.text = msg?.value.to
            cell?.relaySenderLabel.text = msg?.value.sender_other_chain
            cell?.recipientLabel.text = msg?.value.recipient_other_chain
            cell?.randomHashLabel.text = msg?.value.random_number_hash
            
        } else if (self.chainType == ChainType.KAVA_MAIN) {
            cell?.blockHeightLabel.text = mSendTxInfo?.height
            cell?.txHashLabel.text = mSendTxInfo?.txhash
            cell?.memoLabel.text = mSendTxInfo?.tx?.value.memo
            
            let sendCoin = msg?.value.getAmounts()![0]
            cell?.sentAmountLabel.attributedText = WUtils.displayAmount2(sendCoin?.amount, cell!.sentAmountLabel.font!, WUtils.getKavaCoinDecimal(sendCoin!.denom), WUtils.getKavaCoinDecimal(sendCoin!.denom))
            cell?.sentDenom.text = sendCoin?.denom.uppercased()
            
            cell?.feeLabel.attributedText = WUtils.displayAmount2(mSendTxInfo!.simpleFee().stringValue, cell!.feeLabel.font!, 6, 6)
            WUtils.setDenomTitle(chainType!, cell!.feeDenom)
            
            cell?.senderLabel.text = msg?.value.from
            cell?.relayRecipientLabel.text = msg?.value.to
            cell?.relaySenderLabel.text = msg?.value.sender_other_chain
            cell?.recipientLabel.text = msg?.value.recipient_other_chain
            cell?.randomHashLabel.text = msg?.value.random_number_hash
        }
        return cell!
    }
    
    func onSetHtlcClaimItems(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        let cell:HtlcResultClaimCell? = tableView.dequeueReusableCell(withIdentifier:"HtlcResultClaimCell") as? HtlcResultClaimCell
        let msg = mClaimTxInfo?.getMsgs()[0]
        cell?.claimImg.image = cell?.claimImg.image?.withRenderingMode(.alwaysTemplate)
        cell?.claimImg.tintColor = WUtils.getChainColor(mHtlcToChain!)
        if (self.mHtlcToChain == ChainType.BINANCE_MAIN) {
            cell?.blockHeightLabel.text = mClaimTxInfo?.height
            cell?.txHashLabel.text = mClaimTxInfo?.hash
            cell?.memoLabel.text = mClaimTxInfo?.tx?.value.memo
            
            cell?.receivedAmountLabel.text = ""
            cell?.receivedDenom.text = ""
            
            cell?.feeLabel.attributedText = WUtils.displayAmount2(FEE_BNB_TRANSFER, cell!.feeLabel.font!, 0, 8)
            WUtils.setDenomTitle(mHtlcToChain!, cell!.feeDenomLabel)
            
            cell?.claimerAddress.text = msg?.value.from
            cell?.randomNumberLabel.text = msg?.value.random_number
            cell?.swapIdLabel.text = msg?.value.swap_id
            
            
        } else if (self.mHtlcToChain == ChainType.KAVA_MAIN) {
            cell?.blockHeightLabel.text = mClaimTxInfo?.height
            cell?.txHashLabel.text = mClaimTxInfo?.txhash
            cell?.memoLabel.text = mClaimTxInfo?.tx?.value.memo
            
            let receiveCoin = mClaimTxInfo!.simpleSwapCoin()
            if (receiveCoin != nil && !receiveCoin!.denom.isEmpty) {
                cell?.receivedAmountLabel.attributedText = WUtils.displayAmount2(receiveCoin!.amount, cell!.receivedAmountLabel.font!, WUtils.getKavaCoinDecimal(receiveCoin!.denom), WUtils.getKavaCoinDecimal(receiveCoin!.denom))
                cell?.receivedDenom.text = receiveCoin!.denom.uppercased()
            }
            
            cell?.feeLabel.attributedText = WUtils.displayAmount2(mClaimTxInfo!.simpleFee().stringValue, cell!.feeLabel.font!, 6, 6)
            WUtils.setDenomTitle(mHtlcToChain!, cell!.feeDenomLabel)
            
            cell?.claimerAddress.text = msg?.value.from
            cell?.randomNumberLabel.text = msg?.value.random_number
            cell?.swapIdLabel.text = msg?.value.swap_id
            
        }
        return cell!
    }
    
    
    @IBAction func onClickSentWallet(_ sender: UIButton) {
        self.onStartMainTab()
    }
    
    @IBAction func onClickReceivedWallet(_ sender: UIButton) {
        if (BaseData.instance.dpSortedChains().contains(WUtils.getChainType(mHtlcToAccount!.account_base_chain)!)) {
            BaseData.instance.setRecentAccountId(mHtlcToAccount!.account_id)
            BaseData.instance.setLastTab(1)
            self.onStartMainTab()
            
        } else {
            self.onShowToast(NSLocalizedString("error_hided_chain", comment: ""))
            return
        }
    }
    
    
    
    func onCheckCreateHtlcSwap() {
        print("onCheckCreateHtlcSwap")
        if (self.chainType == ChainType.BINANCE_MAIN) {
            self.onCheckCreateHtlcSwapBinance()
        } else {
            self.onCheckCreateHtlcSwapKava()
        }
    }
    
    func onCheckCreateHtlcSwapBinance() {
        print("onCheckCreateHtlcSwapBinance")
        let request = Alamofire.request(BaseNetWork.accountInfoUrl(self.chainType, account!.account_address), method: .get, parameters: [:], encoding: URLEncoding.default, headers: [:])
        request.responseJSON { (response) in
            switch response.result {
            case .success(let res):
                guard let info = res as? [String : Any] else {
                    _ = BaseData.instance.deleteBalance(account: self.account!)
                    self.onUpdateView(NSLocalizedString("error_network", comment: ""))
                    return
                }
                let bnbAccountInfo = BnbAccountInfo.init(info)
                _ = BaseData.instance.updateAccount(WUtils.getAccountWithBnbAccountInfo(self.account!, bnbAccountInfo))
                BaseData.instance.updateBalances(self.account!.account_id, WUtils.getBalancesWithBnbAccountInfo(self.account!, bnbAccountInfo))
                self.onCreateHtlcSwapBinance()

            case .failure(let error):
                self.onUpdateView(error.localizedDescription)
                self.onShowToast(error.localizedDescription)
            }
        }
    }
    
    func onCreateHtlcSwapBinance() {
        print("onCreateHtlcSwapBinance")
        DispatchQueue.global().async {
            var privateKey: Data?
            if (self.account!.account_from_mnemonic == true) {
                if let words = KeychainWrapper.standard.string(forKey: self.account!.account_uuid.sha1())?.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: " ") {
                    privateKey = KeyFac.getPrivateRaw(words, self.account!)
                }
                
            } else {
                if let key = KeychainWrapper.standard.string(forKey: self.account!.getPrivateKeySha1()) {
                    privateKey = KeyFac.getPrivateFromString(key)
                }
            }
            
            self.mTimeStamp = Date().millisecondsSince1970 / 1000
            self.mRandomNumber = WKey.generateRandomBytes()
            self.mRandomNumberHash = WKey.getRandomNumnerHash(self.mRandomNumber!, self.mTimeStamp!)
            print("BINANCE mTimeStamp ", self.mTimeStamp)
            print("BINANCE mRandomNumber ", self.mRandomNumber)
            print("BINANCE mRandomNumberHash ", self.mRandomNumberHash)

            let bnbMsg = MsgGenerator.genBnbCreateHTLCSwapMsg(self.chainType!,
                                                              self.mHtlcToChain!,
                                                              self.account!,
                                                              self.mHtlcToAccount!,
                                                              self.mHtlcToSendAmount,
                                                              self.mTimeStamp!,
                                                              self.mRandomNumberHash!,
                                                              PrivateKey.init(pk: privateKey!.hexEncodedString(), coin: .bitcoin)!)
            DispatchQueue.main.async(execute: {
                do {
                    var encoding: ParameterEncoding = URLEncoding.default
                    encoding = HexEncoding(data: try bnbMsg.encode())
                    let param: Parameters = [ "address" : self.account!.account_address ]
                    let request = Alamofire.request(BaseNetWork.broadcastUrl(self.chainType), method: .post, parameters: param, encoding: encoding, headers: [:])
                    request.responseJSON { response in
                        switch response.result {
                        case .success(let res):
                            if let result = res as? Array<NSDictionary> {
                                self.mSendHash = result[0].object(forKey:"hash") as? String
                            }
                            DispatchQueue.main.async(execute: {
                                self.onFetchSwapId()
                            });

                        case .failure(let error):
                            self.onUpdateView(error.localizedDescription)
                        }
                    }

                } catch {
                    print(error)
                    self.onUpdateView(error.localizedDescription)
                }
            });
        }
    }
    
    func onCheckCreateHtlcSwapKava() {
        DispatchQueue.global().async {
            do {
                let channel = BaseNetWork.getConnection(self.chainType!, MultiThreadedEventLoopGroup(numberOfThreads: 1))!
                let req = Cosmos_Auth_V1beta1_QueryAccountRequest.with { $0.address = self.account!.account_address }
                let response = try Cosmos_Auth_V1beta1_QueryClient(channel: channel).account(req).response.wait()
                self.onCreateHtlcSwapKava(response)
            } catch {
                print("onFetchgRPCAuth failed: \(error)")
                DispatchQueue.main.async(execute: {
                    self.onUpdateView(error.localizedDescription)
                    self.onShowToast(error.localizedDescription)
                });
            }
        }
    }
    
    func onCreateHtlcSwapKava(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse?) {
        DispatchQueue.global().async {
            var privateKey: Data?
            var publicKey: Data?
            if (self.account!.account_from_mnemonic == true) {
                if let words = KeychainWrapper.standard.string(forKey: self.account!.account_uuid.sha1())?.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: " ") {
                    privateKey = KeyFac.getPrivateRaw(words, self.account!)
                    publicKey = KeyFac.getPublicFromPrivateKey(privateKey!)
                }
                
            } else {
                if let key = KeychainWrapper.standard.string(forKey: self.account!.getPrivateKeySha1()) {
                    privateKey = KeyFac.getPrivateFromString(key)
                    publicKey = KeyFac.getPublicFromPrivateKey(privateKey!)
                }
            }
            self.mTimeStamp = Date().millisecondsSince1970 / 1000
            self.mRandomNumber = WKey.generateRandomBytes()
            self.mRandomNumberHash = WKey.getRandomNumnerHash(self.mRandomNumber!, self.mTimeStamp!)
            print("KAVA mTimeStamp ", self.mTimeStamp)
            print("KAVA mRandomNumber ", self.mRandomNumber)
            print("KAVA mRandomNumberHash ", self.mRandomNumberHash)
            
            do {
                let channel = BaseNetWork.getConnection(self.chainType!, MultiThreadedEventLoopGroup(numberOfThreads: 1))!
                let reqTx = Signer.genSignedKavaCreateHTLCSwap(auth!,
                                                               self.account!.account_address,
                                                               self.mHtlcToAccount!.account_address,
                                                               self.mHtlcToSendAmount,
                                                               self.mTimeStamp!,
                                                               self.mRandomNumberHash!,
                                                               self.mHtlcSendFee!,
                                                               SWAP_MEMO_CREATE,
                                                               privateKey!, publicKey!,
                                                               BaseData.instance.getChainId(self.chainType))
                let response = try Cosmos_Tx_V1beta1_ServiceClient(channel: channel).broadcastTx(reqTx).response.wait()
                DispatchQueue.main.async(execute: {
                    print("response ", response.txResponse.txhash)
                    self.mSendHash = response.txResponse.txhash
                    DispatchQueue.main.async(execute: {
                        self.onFetchSwapId()
                    });
                });
            } catch {
                print("onCreateHtlcSwapKava failed: \(error)")
                DispatchQueue.main.async(execute: {
                    self.onUpdateView(error.localizedDescription)
                });
            }
        }
    }
    
    
    
    var mSwapFetchCnt = 15
    func onFetchSwapId() {
        onUpdateProgress(1)
//        print("onFetchSwapId ", mSwapFetchCnt)
        let swapId = WKey.getSwapId(self.mHtlcToChain!, self.mHtlcToSendAmount, self.mRandomNumberHash!, self.account!.account_address)
        let url = BaseNetWork.swapIdBep3Url(self.mHtlcToChain, swapId)
        print("swapId url ", url)
        let request = Alamofire.request(url, method: .get, parameters: [:], encoding: URLEncoding.default, headers: [:])
        request.responseJSON { (response) in
            switch response.result {
            case .success(let res):
                print("onFetchSwapId ", res)
                self.mSwapFetchCnt = self.mSwapFetchCnt - 1
                guard let info = res as? [String : Any], info["error"] == nil else {
                    if (self.mSwapFetchCnt > 0) {
                        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(6000), execute: {
                            self.onFetchSwapId()
                        })
                    } else {
                        self.onShowMoreSwapWait()
                    }
                    return
                }
                self.onCheckClaimHtlcSwap()
            
            case .failure(let error):
                print("onFetchSwapId failure", error , " ", self.mSwapFetchCnt)
                self.mSwapFetchCnt = self.mSwapFetchCnt - 1
                if (self.mSwapFetchCnt > 0) {
                    DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(6000), execute: {
                        self.onFetchSwapId()
                    })
                } else {
                    self.onShowMoreSwapWait()
                }
            }
        }
    }
    
    func onCheckClaimHtlcSwap() {
        print("onCheckClaimHtlcSwap")
        onUpdateProgress(2)
        if (self.mHtlcToChain == ChainType.BINANCE_MAIN) {
            self.onCheckClaimHtlcSwapBinance()
        } else {
            self.onCheckClaimHtlcSwapKava()
        }
    }
    
    func onCheckClaimHtlcSwapBinance() {
        print("onCheckClaimHtlcSwapBinance")
        let request = Alamofire.request(BaseNetWork.accountInfoUrl(mHtlcToChain, mHtlcToAccount!.account_address), method: .get, parameters: [:], encoding: URLEncoding.default, headers: [:])
        request.responseJSON { (response) in
            switch response.result {
            case .success(let res):
                guard let info = res as? [String : Any] else {
                    _ = BaseData.instance.deleteBalance(account: self.mHtlcToAccount!)
                    self.onUpdateView(NSLocalizedString("error_network", comment: ""))
                    return
                }
                let bnbAccountInfo = BnbAccountInfo.init(info)
                _ = BaseData.instance.updateAccount(WUtils.getAccountWithBnbAccountInfo(self.mHtlcToAccount!, bnbAccountInfo))
                BaseData.instance.updateBalances(self.mHtlcToAccount!.account_id, WUtils.getBalancesWithBnbAccountInfo(self.mHtlcToAccount!, bnbAccountInfo))
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(5000), execute: {
                    self.onClaimHtlcSwapBinance()
                })

            case .failure(let error):
                self.onUpdateView(error.localizedDescription)
                self.onShowToast(error.localizedDescription)
            }
        }
    }
    
    func onClaimHtlcSwapBinance() {
        print("onClaimHtlcSwapBinance")
        DispatchQueue.global().async {
            let group = DispatchGroup()
            var mHtlcToChainId = ""
            let request = Alamofire.request(BaseNetWork.nodeInfoUrl(self.mHtlcToChain), method: .get, parameters: [:], encoding: URLEncoding.default, headers: [:])
            group.enter()
            request.responseJSON { (response) in
                switch response.result {
                case .success(let res):
                    guard let responseData = res as? NSDictionary, let nodeInfo = responseData.object(forKey: "node_info") as? NSDictionary else {
                        return
                    }
                    mHtlcToChainId = NodeInfo.init(nodeInfo).network!
                    
                case .failure(let error):
                    print("Htlc Claim node info ", error)
                }
                group.leave()
            }
            group.wait()
            print("mHtlcToChainId ", mHtlcToChainId)
            
            var privateKey: Data?
            if (self.mHtlcToAccount!.account_from_mnemonic == true) {
                if let words = KeychainWrapper.standard.string(forKey: self.mHtlcToAccount!.account_uuid.sha1())?.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: " ") {
                    privateKey = KeyFac.getPrivateRaw(words, self.mHtlcToAccount!)
                }
                
            } else {
                if let key = KeychainWrapper.standard.string(forKey: self.mHtlcToAccount!.getPrivateKeySha1()) {
                    privateKey = KeyFac.getPrivateFromString(key)
                }
            }
            
            let swapId = WKey.getSwapId(self.mHtlcToChain!, self.mHtlcToSendAmount, self.mRandomNumberHash!, self.account!.account_address)
            let bnbMsg = MsgGenerator.genBnbClaimHTLCSwapMsg(self.mHtlcToAccount!,
                                                             self.mRandomNumber!,
                                                             swapId,
                                                             PrivateKey.init(pk: privateKey!.hexEncodedString(), coin: .bitcoin)!,
                                                             mHtlcToChainId)
            
            DispatchQueue.main.async(execute: {
                do {
                    var encoding: ParameterEncoding = URLEncoding.default
                    encoding = HexEncoding(data: try bnbMsg.encode())
                    let request = Alamofire.request(BaseNetWork.broadcastUrl(self.mHtlcToChain), method: .post, parameters: [:], encoding: encoding, headers: [:])
                    request.responseJSON { response in
                        switch response.result {
                        case .success(let res):
                            if let result = res as? Array<NSDictionary> {
                                self.mClaimHash = result[0].object(forKey:"hash") as? String
                                DispatchQueue.main.async(execute: {
                                    self.onFetchSendTx()
                                    self.onFetchClaimTx()
                                });
                            }
                            
                        case .failure(let error):
                            self.onUpdateView(error.localizedDescription)
                        }
                    }
                    
                } catch {
                    print(error)
                    self.onUpdateView(error.localizedDescription)
                }
            });
        }
    }
    
    func onCheckClaimHtlcSwapKava() {
        print("onCheckClaimHtlcSwapKava")
        DispatchQueue.global().async {
            do {
                let channel = BaseNetWork.getConnection(self.mHtlcToChain!, MultiThreadedEventLoopGroup(numberOfThreads: 1))!
                let req = Cosmos_Auth_V1beta1_QueryAccountRequest.with {  $0.address = self.mHtlcToAccount!.account_address }
                let response = try Cosmos_Auth_V1beta1_QueryClient(channel: channel).account(req).response.wait()
                self.onClaimHtlcSwapKava1(response)
            } catch {
                print("onFetchgRPCAuth failed: \(error)")
                DispatchQueue.main.async(execute: {
                    self.onUpdateView(error.localizedDescription)
                    self.onShowToast(error.localizedDescription)
                });
            }
        }
    }
    
    func onClaimHtlcSwapKava1(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse?) {
        print("onClaimHtlcSwapKava1 NodeInfo")
        DispatchQueue.global().async {
            do {
                let channel = BaseNetWork.getConnection(self.mHtlcToChain!, MultiThreadedEventLoopGroup(numberOfThreads: 1))!
                let req = Cosmos_Base_Tendermint_V1beta1_GetNodeInfoRequest()
                if let response = try? Cosmos_Base_Tendermint_V1beta1_ServiceClient(channel: channel).getNodeInfo(req, callOptions: BaseNetWork.getCallOptions()).response.wait() {
                    self.onClaimHtlcSwapKava2(auth, response.nodeInfo.network)
                }
                try channel.close().wait()
                
            } catch {
                print("onFetchgRPCNodeInfo failed: \(error)")
            }
        }
        
    }
    
    func onClaimHtlcSwapKava2(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse?, _ chainId: String) {
        print("onClaimHtlcSwapKava2")
        DispatchQueue.global().async {
            var privateKey: Data?
            var publicKey: Data?
            if (self.mHtlcToAccount!.account_from_mnemonic == true) {
                if let words = KeychainWrapper.standard.string(forKey: self.mHtlcToAccount!.account_uuid.sha1())?.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: " ") {
                    privateKey = KeyFac.getPrivateRaw(words, self.mHtlcToAccount!)
                    publicKey = KeyFac.getPublicFromPrivateKey(privateKey!)
                }
                
            } else {
                if let key = KeychainWrapper.standard.string(forKey: self.mHtlcToAccount!.getPrivateKeySha1()) {
                    privateKey = KeyFac.getPrivateFromString(key)
                    publicKey = KeyFac.getPublicFromPrivateKey(privateKey!)
                }
            }
            
            do {
                let swapId = WKey.getSwapId(self.mHtlcToChain!, self.mHtlcToSendAmount, self.mRandomNumberHash!, self.account!.account_address)
                let channel = BaseNetWork.getConnection(self.mHtlcToChain!, MultiThreadedEventLoopGroup(numberOfThreads: 1))!
                let reqTx = Signer.genSignedKavaClaimHTLCSwap(auth!,
                                                              self.mHtlcToAccount!.account_address,
                                                              swapId,
                                                              self.mRandomNumber!,
                                                              self.mHtlcClaimFee!,
                                                              SWAP_MEMO_CLAIM,
                                                              privateKey!, publicKey!,
                                                              chainId)
                let response = try Cosmos_Tx_V1beta1_ServiceClient(channel: channel).broadcastTx(reqTx).response.wait()
                DispatchQueue.main.async(execute: {
                    print("onClaimHtlcSwapKava2 response ", response)
                    self.mClaimHash = response.txResponse.txhash
                    self.onFetchSendTx()
                    self.onFetchClaimTx()
                });
                
            } catch {
                print("onClaimHtlcSwapKava2 failed: \(error)")
            }
        }
    }
    
    
    func onShowMoreSwapWait() {
        let noticeAlert = UIAlertController(title: NSLocalizedString("more_wait_swap_title", comment: ""), message: NSLocalizedString("more_wait_swap_msg", comment: ""), preferredStyle: .alert)
        noticeAlert.addAction(UIAlertAction(title: NSLocalizedString("close", comment: ""), style: .default, handler: { _ in
            self.dismiss(animated: true, completion: nil)
            self.onStartMainTab()
        }))
        noticeAlert.addAction(UIAlertAction(title: NSLocalizedString("wait", comment: ""), style: .default, handler: { _ in
            self.mSwapFetchCnt = 15
            self.onFetchSwapId()
        }))
        self.present(noticeAlert, animated: true, completion: nil)
    }
    
    
    func onFetchSendTx() {
        print("onFetchSendTx ", BaseNetWork.txUrl(self.chainType, mSendHash!))
        var request:DataRequest?
        if (self.chainType == ChainType.BINANCE_MAIN) {
            request = Alamofire.request(BaseNetWork.txUrl(self.chainType, mSendHash!), method: .get, parameters: ["format":"json"], encoding: URLEncoding.default, headers: [:])
        } else if (self.chainType == ChainType.KAVA_MAIN) {
            request = Alamofire.request(BaseNetWork.txUrl(self.chainType, mSendHash!), method: .get, parameters: [:], encoding: URLEncoding.default, headers: [:])
        }
        request!.responseJSON { (response) in
            switch response.result {
            case .success(let res):
                guard let info = res as? [String : Any], info["error"] == nil else {
                    print("onFetchSendTx error")
                    self.onUpdateView(NSLocalizedString("error_network", comment: ""))
                    return
                }
                print("onFetchSendTx OK", res)
                self.mSendTxInfo = TxInfo.init(info)
                self.onUpdateView("")
                
            case .failure(let error):
                print("onFetchSendTx failure", error)
                self.onUpdateView(error.localizedDescription)
                return
            }
        }
        
    }
    
    var mClaimTxFetchCnt = 50
    func onFetchClaimTx() {
        onUpdateProgress(3)
        print("onFetchClaimTx ", BaseNetWork.txUrl(self.mHtlcToChain, mClaimHash!))
        var request:DataRequest?
        if (self.mHtlcToChain == ChainType.BINANCE_MAIN) {
            request = Alamofire.request(BaseNetWork.txUrl(self.mHtlcToChain, mClaimHash!), method: .get, parameters: ["format":"json"], encoding: URLEncoding.default, headers: [:])
        } else if (self.mHtlcToChain == ChainType.KAVA_MAIN) {
            request = Alamofire.request(BaseNetWork.txUrl(self.mHtlcToChain, mClaimHash!), method: .get, parameters: [:], encoding: URLEncoding.default, headers: [:])
        }
        request!.responseJSON { (response) in
            switch response.result {
            case .success(let res):
                print("onFetchClaimTx OK", res)
                self.mClaimTxFetchCnt = self.mClaimTxFetchCnt - 1
                guard let info = res as? [String : Any], info["error"] == nil else {
                    if (self.mClaimTxFetchCnt > 0) {
                        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(6000), execute: {
                            self.onFetchClaimTx()
                        })
                    }
                    return
                }
                self.mClaimTxInfo = TxInfo.init(info)
                self.onUpdateView("")
                
            case .failure(let error):
                self.mClaimTxFetchCnt = self.mClaimTxFetchCnt - 1
                if (self.mClaimTxFetchCnt > 0) {
                    DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(6000), execute: {
                        self.onFetchClaimTx()
                    })
                } else {
                    self.onUpdateView(error.localizedDescription)
                }
                print("onFetchClaimTx failure", error)
                return
            }
        }
    }
}
