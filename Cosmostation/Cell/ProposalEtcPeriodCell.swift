//
//  ProposalEtcPeriodCell.swift
//  Cosmostation
//
//  Created by yongjoo jung on 2022/07/06.
//  Copyright © 2022 wannabit. All rights reserved.
//

import UIKit
import Alamofire
import GRPC
import NIO

class ProposalEtcPeriodCell: UITableViewCell {
    
    @IBOutlet weak var proposalTitleLabel: UILabel!
    @IBOutlet weak var myVoteStatusImg: UIImageView!
    @IBOutlet weak var proposalStateLabel: UILabel!
    @IBOutlet weak var proposalStateImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    override func prepareForReuse() {
        self.myVoteStatusImg.isHidden = false
        self.myVoteStatusImg.image = UIImage.init(named: "imgVoteWeight")
    }
    
    func onBindView(_ chainConfig: ChainConfig?, _ proposal: MintscanProposalDetail, _ myVotes: Array<MintscanMyVotes>) {
        let title = "# ".appending(proposal.id!).appending("  ").appending(proposal.title ?? "")
        proposalTitleLabel.text = title
        proposalStateLabel.text = WUtils.onProposalStatusTxt(proposal)
        proposalStateImg.image = WUtils.onProposalStatusImg(proposal)
        
        if let rawVote = myVotes.filter({ String($0.proposal_id ?? -1) == proposal.id }).first {
            if (rawVote.votes.count > 1) {
                self.myVoteStatusImg.image = UIImage.init(named: "imgVoteWeight")
            } else {
                let myVote = rawVote.votes[0]
                if (myVote.option?.contains("OPTION_YES") == true) {
                    self.myVoteStatusImg.image = UIImage.init(named: "imgVoteYes")
                    return
                } else if (myVote.option?.contains("OPTION_NO_WITH_VETO") == true) {
                    self.myVoteStatusImg.image = UIImage.init(named: "imgVoteVeto")
                    return
                } else if (myVote.option?.contains("OPTION_NO") == true) {
                    self.myVoteStatusImg.image = UIImage.init(named: "imgVoteNo")
                    return
                } else if (myVote.option?.contains("OPTION_ABSTAIN") == true) {
                    self.myVoteStatusImg.image = UIImage.init(named: "imgVoteAbstain")
                    return
                } else {
                    self.myVoteStatusImg.isHidden = true
                }
            }
        } else {
            self.myVoteStatusImg.image = UIImage.init(named: "imgNotVoted")
        }
        
    }
}
