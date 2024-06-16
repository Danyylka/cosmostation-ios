//
//  ChainSelectVC.swift
//  Cosmostation
//
//  Created by yongjoo jung on 2023/08/25.
//  Copyright © 2023 wannabit. All rights reserved.
//

import UIKit
import Lottie

class ChainSelectVC: BaseVC {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchEmptyLayer: UIView!
    @IBOutlet weak var selectBtn: SecButton!
    @IBOutlet weak var confirmBtn: BaseButton!
    @IBOutlet weak var loadingView: LottieAnimationView!
    var searchBar: UISearchBar?
    
    var onChainSelected: (() -> Void)? = nil
    var dpTags = [String]()
    var mainnetChains = [BaseChain]()
    var searchMainnets = [BaseChain]()
    var testnetChains = [BaseChain]()
    var searchTestnets = [BaseChain]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadingView.isHidden = false
        loadingView.animation = LottieAnimation.named("loadingSmallYellow")
        loadingView.contentMode = .scaleAspectFit
        loadingView.loopMode = .loop
        loadingView.animationSpeed = 1.3
        loadingView.play()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "SelectChainCell", bundle: nil), forCellReuseIdentifier: "SelectChainCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.sectionHeaderTopPadding = 0.0
        
        searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 44))
        searchBar?.searchTextField.textColor = .color01
        searchBar?.tintColor = UIColor.white
        searchBar?.barTintColor = UIColor.clear
        searchBar?.searchTextField.font = .fontSize14Bold
        searchBar?.backgroundImage = UIImage()
        searchBar?.delegate = self
        tableView.tableHeaderView = searchBar
        
        let dismissTap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        dismissTap.cancelsTouchesInView = false
        view.addGestureRecognizer(dismissTap)
        
        baseAccount = BaseData.instance.baseAccount
        
        baseAccount.initSortChains()
        baseAccount.fetchAllChains()
        
        mainnetChains = baseAccount.allChains.filter({ $0.isTestnet == false })
        searchMainnets = mainnetChains
        
        testnetChains = baseAccount.allChains.filter({ $0.isTestnet == true })
        searchTestnets = testnetChains
        
        dpTags = BaseData.instance.getDisplayCosmosChainTags(baseAccount.id)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(self.onFetchDone(_:)), name: Notification.Name("FetchData"), object: nil)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: Notification.Name("FetchData"), object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if (baseAccount.allChains.filter({ $0.fetchState == .Busy }).count == 0 ) {
            DispatchQueue.main.async {
                self.selectBtn.isEnabled = true
                self.loadingView.isHidden = true
            }
        }
    }
    
    override func setLocalizedString() {
        titleLabel.text = NSLocalizedString("title_select_wallet", comment: "")
        selectBtn.setTitle(NSLocalizedString("str_select_valuables", comment: ""), for: .normal)
        confirmBtn.setTitle(NSLocalizedString("str_confirm", comment: ""), for: .normal)
    }
    
    @objc func dismissKeyboard() {
        searchBar?.endEditing(true)
    }
    
    @objc func onFetchDone(_ notification: NSNotification) {
        let tag = notification.object as! String
        Task {
            onUpdateRow(tag)
        }
    }
    
    func onUpdateRow(_ tag: String) {
        for i in 0..<searchMainnets.count {
            if (searchMainnets[i].tag == tag) {
                DispatchQueue.main.async {
                    self.tableView.beginUpdates()
                    self.tableView.reloadRows(at: [IndexPath(row: i, section: 0)], with: .none)
                    self.tableView.endUpdates()
                }
            }
        }
        for i in 0..<searchTestnets.count {
            if (searchTestnets[i].tag == tag) {
                DispatchQueue.main.async {
                    self.tableView.beginUpdates()
                    self.tableView.reloadRows(at: [IndexPath(row: i, section: 1)], with: .none)
                    self.tableView.endUpdates()
                }
            }
        }
        
        if (baseAccount.allChains.filter({ $0.fetchState == .Busy }).count == 0 ) {
            DispatchQueue.main.async {
                self.selectBtn.isEnabled = true
                self.loadingView.isHidden = true
            }
        }
    }
    
    
    
    @IBAction func onClickValuable(_ sender: SecButton) {
        baseAccount.reSortChains()
        dpTags.removeAll()
        dpTags.append("cosmos118")
        mainnetChains.forEach { chain in
            if (chain.allValue(true).compare(NSDecimalNumber.one).rawValue > 0) {
                dpTags.append(chain.tag)
            }
        }
        tableView.reloadData()
    }
    
    @IBAction func onClickConfirm(_ sender: BaseButton) {
        baseAccount.reSortChains()
        BaseData.instance.setDisplayCosmosChainTags(baseAccount.id, dpTags)
        baseAccount.dpTags = dpTags
        onChainSelected?()
        dismiss(animated: true)
    }
}


extension ChainSelectVC: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if (section == 0 && mainnetChains.count == 0) { return nil }
        if (section == 1 && testnetChains.count == 0) { return nil }
        let view = BaseHeader(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        view.rootView.backgroundColor = UIColor.colorBg
        if (section == 0) {
            view.titleLabel.text = "Mainnet"
            view.cntLabel.text = String(mainnetChains.count)
        } else if (section == 1) {
            view.titleLabel.text = "Testnet"
            view.cntLabel.text = String(testnetChains.count)
        }
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if (section == 0) {
            return mainnetChains.count == 0 ? 0 : 40
        } else if (section == 1) {
            return testnetChains.count == 0 ? 0 : 40
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
            return searchMainnets.count
        } else if (section == 1) {
            return searchTestnets.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"SelectChainCell") as! SelectChainCell
        var chain: BaseChain!
        if (indexPath.section == 0) {
            chain = searchMainnets[indexPath.row]
        } else if (indexPath.section == 1) {
            chain = searchTestnets[indexPath.row]
        }
        cell.bindSelectChain(baseAccount, chain, dpTags)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var chain: BaseChain!
        if (indexPath.section == 0) {
            chain = searchMainnets[indexPath.row]
        } else if (indexPath.section == 1) {
            chain = searchTestnets[indexPath.row]
        }
        
        if (dpTags.contains(chain.tag)) {
            dpTags.removeAll { $0 == chain.tag }
        } else {
            dpTags.append(chain.tag)
        }
        
        DispatchQueue.main.async {
            self.tableView.beginUpdates()
            self.tableView.reloadRows(at: [indexPath], with: .none)
            self.tableView.endUpdates()
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        searchBar?.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchMainnets = searchText.isEmpty ? mainnetChains : mainnetChains.filter { mainnet in
            return mainnet.name.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        searchTestnets = searchText.isEmpty ? testnetChains : testnetChains.filter { testnet in
            return testnet.name.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        searchEmptyLayer.isHidden = searchMainnets.count + searchTestnets.count > 0
        tableView.reloadData()
    }
}
