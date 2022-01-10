//
//  TxDetailgRPCViewController.swift
//  Cosmostation
//
//  Created by 정용주 on 2021/03/17.
//  Copyright © 2021 wannabit. All rights reserved.
//

import UIKit
import GRPC
import NIO

class TxDetailgRPCViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var txTableView: UITableView!
    @IBOutlet weak var controlLayer: UIStackView!
    @IBOutlet weak var errorLayer: CardView!
    @IBOutlet weak var errorCode: UILabel!
    @IBOutlet weak var loadingImg: LoadingImageView!
    
    var mIsGen: Bool = false
    var mTxHash: String?
    var mBroadCaseResult: Cosmos_Tx_V1beta1_BroadcastTxResponse?
    var mFetchCnt = 10
    var mTxRespose: Cosmos_Tx_V1beta1_GetTxResponse?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.account = BaseData.instance.selectAccountById(id: BaseData.instance.getRecentAccountId())
        self.chainType = WUtils.getChainType(account!.account_base_chain)
        self.loadingImg.onStartAnimation()
        
        self.txTableView.delegate = self
        self.txTableView.dataSource = self
        self.txTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.txTableView.rowHeight = UITableView.automaticDimension
        self.txTableView.estimatedRowHeight = UITableView.automaticDimension
        self.txTableView.register(UINib(nibName: "TxCommonCell", bundle: nil), forCellReuseIdentifier: "TxCommonCell")
        self.txTableView.register(UINib(nibName: "TxTransferCell", bundle: nil), forCellReuseIdentifier: "TxTransferCell")
        self.txTableView.register(UINib(nibName: "TxDelegateCell", bundle: nil), forCellReuseIdentifier: "TxDelegateCell")
        self.txTableView.register(UINib(nibName: "TxUndelegateCell", bundle: nil), forCellReuseIdentifier: "TxUndelegateCell")
        self.txTableView.register(UINib(nibName: "TxRedelegateCell", bundle: nil), forCellReuseIdentifier: "TxRedelegateCell")
        self.txTableView.register(UINib(nibName: "TxRewardCell", bundle: nil), forCellReuseIdentifier: "TxRewardCell")
        self.txTableView.register(UINib(nibName: "TxCommissionCell", bundle: nil), forCellReuseIdentifier: "TxCommissionCell")
        self.txTableView.register(UINib(nibName: "TxEditRewardAddressCell", bundle: nil), forCellReuseIdentifier: "TxEditRewardAddressCell")
        self.txTableView.register(UINib(nibName: "TxVoteCell", bundle: nil), forCellReuseIdentifier: "TxVoteCell")
        //for starname msg type
        self.txTableView.register(UINib(nibName: "TxRegisterDomainCell", bundle: nil), forCellReuseIdentifier: "TxRegisterDomainCell")
        self.txTableView.register(UINib(nibName: "TxRegisterAccountCell", bundle: nil), forCellReuseIdentifier: "TxRegisterAccountCell")
        self.txTableView.register(UINib(nibName: "TxDeleteDomainCell", bundle: nil), forCellReuseIdentifier: "TxDeleteDomainCell")
        self.txTableView.register(UINib(nibName: "TxDeleteAccountCell", bundle: nil), forCellReuseIdentifier: "TxDeleteAccountCell")
        self.txTableView.register(UINib(nibName: "TxReplaceResourceCell", bundle: nil), forCellReuseIdentifier: "TxReplaceResourceCell")
        self.txTableView.register(UINib(nibName: "TxRenewStarnameCell", bundle: nil), forCellReuseIdentifier: "TxRenewStarnameCell")
        //for osmosis msg type
        self.txTableView.register(UINib(nibName: "TxCreatePoolCell", bundle: nil), forCellReuseIdentifier: "TxCreatePoolCell")
        self.txTableView.register(UINib(nibName: "TxJoinPoolCell", bundle: nil), forCellReuseIdentifier: "TxJoinPoolCell")
        self.txTableView.register(UINib(nibName: "TxExitPoolCell", bundle: nil), forCellReuseIdentifier: "TxExitPoolCell")
        self.txTableView.register(UINib(nibName: "TxTokenSwapCell", bundle: nil), forCellReuseIdentifier: "TxTokenSwapCell")
        self.txTableView.register(UINib(nibName: "TxLockTokenCell", bundle: nil), forCellReuseIdentifier: "TxLockTokenCell")
        self.txTableView.register(UINib(nibName: "TxBeginUnlockTokenCell", bundle: nil), forCellReuseIdentifier: "TxBeginUnlockTokenCell")
        self.txTableView.register(UINib(nibName: "TxBeginUnlockAllTokensCell", bundle: nil), forCellReuseIdentifier: "TxBeginUnlockAllTokensCell")
        self.txTableView.register(UINib(nibName: "TxUnlockPeriodLockCell", bundle: nil), forCellReuseIdentifier: "TxUnlockPeriodLockCell")
        
        //for ibc msg type
        self.txTableView.register(UINib(nibName: "TxIbcSendCell", bundle: nil), forCellReuseIdentifier: "TxIbcSendCell")
        self.txTableView.register(UINib(nibName: "TxIbcReceiveCell", bundle: nil), forCellReuseIdentifier: "TxIbcReceiveCell")
        self.txTableView.register(UINib(nibName: "TxIbcUpdateClientCell", bundle: nil), forCellReuseIdentifier: "TxIbcUpdateClientCell")
        self.txTableView.register(UINib(nibName: "TxIbcAcknowledgeCell", bundle: nil), forCellReuseIdentifier: "TxIbcAcknowledgeCell")
        
        //for gravity liquidation
        self.txTableView.register(UINib(nibName: "TxGravityCreatePoolCell", bundle: nil), forCellReuseIdentifier: "TxGravityCreatePoolCell")
        self.txTableView.register(UINib(nibName: "TxGravityDepositBatchCell", bundle: nil), forCellReuseIdentifier: "TxGravityDepositBatchCell")
        self.txTableView.register(UINib(nibName: "TxGravityWithdrawBatchCell", bundle: nil), forCellReuseIdentifier: "TxGravityWithdrawBatchCell")
        self.txTableView.register(UINib(nibName: "TxGravitySwapCell", bundle: nil), forCellReuseIdentifier: "TxGravitySwapCell")
        
        //for rizon
        self.txTableView.register(UINib(nibName: "TxRizonEventHorizonCell", bundle: nil), forCellReuseIdentifier: "TxRizonEventHorizonCell")
        
        //for sif msg type
        self.txTableView.register(UINib(nibName: "TxSifIncentiveCell", bundle: nil), forCellReuseIdentifier: "TxSifIncentiveCell")
        self.txTableView.register(UINib(nibName: "TxSifAddLpCell", bundle: nil), forCellReuseIdentifier: "TxSifAddLpCell")
        self.txTableView.register(UINib(nibName: "TxSifRemoveLpCell", bundle: nil), forCellReuseIdentifier: "TxSifRemoveLpCell")
        self.txTableView.register(UINib(nibName: "TxSifSwapCell", bundle: nil), forCellReuseIdentifier: "TxSifSwapCell")
        
        //for NFT msg type
        self.txTableView.register(UINib(nibName: "TxIssueNFTDenomCell", bundle: nil), forCellReuseIdentifier: "TxIssueNFTDenomCell")
        self.txTableView.register(UINib(nibName: "TxIssueNFTCell", bundle: nil), forCellReuseIdentifier: "TxIssueNFTCell")
        self.txTableView.register(UINib(nibName: "TxSendNFTCell", bundle: nil), forCellReuseIdentifier: "TxSendNFTCell")
        
        //for Desmos msg type
        self.txTableView.register(UINib(nibName: "TxSaveProfileCell", bundle: nil), forCellReuseIdentifier: "TxSaveProfileCell")
        self.txTableView.register(UINib(nibName: "TxLinkAccountCell", bundle: nil), forCellReuseIdentifier: "TxLinkAccountCell")
        
        //for unknown msg type
        self.txTableView.register(UINib(nibName: "TxUnknownCell", bundle: nil), forCellReuseIdentifier: "TxUnknownCell")
        
        if (mIsGen) {
            if (mBroadCaseResult?.txResponse.code != 0 || mBroadCaseResult?.txResponse.txhash == nil) {
                self.onShowError(mBroadCaseResult?.txResponse.code, mBroadCaseResult?.txResponse.rawLog)
            } else {
                mTxHash = mBroadCaseResult?.txResponse.txhash
            }
        }
        self.onFetchgRPCTx(mTxHash!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func onUpdateView() {
        self.loadingImg.isHidden = true
        self.controlLayer.isHidden = false
        self.txTableView.isHidden = false
        self.txTableView.reloadData()
    }
    
    func onShowError(_ code: UInt32?, _ msg: String?) {
        let dpCode = code ?? 8000
        let dpMsg = msg ?? "unKnown"
        
        self.loadingImg.isHidden = true
        self.errorCode.text = "error code : " + String(dpCode) + "\n" + dpMsg
        self.errorLayer.isHidden = false
        self.controlLayer.isHidden = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (mTxRespose == nil || mTxRespose!.tx.body.messages.count <= 0) {
            return 0
        }
        return mTxRespose!.tx.body.messages.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row == 0) {
            return onBindTxCommon(tableView)
        } else {
            let msg = mTxRespose!.tx.body.messages[indexPath.row - 1]
            if (msg.typeURL.contains(Cosmos_Bank_V1beta1_MsgSend.protoMessageName)) {
                let cell = tableView.dequeueReusableCell(withIdentifier:"TxTransferCell") as? TxTransferCell
                cell?.onBindMsg(chainType!, mTxRespose!, indexPath.row - 1, account!.account_address)
                return cell!
                
            } else if (msg.typeURL.contains(Cosmos_Staking_V1beta1_MsgDelegate.protoMessageName)) {
                let cell = tableView.dequeueReusableCell(withIdentifier:"TxDelegateCell") as? TxCell
                cell?.onBindMsg(chainType!, mTxRespose!, indexPath.row - 1)
                return cell!
                
            } else if (msg.typeURL.contains(Cosmos_Staking_V1beta1_MsgUndelegate.protoMessageName)) {
                let cell = tableView.dequeueReusableCell(withIdentifier:"TxUndelegateCell") as? TxCell
                cell?.onBindMsg(chainType!, mTxRespose!, indexPath.row - 1)
                return cell!
                
            } else if (msg.typeURL.contains(Cosmos_Staking_V1beta1_MsgBeginRedelegate.protoMessageName)) {
                let cell = tableView.dequeueReusableCell(withIdentifier:"TxRedelegateCell") as? TxCell
                cell?.onBindMsg(chainType!, mTxRespose!, indexPath.row - 1)
                return cell!
                
            } else if (msg.typeURL.contains(Cosmos_Distribution_V1beta1_MsgWithdrawDelegatorReward.protoMessageName)) {
                let cell = tableView.dequeueReusableCell(withIdentifier:"TxRewardCell") as? TxCell
                cell?.onBindMsg(chainType!, mTxRespose!, indexPath.row - 1)
                return cell!
                
            } else if (msg.typeURL.contains(Cosmos_Distribution_V1beta1_MsgWithdrawValidatorCommission.protoMessageName)) {
                let cell = tableView.dequeueReusableCell(withIdentifier:"TxCommissionCell") as? TxCell
                cell?.onBindMsg(chainType!, mTxRespose!, indexPath.row - 1)
                return cell!
                
            } else if (msg.typeURL.contains(Cosmos_Distribution_V1beta1_MsgSetWithdrawAddress.protoMessageName)) {
                let cell = tableView.dequeueReusableCell(withIdentifier:"TxEditRewardAddressCell") as? TxCell
                cell?.onBindMsg(chainType!, mTxRespose!, indexPath.row - 1)
                return cell!
                
            } else if (msg.typeURL.contains(Cosmos_Gov_V1beta1_MsgVote.protoMessageName)) {
                let cell = tableView.dequeueReusableCell(withIdentifier:"TxVoteCell") as? TxCell
                cell?.onBindMsg(chainType!, mTxRespose!, indexPath.row - 1)
                return cell!
                
            }
            
            else if (msg.typeURL.contains(Ibc_Applications_Transfer_V1_MsgTransfer.protoMessageName)) {
                let cell = tableView.dequeueReusableCell(withIdentifier:"TxIbcSendCell") as? TxCell
                cell?.onBindMsg(chainType!, mTxRespose!, indexPath.row - 1)
                return cell!
                
            } else if (msg.typeURL.contains(Ibc_Core_Channel_V1_MsgRecvPacket.protoMessageName)) {
                let cell = tableView.dequeueReusableCell(withIdentifier:"TxIbcReceiveCell") as? TxCell
                cell?.onBindMsg(chainType!, mTxRespose!, indexPath.row - 1)
                return cell!
                
            } else if (msg.typeURL.contains(Ibc_Core_Client_V1_MsgUpdateClient.protoMessageName)) {
                let cell = tableView.dequeueReusableCell(withIdentifier:"TxIbcUpdateClientCell") as? TxCell
                cell?.onBindMsg(chainType!, mTxRespose!, indexPath.row - 1)
                return cell!
                
            } else if (msg.typeURL.contains(Ibc_Core_Channel_V1_MsgAcknowledgement.protoMessageName)) {
                let cell = tableView.dequeueReusableCell(withIdentifier:"TxIbcAcknowledgeCell") as? TxCell
                cell?.onBindMsg(chainType!, mTxRespose!, indexPath.row - 1)
                return cell!
            }
            
            else if (msg.typeURL.contains(Starnamed_X_Starname_V1beta1_MsgRegisterDomain.protoMessageName)) {
                let cell = tableView.dequeueReusableCell(withIdentifier:"TxRegisterDomainCell") as? TxCell
                cell?.onBindMsg(chainType!, mTxRespose!, indexPath.row - 1)
                return cell!
                
            } else if (msg.typeURL.contains(Starnamed_X_Starname_V1beta1_MsgRegisterAccount.protoMessageName)) {
                let cell = tableView.dequeueReusableCell(withIdentifier:"TxRegisterAccountCell") as? TxCell
                cell?.onBindMsg(chainType!, mTxRespose!, indexPath.row - 1)
                return cell!
                
            } else if (msg.typeURL.contains(Starnamed_X_Starname_V1beta1_MsgDeleteDomain.protoMessageName)) {
                let cell = tableView.dequeueReusableCell(withIdentifier:"TxDeleteDomainCell") as? TxCell
                cell?.onBindMsg(chainType!, mTxRespose!, indexPath.row - 1)
                return cell!
                
            } else if (msg.typeURL.contains(Starnamed_X_Starname_V1beta1_MsgDeleteAccount.protoMessageName)) {
                let cell = tableView.dequeueReusableCell(withIdentifier:"TxDeleteAccountCell") as? TxCell
                cell?.onBindMsg(chainType!, mTxRespose!, indexPath.row - 1)
                return cell!
                
            } else if (msg.typeURL.contains(Starnamed_X_Starname_V1beta1_MsgRenewDomain.protoMessageName) || msg.typeURL.contains(Starnamed_X_Starname_V1beta1_MsgRenewAccount.protoMessageName)) {
                let cell = tableView.dequeueReusableCell(withIdentifier:"TxRenewStarnameCell") as? TxCell
                cell?.onBindMsg(chainType!, mTxRespose!, indexPath.row - 1)
                return cell!
                
            } else if (msg.typeURL.contains(Starnamed_X_Starname_V1beta1_MsgReplaceAccountResources.protoMessageName)) {
                let cell = tableView.dequeueReusableCell(withIdentifier:"TxReplaceResourceCell") as? TxCell
                cell?.onBindMsg(chainType!, mTxRespose!, indexPath.row - 1)
                return cell!
                
            }
            
            else if (msg.typeURL.contains(Osmosis_Gamm_V1beta1_MsgCreateBalancerPool.protoMessageName)) {
                let cell = tableView.dequeueReusableCell(withIdentifier:"TxCreatePoolCell") as? TxCell
                cell?.onBindMsg(chainType!, mTxRespose!, indexPath.row - 1)
                return cell!
                
            } else if (msg.typeURL.contains(Osmosis_Gamm_V1beta1_MsgJoinPool.protoMessageName)) {
                let cell = tableView.dequeueReusableCell(withIdentifier:"TxJoinPoolCell") as? TxCell
                cell?.onBindMsg(chainType!, mTxRespose!, indexPath.row - 1)
                return cell!
                
            } else if (msg.typeURL.contains(Osmosis_Gamm_V1beta1_MsgExitPool.protoMessageName)) {
                let cell = tableView.dequeueReusableCell(withIdentifier:"TxExitPoolCell") as? TxCell
                cell?.onBindMsg(chainType!, mTxRespose!, indexPath.row - 1)
                return cell!
                
            } else if (msg.typeURL.contains(Osmosis_Gamm_V1beta1_MsgSwapExactAmountIn.protoMessageName) || msg.typeURL.contains(Osmosis_Gamm_V1beta1_MsgSwapExactAmountOut.protoMessageName)) {
                let cell = tableView.dequeueReusableCell(withIdentifier:"TxTokenSwapCell") as? TxCell
                cell?.onBindMsg(chainType!, mTxRespose!, indexPath.row - 1)
                return cell!
                
            } else if (msg.typeURL.contains(Osmosis_Gamm_V1beta1_MsgJoinSwapExternAmountIn.protoMessageName)) {
                
            } else if (msg.typeURL.contains(Osmosis_Gamm_V1beta1_MsgJoinSwapShareAmountOut.protoMessageName)) {
                
            } else if (msg.typeURL.contains(Osmosis_Gamm_V1beta1_MsgExitSwapExternAmountOut.protoMessageName)) {
                
            } else if (msg.typeURL.contains(Osmosis_Gamm_V1beta1_MsgExitSwapShareAmountIn.protoMessageName)) {
                
            }
            
            else if (msg.typeURL.contains(Osmosis_Lockup_MsgLockTokens.protoMessageName)) {
                let cell = tableView.dequeueReusableCell(withIdentifier:"TxLockTokenCell") as? TxCell
                cell?.onBindMsg(chainType!, mTxRespose!, indexPath.row - 1)
                return cell!
                
            } else if (msg.typeURL == ("/" + Osmosis_Lockup_MsgBeginUnlocking.protoMessageName)) {
                let cell = tableView.dequeueReusableCell(withIdentifier:"TxBeginUnlockTokenCell") as? TxCell
                cell?.onBindMsg(chainType!, mTxRespose!, indexPath.row - 1)
                return cell!
                
            } else if (msg.typeURL == ("/" + Osmosis_Lockup_MsgBeginUnlockingAll.protoMessageName)) {
                let cell = tableView.dequeueReusableCell(withIdentifier:"TxBeginUnlockAllTokensCell") as? TxCell
                cell?.onBindMsg(chainType!, mTxRespose!, indexPath.row - 1)
                return cell!
                
            }
//            else if (msg.typeURL.contains(Osmosis_Lockup_MsgUnlockPeriodLock.protoMessageName)) {
//                let cell = tableView.dequeueReusableCell(withIdentifier:"TxUnlockPeriodLockCell") as? TxCell
//                cell?.onBindMsg(chainType!, mTxRespose!, indexPath.row - 1)
//                return cell!
//                
//            }
            
            else if (msg.typeURL.contains(Tendermint_Liquidity_V1beta1_MsgCreatePool.protoMessageName)) {
                let cell = tableView.dequeueReusableCell(withIdentifier:"TxGravityCreatePoolCell") as? TxCell
                cell?.onBindMsg(chainType!, mTxRespose!, indexPath.row - 1)
                return cell!
                
            } else if (msg.typeURL.contains(Tendermint_Liquidity_V1beta1_MsgDepositWithinBatch.protoMessageName)) {
                let cell = tableView.dequeueReusableCell(withIdentifier:"TxGravityDepositBatchCell") as? TxCell
                cell?.onBindMsg(chainType!, mTxRespose!, indexPath.row - 1)
                return cell!
                
            } else if (msg.typeURL.contains(Tendermint_Liquidity_V1beta1_MsgWithdrawWithinBatch.protoMessageName)) {
                let cell = tableView.dequeueReusableCell(withIdentifier:"TxGravityWithdrawBatchCell") as? TxCell
                cell?.onBindMsg(chainType!, mTxRespose!, indexPath.row - 1)
                return cell!
                
            } else if (msg.typeURL.contains(Tendermint_Liquidity_V1beta1_MsgSwapWithinBatch.protoMessageName)) {
                let cell = tableView.dequeueReusableCell(withIdentifier:"TxGravitySwapCell") as? TxCell
                cell?.onBindMsg(chainType!, mTxRespose!, indexPath.row - 1)
                return cell!
                
            }
            
            else if (msg.typeURL.contains(Sifnode_Clp_V1_MsgAddLiquidity.protoMessageName)) {
                let cell = tableView.dequeueReusableCell(withIdentifier:"TxSifAddLpCell") as? TxCell
                cell?.onBindMsg(chainType!, mTxRespose!, indexPath.row - 1)
                return cell!
                
            } else if (msg.typeURL.contains(Sifnode_Clp_V1_MsgRemoveLiquidity.protoMessageName)) {
                let cell = tableView.dequeueReusableCell(withIdentifier:"TxSifRemoveLpCell") as? TxCell
                cell?.onBindMsg(chainType!, mTxRespose!, indexPath.row - 1)
                return cell!
                
            } else if (msg.typeURL.contains(Sifnode_Clp_V1_MsgSwap.protoMessageName)) {
                let cell = tableView.dequeueReusableCell(withIdentifier:"TxSifSwapCell") as? TxCell
                cell?.onBindMsg(chainType!, mTxRespose!, indexPath.row - 1)
                return cell!
                
            } else if (msg.typeURL.contains(Sifnode_Dispensation_V1_MsgCreateUserClaim.protoMessageName)) {
                let cell = tableView.dequeueReusableCell(withIdentifier:"TxSifIncentiveCell") as? TxCell
                cell?.onBindMsg(chainType!, mTxRespose!, indexPath.row - 1)
                return cell!
                
            }
            
            else if (msg.typeURL.contains(Irismod_Nft_MsgIssueDenom.protoMessageName) || msg.typeURL.contains(Chainmain_Nft_V1_MsgIssueDenom.protoMessageName)) {
                let cell = tableView.dequeueReusableCell(withIdentifier:"TxIssueNFTDenomCell") as? TxIssueNFTDenomCell
                cell?.onBindMsg(chainType!, mTxRespose!, indexPath.row - 1)
                return cell!
                
            } else if (msg.typeURL.contains(Irismod_Nft_MsgMintNFT.protoMessageName) || msg.typeURL.contains(Chainmain_Nft_V1_MsgMintNFT.protoMessageName)) {
                let cell = tableView.dequeueReusableCell(withIdentifier:"TxIssueNFTCell") as? TxCell
                cell?.onBindMsg(chainType!, mTxRespose!, indexPath.row - 1)
                return cell!
                
            } else if (msg.typeURL.contains(Irismod_Nft_MsgTransferNFT.protoMessageName) || msg.typeURL.contains(Chainmain_Nft_V1_MsgTransferNFT.protoMessageName)) {
                let cell = tableView.dequeueReusableCell(withIdentifier:"TxSendNFTCell") as? TxSendNFTCell
                cell?.onBindMsg(chainType!, mTxRespose!, indexPath.row - 1, account!.account_address)
                return cell!
                
            }
            
            else if (msg.typeURL.contains(Desmos_Profiles_V1beta1_MsgSaveProfile.protoMessageName)) {
                let cell = tableView.dequeueReusableCell(withIdentifier:"TxSaveProfileCell") as? TxSaveProfileCell
                cell?.onBindMsg(chainType!, mTxRespose!, indexPath.row - 1)
                return cell!
                
            } else if (msg.typeURL.contains(Desmos_Profiles_V1beta1_MsgLinkChainAccount.protoMessageName)) {
                let cell = tableView.dequeueReusableCell(withIdentifier:"TxLinkAccountCell") as? TxLinkAccountCell
                cell?.onBindMsg(chainType!, mTxRespose!, indexPath.row - 1)
                return cell!
                
            }
            
            else if (msg.typeURL.contains(Rizonworld_Rizon_Tokenswap_MsgCreateTokenswapRequest.protoMessageName)) {
                let cell = tableView.dequeueReusableCell(withIdentifier:"TxRizonEventHorizonCell") as? TxCell
                cell?.onBindMsg(chainType!, mTxRespose!, indexPath.row - 1)
                return cell!
                
            }
            
            return onBindUnknown(tableView)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension;
    }

    
    // bind tx and msg
    func onBindTxCommon(_ tableView: UITableView) -> UITableViewCell {
        let cell:TxCommonCell? = tableView.dequeueReusableCell(withIdentifier:"TxCommonCell") as? TxCommonCell
        cell?.onBind(chainType!, mTxRespose!)
        return cell!
    }
    
    func onBindUnknown(_ tableView: UITableView) -> UITableViewCell  {
        let cell:TxUnknownCell? = tableView.dequeueReusableCell(withIdentifier:"TxUnknownCell") as? TxUnknownCell
        cell?.onBind(chainType!, mTxRespose!)
        return cell!
    }
    
    
    func onFetchgRPCTx(_ txHash: String) {
        print("onFetchgRPCTx ", txHash)
        DispatchQueue.global().async {
            let group = MultiThreadedEventLoopGroup(numberOfThreads: 1)
            defer { try! group.syncShutdownGracefully() }
            
            let channel = BaseNetWork.getConnection(self.chainType!, group)!
            defer { try! channel.close().wait() }
            
            let req = Cosmos_Tx_V1beta1_GetTxRequest.with {
                $0.hash = txHash
            }
            do {
                let response = try Cosmos_Tx_V1beta1_ServiceClient(channel: channel).getTx(req).response.wait()
                self.mTxRespose = response
                DispatchQueue.main.async(execute: { self.onUpdateView() });
                
            } catch {
                print("onFetchgRPCTx failed: \(error)")
                if (self.mIsGen) {
                    self.mFetchCnt = self.mFetchCnt - 1
                    if (self.mFetchCnt > 0) {
                        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(6000), execute: {
                            self.onFetchgRPCTx(self.mTxHash!)
                        })
                    } else {
                        DispatchQueue.main.async(execute: { self.onShowMoreWait() });
                    }
                } else {
                    DispatchQueue.main.async(execute: { self.onShowError(nil, nil) });
                }
            }
        }
        
    }
    
    func onShowMoreWait() {
        let noticeAlert = UIAlertController(title: NSLocalizedString("more_wait_title", comment: ""), message: NSLocalizedString("more_wait_msg", comment: ""), preferredStyle: .alert)
        noticeAlert.addAction(UIAlertAction(title: NSLocalizedString("close", comment: ""), style: .default, handler: { _ in
            self.dismiss(animated: true, completion: nil)
            self.onStartMainTab()
        }))
        noticeAlert.addAction(UIAlertAction(title: NSLocalizedString("wait", comment: ""), style: .default, handler: { _ in
            self.mFetchCnt = 10
            self.onFetchgRPCTx(self.mTxHash!)
        }))
        self.present(noticeAlert, animated: true) {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissAlertController))
            noticeAlert.view.superview?.subviews[0].addGestureRecognizer(tapGesture)
        }
    }
    
    @IBAction func onClickShare(_ sender: UIButton) {
        if (self.errorLayer.isHidden) {
            let link = WUtils.getTxExplorer(self.chainType!, self.mTxHash!)
            let textToShare = [ link ]
            let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func onClickExplorer(_ sender: UIButton) {
        let link = WUtils.getTxExplorer(self.chainType!, self.mTxHash!)
        guard let url = URL(string: link) else { return }
        self.onShowSafariWeb(url)
    }
    
    @IBAction func onClickDismiss(_ sender: UIButton) {
        self.mFetchCnt = -1
        if (mIsGen){
            self.onStartMainTab()
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }

}
