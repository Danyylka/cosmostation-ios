//
//  SifDexIbcPoolViewController.swift
//  Cosmostation
//
//  Created by 정용주 on 2021/10/15.
//  Copyright © 2021 wannabit. All rights reserved.
//

import UIKit
import GRPC
import NIO
import SwiftProtobuf

class SifDexIbcPoolViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var loadingImg: LoadingImageView!
    @IBOutlet weak var poolListTableView: UITableView!
    
    var mMyIbcAssets = Array<String>()
    var mMyIbcProviders = Array<Sifnode_Clp_V1_LiquidityProviderRes>()
    var mMyIbcPools = Array<Sifnode_Clp_V1_Pool>()
    var mOtherIbcPools = Array<Sifnode_Clp_V1_Pool>()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.account = BaseData.instance.selectAccountById(id: BaseData.instance.getRecentAccountId())
        self.chainType = WUtils.getChainType(account!.account_base_chain)
        self.loadingImg.onStartAnimation()
        
        self.poolListTableView.delegate = self
        self.poolListTableView.dataSource = self
        self.poolListTableView.register(UINib(nibName: "SifMyPoolCell", bundle: nil), forCellReuseIdentifier: "SifMyPoolCell")
        self.poolListTableView.register(UINib(nibName: "SifPoolCell", bundle: nil), forCellReuseIdentifier: "SifPoolCell")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(self.onSifDexFetchDone(_:)), name: Notification.Name("SifDexFetchDone"), object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: Notification.Name("SifDexFetchDone"), object: nil)
    }
    
    func updateView() {
        self.poolListTableView.reloadData()
        self.loadingImg.onStopAnimation()
        self.loadingImg.isHidden = true
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
            return mMyIbcPools.count
            
        } else {
            return mOtherIbcPools.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.section == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier:"SifMyPoolCell") as? SifMyPoolCell
            let myPool = mMyIbcPools[indexPath.row]
            let myProvider = mMyIbcProviders.filter { $0.liquidityProvider.asset.symbol == myPool.externalAsset.symbol }.first
            cell?.onBindSifPoolView(myPool, myProvider)
            return cell!
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier:"SifPoolCell") as? SifPoolCell
            let myPool = mOtherIbcPools[indexPath.row]
            cell?.onBindSifPoolView(myPool)
            return cell!
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.section == 0) {
            let noticeAlert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
            noticeAlert.addAction(UIAlertAction(title: NSLocalizedString("title_pool_join", comment: ""), style: .default, handler: { _ in
                self.onCheckPoolJoin(self.mMyIbcPools[indexPath.row])
            }))
            noticeAlert.addAction(UIAlertAction(title: NSLocalizedString("title_pool_exit", comment: ""), style: .default, handler: { _ in
                self.onCheckExitJoin(self.mMyIbcPools[indexPath.row])
            }))
            self.present(noticeAlert, animated: true) {
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissAlertController))
                noticeAlert.view.superview?.subviews[0].addGestureRecognizer(tapGesture)
            }
            
        } else {
            self.onCheckPoolJoin(self.mOtherIbcPools[indexPath.row])
        }
    }
    
    func onCheckPoolJoin(_ pool: Sifnode_Clp_V1_Pool) {
        print("IBC onCheckPoolJoin")
    }
    
    func onCheckExitJoin(_ pool: Sifnode_Clp_V1_Pool) {
        print("IBC onCheckExitJoin")
    }
    
    @objc func onSifDexFetchDone(_ notification: NSNotification) {
        BaseData.instance.mSifDexMyAssets_gRPC.forEach { asset in
            if (asset.symbol.starts(with: "ibc/")) {
                mMyIbcAssets.append(asset.symbol)
            }
        }
        print("mMyIbcAssets ", mMyIbcAssets.count)
        
        BaseData.instance.mSifDexPools_gRPC.forEach { pool in
            if (pool.externalAsset.symbol.starts(with: "ibc/")) {
                if (mMyIbcAssets.contains(pool.externalAsset.symbol)) {
                    mMyIbcPools.append(pool)
                } else {
                    mOtherIbcPools.append(pool)
                }
            }
        }
        print("mMyIbcPools ", mMyIbcPools.count)
        print("mOtherIbcPools ", mOtherIbcPools.count)
        
        if (mMyIbcAssets.count > 0) {
            self.mMyIbcProviders.removeAll()
            mFetchCnt = mMyIbcAssets.count
            mMyIbcAssets.forEach { symbol in
                onFetchMyProviderInfo(account!.account_address, symbol)
            }
            
        } else {
            self.updateView()
        }
    }
    
    var mFetchCnt = 0
    func onFetchFinished() {
        self.mFetchCnt = self.mFetchCnt - 1
        if (mFetchCnt > 0) { return }
        
        print("mMyIbcProviders ", mMyIbcProviders.count)
        self.updateView()
    }
    
    func onFetchMyProviderInfo(_ address: String, _ denom: String) {
        DispatchQueue.global().async {
            do {
                let channel = BaseNetWork.getConnection(self.chainType!, MultiThreadedEventLoopGroup(numberOfThreads: 1))!
                let req = Sifnode_Clp_V1_LiquidityProviderReq.with { $0.lpAddress = address; $0.symbol = denom }
                if let response = try? Sifnode_Clp_V1_QueryClient(channel: channel).getLiquidityProvider(req, callOptions: BaseNetWork.getCallOptions()).response.wait() {
                    self.mMyIbcProviders.append(response)
                }
                try channel.close().wait()
                
            } catch {
                print("onFetchMyProviderInfo failed: \(error)")
            }
            DispatchQueue.main.async(execute: { self.onFetchFinished() });
        }
    }

}
