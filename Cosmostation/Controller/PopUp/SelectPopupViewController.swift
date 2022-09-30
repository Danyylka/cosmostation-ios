//
//  SelectPopupViewController.swift
//  Cosmostation
//
//  Created by 정용주 on 2020/04/16.
//  Copyright © 2020 wannabit. All rights reserved.
//

import UIKit

class SelectPopupViewController: BaseViewController, SBCardPopupContent, UITableViewDelegate, UITableViewDataSource {
    
    var popupViewController: SBCardPopupViewController?
    let allowsTapToDismissPopupCard =  true
    let allowsSwipeToDismissPopupCard =  false
    
    @IBOutlet weak var cardView: CardView!
    @IBOutlet weak var popupTitle: UILabel!
    @IBOutlet weak var popupTableview: UITableView!
    
    var type: Int?
    var toChain: ChainType?
    var toChainList = Array<ChainType>()
    var toCoinList = Array<String>()
    var toCoins = Array<Coin>()
    var toAccountList = Array<Account>()
    var ibcToChain = Array<ChainConfig>()
    var starnameDomains = Array<String>()
    var feeData = Array<FeeData>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        account = BaseData.instance.selectAccountById(id: BaseData.instance.getRecentAccountId())
        chainType = ChainFactory.getChainType(account!.account_base_chain)
        chainConfig = ChainFactory.getChainConfig(chainType)
        
        self.popupTableview.delegate = self
        self.popupTableview.dataSource = self
        self.popupTableview.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.popupTableview.register(UINib(nibName: "SelectTextCell", bundle: nil), forCellReuseIdentifier: "SelectTextCell")
        self.popupTableview.register(UINib(nibName: "SelectChainCell", bundle: nil), forCellReuseIdentifier: "SelectChainCell")
        self.popupTableview.register(UINib(nibName: "SelectCoinCell", bundle: nil), forCellReuseIdentifier: "SelectCoinCell")
        self.popupTableview.register(UINib(nibName: "SelectAccountCell", bundle: nil), forCellReuseIdentifier: "SelectAccountCell")
        self.popupTableview.register(UINib(nibName: "SelectPriceColorCell", bundle: nil), forCellReuseIdentifier: "SelectPriceColorCell")
//        self.popupTableview.register(UINib(nibName: "SelectRelayerCell", bundle: nil), forCellReuseIdentifier: "SelectRelayerCell")
        self.popupTableview.register(UINib(nibName: "SelectDesmosAirdopAccountCell", bundle: nil), forCellReuseIdentifier: "SelectDesmosAirdopAccountCell")
        self.popupTableview.rowHeight = UITableView.automaticDimension
        self.popupTableview.estimatedRowHeight = UITableView.automaticDimension
        
        if (type == SELECT_POPUP_HTLC_TO_CHAIN) {
            self.popupTitle.text = NSLocalizedString("select_destination_chain", comment: "")
            self.toChainList = WUtils.getHtlcSendable(chainType!)
            
        } else if (type == SELECT_POPUP_HTLC_TO_COIN) {
            self.popupTitle.text = NSLocalizedString("str_select_to_send_coin", comment: "")
            self.toCoinList = WUtils.getHtlcSwappableCoin(chainType!)
            
        } else if (type == SELECT_POPUP_HTLC_TO_ACCOUNT) {
            self.popupTitle.text = NSLocalizedString("select_account", comment: "")
            self.toAccountList = BaseData.instance.selectAllAccountsByHtlcClaim(toChain)
            
        } else if (type == SELECT_POPUP_STARNAME_ACCOUNT) {
            self.popupTitle.text = NSLocalizedString("select_account", comment: "")
            self.toAccountList = BaseData.instance.selectAllAccountsByChain(toChain!)
            
        } else if (type == SELECT_POPUP_OSMOSIS_COIN_IN || type == SELECT_POPUP_KAVA_SWAP_IN || type == SELECT_POPUP_SIF_SWAP_IN) {
            self.popupTitle.text = NSLocalizedString("str_select_coin_swap_in", comment: "")
            
        } else if (type == SELECT_POPUP_OSMOSIS_COIN_OUT || type == SELECT_POPUP_KAVA_SWAP_OUT || type == SELECT_POPUP_SIF_SWAP_OUT) {
            self.popupTitle.text = NSLocalizedString("str_select_coin_swap_out", comment: "")
            
        } else if (type == SELECT_POPUP_RECIPIENT_CHAIN) {
            self.popupTitle.text = NSLocalizedString("str_select_ibc_destination", comment: "")
            
        } else if(type == SELECT_POPUP_RECIPIENT_ADDRESS) {
            self.popupTitle.text = NSLocalizedString("select_account", comment: "")
            
        } else if (type == SELECT_POPUP_STARNAME_DOMAIN) {
            self.popupTitle.text = NSLocalizedString("str_select_starname_domain", comment: "")
            
        } else if (type == SELECT_POPUP_DESMOS_LINK_CHAIN) {
            self.popupTitle.text = NSLocalizedString("select_to_link_chain", comment: "")
            self.toChainList = WUtils.getDesmosAirDropChains()
            
        } else if (type == SELECT_POPUP_DESMOS_LINK_ACCOUNT) {
            self.popupTitle.text = NSLocalizedString("select_to_link_account", comment: "")
            self.toAccountList = BaseData.instance.selectAllAccountsByChainWithKey(toChain!)
            
        } else if (type == SELECT_POPUP_KEPLR_GET_ACCOUNT || type == SELECT_POPUP_COSMOSTATION_GET_ACCOUNT) {
            self.popupTitle.text = NSLocalizedString("select_account", comment: "")
            self.toAccountList = BaseData.instance.selectAllAccountsByChainWithKey(toChain!)
            
        } else if (type == SELECT_POPUP_FEE_DENOM) {
            self.popupTitle.text = NSLocalizedString("select_fee_denom", comment: "")
            
        } else if (type == SELECT_POPUP_COIN_LIST) {
            self.popupTitle.text = NSLocalizedString("str_select_to_send_coin", comment: "")
            
        } else if (type == SELECT_POPUP_PRICE_COLOR) {
            self.popupTitle.text = NSLocalizedString("str_select_price_color", comment: "")
        }
    }
    
    override func viewDidLayoutSubviews() {
        var esHeight: CGFloat = 350
        if (type == SELECT_POPUP_HTLC_TO_CHAIN) {
            esHeight = (CGFloat)((toChainList.count * 55) + 55)
        } else if (type == SELECT_POPUP_HTLC_TO_COIN) {
            esHeight = (CGFloat)((toCoinList.count * 55) + 55)
        } else if (type == SELECT_POPUP_HTLC_TO_ACCOUNT) {
            esHeight = (CGFloat)((toAccountList.count * 55) + 55)
        } else if (type == SELECT_POPUP_STARNAME_ACCOUNT || type == SELECT_POPUP_RECIPIENT_ADDRESS) {
            esHeight = (CGFloat)((toAccountList.count * 55) + 55)
        } else if (type == SELECT_POPUP_RECIPIENT_CHAIN) {
            esHeight = (CGFloat)((ibcToChain.count * 55) + 55)
        } else if (type == SELECT_POPUP_STARNAME_DOMAIN) {
            esHeight = (CGFloat)((starnameDomains.count * 55) + 55)
        } else if (type == SELECT_POPUP_SIF_SWAP_IN) {
            esHeight = (CGFloat)((toCoinList.count * 55) + 55)
        } else if (type == SELECT_POPUP_SIF_SWAP_OUT) {
            esHeight = (CGFloat)((toCoinList.count * 55) + 55)
        } else if (type == SELECT_POPUP_DESMOS_LINK_CHAIN) {
            esHeight = (CGFloat)((toChainList.count * 55) + 55)
        } else if (type == SELECT_POPUP_DESMOS_LINK_ACCOUNT || type == SELECT_POPUP_COSMOSTATION_GET_ACCOUNT || type == SELECT_POPUP_KEPLR_GET_ACCOUNT) {
            esHeight = (CGFloat)((toAccountList.count * 55) + 55)
        } else if (type == SELECT_POPUP_FEE_DENOM) {
            esHeight = (CGFloat)((feeData.count * 55) + 55)
        } else if (type == SELECT_POPUP_COIN_LIST) {
            esHeight = (CGFloat)((toCoins.count * 55) + 55)
        }
        esHeight = (esHeight > 350) ? 350 : esHeight
        cardView.frame = CGRect(x: cardView.frame.origin.x, y: cardView.frame.origin.y, width: cardView.frame.size.width, height: esHeight)
        cardView.layoutIfNeeded()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (type == SELECT_POPUP_HTLC_TO_CHAIN) {
            return toChainList.count;
        } else if (type == SELECT_POPUP_HTLC_TO_COIN) {
            return toCoinList.count
        } else if (type == SELECT_POPUP_HTLC_TO_ACCOUNT) {
            return toAccountList.count
        } else if (type == SELECT_POPUP_STARNAME_ACCOUNT || type == SELECT_POPUP_RECIPIENT_ADDRESS) {
            return toAccountList.count
        } else if (type == SELECT_POPUP_OSMOSIS_COIN_IN || type == SELECT_POPUP_KAVA_SWAP_IN || type == SELECT_POPUP_SIF_SWAP_IN) {
            return toCoinList.count
        } else if (type == SELECT_POPUP_OSMOSIS_COIN_OUT || type == SELECT_POPUP_KAVA_SWAP_OUT || type == SELECT_POPUP_SIF_SWAP_OUT) {
            return toCoinList.count
        } else if (type == SELECT_POPUP_RECIPIENT_CHAIN) {
            return ibcToChain.count
        } else if (type == SELECT_POPUP_STARNAME_DOMAIN) {
            return starnameDomains.count
        } else if (type == SELECT_POPUP_DESMOS_LINK_CHAIN) {
            return toChainList.count;
        } else if (type == SELECT_POPUP_DESMOS_LINK_ACCOUNT || type == SELECT_POPUP_COSMOSTATION_GET_ACCOUNT || type == SELECT_POPUP_KEPLR_GET_ACCOUNT) {
            return toAccountList.count;
        } else if (type == SELECT_POPUP_FEE_DENOM) {
            return feeData.count
        } else if (type == SELECT_POPUP_COIN_LIST) {
            return toCoins.count
        } else if (type == SELECT_POPUP_PRICE_COLOR) {
            return 2
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (type == SELECT_POPUP_HTLC_TO_CHAIN) {
            let cell = tableView.dequeueReusableCell(withIdentifier:"SelectChainCell") as? SelectChainCell
            let chain = toChainList[indexPath.row]
            WUtils.dpBepSwapChainInfo(chain, cell!.chainImg, cell!.chainTitle)
            return cell!
            
        } else if (type == SELECT_POPUP_HTLC_TO_COIN) {
            let cell = tableView.dequeueReusableCell(withIdentifier:"SelectCoinCell") as? SelectCoinCell
            let toSendCoin = toCoinList[indexPath.row]
            if (chainType! == ChainType.BINANCE_MAIN) {
                if (toSendCoin == TOKEN_HTLC_BINANCE_BNB) {
                    cell!.coinImg.image = UIImage(named: "tokenBinance")
                    cell!.coinTitle.text = "BNB"
                } else if (toSendCoin == TOKEN_HTLC_BINANCE_BTCB) {
                    cell?.coinImg.af_setImage(withURL: URL(string: BinanceTokenImgUrl + "BTCB.png")!)
                    cell!.coinTitle.text = "BTC"
                } else if (toSendCoin == TOKEN_HTLC_BINANCE_XRPB) {
                    cell?.coinImg.af_setImage(withURL: URL(string: BinanceTokenImgUrl + "XRP.png")!)
                    cell!.coinTitle.text = "XRP"
                } else if (toSendCoin == TOKEN_HTLC_BINANCE_BUSD) {
                    cell?.coinImg.af_setImage(withURL: URL(string: BinanceTokenImgUrl + "BUSD.png")!)
                    cell!.coinTitle.text = "BUSD"
                }
                
            } else if (chainType! == ChainType.KAVA_MAIN) {
                if (toSendCoin == TOKEN_HTLC_KAVA_BNB) {
                    WDP.dpSymbolImg(chainConfig, toSendCoin, cell!.coinImg)
                    cell!.coinTitle.text = "BNB"
                } else if (toSendCoin == TOKEN_HTLC_KAVA_BTCB) {
                    WDP.dpSymbolImg(chainConfig, toSendCoin, cell!.coinImg)
                    cell!.coinTitle.text = "BTC"
                } else if (toSendCoin == TOKEN_HTLC_KAVA_XRPB) {
                    WDP.dpSymbolImg(chainConfig, toSendCoin, cell!.coinImg)
                    cell!.coinTitle.text = "XRP"
                } else if (toSendCoin == TOKEN_HTLC_KAVA_BUSD) {
                    WDP.dpSymbolImg(chainConfig, toSendCoin, cell!.coinImg)
                    cell!.coinTitle.text = "BUSD"
                }
                
            }
            return cell!
            
        } else if (type == SELECT_POPUP_HTLC_TO_ACCOUNT) {
            let cell = tableView.dequeueReusableCell(withIdentifier:"SelectAccountCell") as? SelectAccountCell
            let account = toAccountList[indexPath.row]
            cell?.keyStatusImg.image = cell?.keyStatusImg.image?.withRenderingMode(.alwaysTemplate)
            cell?.accountAddress.text = account.account_address
            WUtils.setDenomTitle(toChain!, cell!.accountDenom)
            if (toChain == ChainType.BINANCE_MAIN) {
                cell?.keyStatusImg.tintColor = UIColor.init(named: "binance")
                cell!.accountBalance.attributedText = WDP.dpAmount(WUtils.getTokenAmount(account.account_balances, BNB_MAIN_DENOM).stringValue, cell!.accountBalance.font, 0, 8)
                
            } else if (toChain == ChainType.KAVA_MAIN) {
                cell?.keyStatusImg.tintColor = UIColor.init(named: "kava")
                cell!.accountBalance.attributedText = WDP.dpAmount(WUtils.getTokenAmount(account.account_balances, KAVA_MAIN_DENOM).stringValue, cell!.accountBalance.font, 6, 6)
            }
            return cell!
            
        } else if (type == SELECT_POPUP_STARNAME_ACCOUNT || type == SELECT_POPUP_RECIPIENT_ADDRESS) {
            let cell = tableView.dequeueReusableCell(withIdentifier:"SelectAccountCell") as? SelectAccountCell
            let toChainConfig = ChainFactory.getChainConfig(toChain)
            let account = toAccountList[indexPath.row]
            WUtils.setDenomTitle(toChain!, cell!.accountDenom)
            cell?.accountAddress.text = account.account_address
            cell?.accountName.text = account.getDpName()
            if (account.account_has_private == true) {
                cell?.keyStatusImg.image = UIImage.init(named: "iconKeyFull")
                cell?.keyStatusImg.image = cell?.keyStatusImg.image!.withRenderingMode(.alwaysTemplate)
                cell?.keyStatusImg.tintColor = toChainConfig?.chainColor
            } else {
                cell?.keyStatusImg.image = UIImage.init(named: "iconKeyEmpty")
            }
            cell?.accountBalance.attributedText = WDP.dpAmount(account.account_last_total, cell!.accountBalance.font, 0, 6)
            return cell!
            
        } else if (type == SELECT_POPUP_OSMOSIS_COIN_IN) {
            let cell = tableView.dequeueReusableCell(withIdentifier:"SelectCoinCell") as? SelectCoinCell
            let swapInDenom = toCoinList[indexPath.row]
            WDP.dpSymbolImg(chainConfig, swapInDenom, cell!.coinImg)
            WDP.dpSymbol(chainConfig, swapInDenom, cell!.coinTitle)
            return cell!
            
        } else if (type == SELECT_POPUP_OSMOSIS_COIN_OUT) {
            let cell = tableView.dequeueReusableCell(withIdentifier:"SelectCoinCell") as? SelectCoinCell
            let swapOutDenom = toCoinList[indexPath.row]
            WDP.dpSymbolImg(chainConfig, swapOutDenom, cell!.coinImg)
            WDP.dpSymbol(chainConfig, swapOutDenom, cell!.coinTitle)
            return cell!
            
        } else if (type == SELECT_POPUP_KAVA_SWAP_IN) {
            let cell = tableView.dequeueReusableCell(withIdentifier:"SelectCoinCell") as? SelectCoinCell
            let swapInDenom = toCoinList[indexPath.row]
            WDP.dpSymbolImg(chainConfig, swapInDenom, cell!.coinImg)
            WDP.dpSymbol(chainConfig, swapInDenom, cell!.coinTitle)
            return cell!
            
        } else if (type == SELECT_POPUP_KAVA_SWAP_OUT) {
            let cell = tableView.dequeueReusableCell(withIdentifier:"SelectCoinCell") as? SelectCoinCell
            let swapOutDenom = toCoinList[indexPath.row]
            WDP.dpSymbolImg(chainConfig, swapOutDenom, cell!.coinImg)
            WDP.dpSymbol(chainConfig, swapOutDenom, cell!.coinTitle)
            return cell!
            
        } else if (type == SELECT_POPUP_RECIPIENT_CHAIN) {
            let cell = tableView.dequeueReusableCell(withIdentifier:"SelectChainCell") as? SelectChainCell
            let toChainConfig = ibcToChain[indexPath.row]
            cell!.chainImg.image = toChainConfig.chainImg
            cell!.chainTitle.text = toChainConfig.chainTitle2
            cell!.chainTitle.textColor = toChainConfig.chainColor
            return cell!
            
        } else if (type == SELECT_POPUP_STARNAME_DOMAIN) {
            let cell = tableView.dequeueReusableCell(withIdentifier:"SelectTextCell") as? SelectTextCell
            cell!.selectTextLabel.text = starnameDomains[indexPath.row]
            return cell!
            
        } else if (type == SELECT_POPUP_SIF_SWAP_IN) {
            let cell = tableView.dequeueReusableCell(withIdentifier:"SelectCoinCell") as? SelectCoinCell
            let swapInDenom = toCoinList[indexPath.row]
            WDP.dpSymbolImg(chainConfig, swapInDenom, cell!.coinImg)
            WDP.dpSymbol(chainConfig, swapInDenom, cell!.coinTitle)
            
            return cell!
            
        } else if (type == SELECT_POPUP_SIF_SWAP_OUT) {
            let cell = tableView.dequeueReusableCell(withIdentifier:"SelectCoinCell") as? SelectCoinCell
            let swapOutDenom = toCoinList[indexPath.row]
            WDP.dpSymbolImg(chainConfig, swapOutDenom, cell!.coinImg)
            WDP.dpSymbol(chainConfig, swapOutDenom, cell!.coinTitle)
            return cell!
            
        } else if (type == SELECT_POPUP_DESMOS_LINK_CHAIN) {
            let cell = tableView.dequeueReusableCell(withIdentifier:"SelectChainCell") as? SelectChainCell
            let chain = toChainList[indexPath.row]
            let chainConfig = ChainFactory.getChainConfig(chain)
            cell!.chainImg.image = chainConfig?.chainImg
            cell!.chainTitle.text = chainConfig?.chainTitle2
            return cell!
            
        } else if (type == SELECT_POPUP_DESMOS_LINK_ACCOUNT) {
            let cell = tableView.dequeueReusableCell(withIdentifier:"SelectDesmosAirdopAccountCell") as? SelectDesmosAirdopAccountCell
            cell?.onBindAccount(toChain, toAccountList[indexPath.row])
            return cell!
            
        } else if (type == SELECT_POPUP_KEPLR_GET_ACCOUNT || type == SELECT_POPUP_COSMOSTATION_GET_ACCOUNT) {
            let cell = tableView.dequeueReusableCell(withIdentifier:"SelectAccountCell") as? SelectAccountCell
            let account = toAccountList[indexPath.row]
            let toChainConfig = ChainFactory.getChainConfig(toChain)
            WUtils.setDenomTitle(toChain!, cell!.accountDenom)
            cell?.accountAddress.text = account.account_address
            cell?.accountName.text = account.getDpName()
            cell?.keyStatusImg.image = cell?.keyStatusImg.image?.withRenderingMode(.alwaysTemplate)
            cell?.keyStatusImg.tintColor = toChainConfig?.chainColor
            cell?.accountBalance.attributedText = WDP.dpAmount(account.account_last_total, cell!.accountBalance.font, 0, 6)
            return cell!
            
        } else if (type == SELECT_POPUP_FEE_DENOM) {
            let cell = tableView.dequeueReusableCell(withIdentifier:"SelectCoinCell") as? SelectCoinCell
            let feeDenom = feeData[indexPath.row].denom
            WDP.dpSymbolImg(chainConfig, feeDenom, cell!.coinImg)
            WDP.dpSymbol(chainConfig, feeDenom, cell!.coinTitle)
            return cell!
            
        } else if (type == SELECT_POPUP_COIN_LIST) {
            let cell = tableView.dequeueReusableCell(withIdentifier:"SelectCoinCell") as? SelectCoinCell
            let coin = toCoins[indexPath.row]
            WDP.dpSymbolImg(chainConfig, coin.denom, cell!.coinImg)
            WDP.dpSymbol(chainConfig, coin.denom, cell!.coinTitle)
            return cell!
            
        } else if (type == SELECT_POPUP_PRICE_COLOR) {
            let cell = tableView.dequeueReusableCell(withIdentifier:"SelectPriceColorCell") as? SelectPriceColorCell
            if (indexPath.row == 0) {
                cell?.upColorImg.image = UIImage.init(named: "ImgGovPassed")
                cell?.downColorImg.image = UIImage.init(named: "ImgGovRejected")
            } else {
                cell?.upColorImg.image = UIImage.init(named: "ImgGovRejected")
                cell?.downColorImg.image = UIImage.init(named: "ImgGovPassed")
            }
            return cell!
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier:"SelectAccountCell") as? SelectAccountCell
            return cell!
            
        }
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         popupViewController?.resultDelegate?.SBCardPopupResponse(type: type!, result: indexPath.row)
         popupViewController?.close()
    }

}
