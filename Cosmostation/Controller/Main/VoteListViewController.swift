//
//  VoteListViewController.swift
//  Cosmostation
//
//  Created by yongjoo on 05/03/2019.
//  Copyright © 2019 wannabit. All rights reserved.
//

import UIKit
import Alamofire
import SafariServices
import GRPC
import NIO

class VoteListViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var chainBg: UIImageView!
    @IBOutlet weak var voteTableView: UITableView!
    @IBOutlet weak var emptyLabel: UILabel!
    @IBOutlet weak var loadingImg: LoadingImageView!
    
    var mProposals_gRPC = Array<Cosmos_Gov_V1beta1_Proposal>()
    var mProposals_Certik_gRPC = Array<Shentu_Gov_V1alpha1_Proposal>()
    var mainTabVC: MainTabViewController!
    var refresher: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainTabVC = (self.parent)?.parent as? MainTabViewController
        self.chainType = WUtils.getChainType(mainTabVC.mAccount.account_base_chain)
        
        self.voteTableView.delegate = self
        self.voteTableView.dataSource = self
        self.voteTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.voteTableView.register(UINib(nibName: "ProposalCell", bundle: nil), forCellReuseIdentifier: "ProposalCell")
        self.voteTableView.rowHeight = UITableView.automaticDimension
        self.voteTableView.estimatedRowHeight = UITableView.automaticDimension
        
        self.refresher = UIRefreshControl()
        self.refresher.addTarget(self, action: #selector(onFetchProposals), for: .valueChanged)
        self.refresher.tintColor = UIColor.white
        self.voteTableView.addSubview(refresher)
        
        self.loadingImg.onStartAnimation()
        self.onFetchProposals()
    }
    
    @objc func onFetchProposals() {
        if (chainType == ChainType.CERTIK_MAIN) {
            self.onFetchCertikProposals_gRPC()
        } else {
            self.onFetchProposals_gRPC()
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.navigationController?.navigationBar.topItem?.title = NSLocalizedString("title_vote_list", comment: "");
        self.navigationItem.title = NSLocalizedString("title_vote_list", comment: "");
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func onUpdateViews() {
        if(mProposals_gRPC.count > 0 || mProposals_Certik_gRPC.count > 0) {
            self.emptyLabel.isHidden = true
            self.voteTableView.reloadData()
        } else {
            self.emptyLabel.isHidden = false
        }
        self.sortProposals()
        self.refresher.endRefreshing()
        self.loadingImg.onStopAnimation()
        self.loadingImg.isHidden = true
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (chainType == ChainType.CERTIK_MAIN) {
            return self.mProposals_Certik_gRPC.count
        } else {
            return self.mProposals_gRPC.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (chainType == ChainType.CERTIK_MAIN) {
            return onBindCertikProposal_gRPC(tableView, indexPath)
        } else {
            return onBindProposal_gRPC(tableView, indexPath)
        }
    }
    
    func onBindProposal_gRPC(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell  {
        let cell:ProposalCell? = tableView.dequeueReusableCell(withIdentifier:"ProposalCell") as? ProposalCell
        let proposal = mProposals_gRPC[indexPath.row]
        cell?.proposalIdLabel.text = "# ".appending(String(proposal.proposalID))
        cell?.proposalTitleLabel.text = WUtils.onParseProposalTitle(proposal.content)
        cell?.proposalMsgLabel.text = WUtils.onParseProposalDescription(proposal.content)
        cell?.proposalStateLabel.text = WUtils.onParseProposalStatusTxt(proposal)
        cell?.proposalStateImg.image = WUtils.onParseProposalStatusImg(proposal)
        return cell!
    }
    
    func onBindCertikProposal_gRPC(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell  {
        let cell:ProposalCell? = tableView.dequeueReusableCell(withIdentifier:"ProposalCell") as? ProposalCell
        let proposal = mProposals_Certik_gRPC[indexPath.row]
        cell?.proposalIdLabel.text = "# ".appending(String(proposal.proposalID))
        cell?.proposalTitleLabel.text = WUtils.onParseProposalTitle(proposal.content)
        cell?.proposalMsgLabel.text = WUtils.onParseProposalDescription(proposal.content)
        cell?.proposalStateLabel.text = WUtils.onParseProposalStatusCertikTxt(proposal.status)
        cell?.proposalStateImg.image = WUtils.onParseProposalStatusCertikImg(proposal.status)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (chainType == ChainType.CERTIK_MAIN) {
            let proposal = mProposals_Certik_gRPC[indexPath.row]
            if (proposal.status  == Shentu_Gov_V1alpha1_ProposalStatus.depositPeriod || proposal.status  == Shentu_Gov_V1alpha1_ProposalStatus.validatorVotingPeriod) {
                let voteDetailsVC = UIStoryboard(name: "MainStoryboard", bundle: nil).instantiateViewController(withIdentifier: "VoteDetailsViewController") as! VoteDetailsViewController
                voteDetailsVC.proposalId = String(proposal.proposalID)
                self.navigationItem.title = ""
                self.navigationController?.pushViewController(voteDetailsVC, animated: true)
            } else {
                onExplorerLink(String(proposal.proposalID))
            }
            
        } else {
            let proposal = mProposals_gRPC[indexPath.row]
            if (proposal.status == Cosmos_Gov_V1beta1_ProposalStatus.passed || proposal.status == Cosmos_Gov_V1beta1_ProposalStatus.rejected) {
                onExplorerLink(String(proposal.proposalID))
            } else {
                let voteDetailsVC = UIStoryboard(name: "MainStoryboard", bundle: nil).instantiateViewController(withIdentifier: "VoteDetailsViewController") as! VoteDetailsViewController
                voteDetailsVC.proposalId = String(proposal.proposalID)
                self.navigationItem.title = ""
                self.navigationController?.pushViewController(voteDetailsVC, animated: true)
            }
        }
    }
    
    func onExplorerLink(_ proposalId: String) {
        let link = WUtils.getProposalExplorer(self.chainType!, proposalId)
        guard let url = URL(string: link) else { return }
        self.onShowSafariWeb(url)
    }
    
    @objc func onFetchProposals_gRPC() {
        DispatchQueue.global().async {
            let group = MultiThreadedEventLoopGroup(numberOfThreads: 1)
            defer { try! group.syncShutdownGracefully() }
            
            let channel = BaseNetWork.getConnection(self.chainType!, group)!
            defer { try! channel.close().wait() }
            
            let req = Cosmos_Gov_V1beta1_QueryProposalsRequest.init()
            do {
                let response = try Cosmos_Gov_V1beta1_QueryClient(channel: channel).proposals(req).response.wait()
                self.mProposals_gRPC = response.proposals
                
            } catch {
                print("onFetchProposals_gRPC failed: \(error)")
            }
            DispatchQueue.main.async(execute: {
                self.onUpdateViews()
            });
        }
    }
    
    @objc func onFetchCertikProposals_gRPC() {
        DispatchQueue.global().async {
            let group = MultiThreadedEventLoopGroup(numberOfThreads: 1)
            defer { try! group.syncShutdownGracefully() }
            
            let channel = BaseNetWork.getConnection(self.chainType!, group)!
            defer { try! channel.close().wait() }
            
            do {
                let req = Shentu_Gov_V1alpha1_QueryProposalsRequest.init()
                let response = try Shentu_Gov_V1alpha1_QueryClient(channel: channel).proposals(req, callOptions:BaseNetWork.getCallOptions()).response.wait()
                self.mProposals_Certik_gRPC = response.proposals

            } catch {
                print("onFetchCertikProposals_gRPC failed: \(error)")
            }
            DispatchQueue.main.async(execute: {
                self.onUpdateViews()
            });
        }
        
    }
    
    func sortProposals() {
        if (chainType == ChainType.CERTIK_MAIN) {
            self.mProposals_Certik_gRPC.sort {
                return $0.proposalID < $1.proposalID ? false : true
            }
            
        } else {
            self.mProposals_gRPC.sort{
                return $0.proposalID < $1.proposalID ? false : true
            }
        }
    }

}
