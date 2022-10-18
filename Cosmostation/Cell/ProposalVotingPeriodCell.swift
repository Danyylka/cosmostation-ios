//
//  ProposalVotingPeriodCell.swift
//  Cosmostation
//
//  Created by yongjoo jung on 2022/07/06.
//  Copyright © 2022 wannabit. All rights reserved.
//

import UIKit
import Alamofire
import GRPC
import NIO

class ProposalVotingPeriodCell: UITableViewCell {
    
    @IBOutlet weak var rootCardView: CardView!
    @IBOutlet weak var proposalTitleLabel: UILabel!
    @IBOutlet weak var votingEndTimeLabel: UILabel!
    @IBOutlet weak var myVoteStatusImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
//    var actionMultiVote: (() -> Void)? = nil
//
//    @IBAction func onMultiVoteClick(_ sender: UIButton) {
//        actionMultiVote?()
//    }
    
    func onBindView(_ chainConfig: ChainConfig?, _ proposal: MintscanProposalDetail, _ myVotes: Array<MintscanMyVotes>, _ selectMode: Bool, _ selected: Array<String>) {
        let title = "# ".appending(proposal.id!).appending("  ").appending(proposal.title ?? "")
        let time = WDP.dpTime(proposal.voting_end_time).appending(" ").appending(WDP.dpTimeGap(proposal.voting_end_time))
        proposalTitleLabel.text = title
        votingEndTimeLabel.text = time
        
        if (selectMode && selected.contains(proposal.id!)) {
            rootCardView.borderWidth = 1.0
            rootCardView.borderColor = chainConfig?.chainColor
            rootCardView.layer.borderWidth = 1
            rootCardView.layer.borderColor = chainConfig?.chainColor.cgColor
            
        } else {
            rootCardView.borderWidth = 0
            rootCardView.layer.borderWidth = 0
        }
        
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
