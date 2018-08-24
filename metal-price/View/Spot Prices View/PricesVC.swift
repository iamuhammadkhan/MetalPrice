//
//  PricesVC.swift
//  metal-price
//
//  Created by MuhammadKhan on 8/23/18.
//  Copyright © 2018 Lutebox. All rights reserved.
//

import UIKit

class PricesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let pricesTableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    let lastUpdateLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Last Updated: \(Date())"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.textAlignment = .center
        label.font = UIFont(name: "Kailasa", size: 15)
        return label
    }()
    
    let headerView: UIView = {
        let hv = UIView()
        hv.translatesAutoresizingMaskIntoConstraints = false
        return hv
    }()
    
    let metalNameLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Kailasa", size: 17)
        label.textAlignment = .left
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.text = "Name"
        return label
    }()
    
    let metalPriceLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Kailasa", size: 17)
        label.textAlignment = .right
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.text = "Ask"
        return label
    }()
    
    let metalPriceChangeLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Kailasa", size: 17)
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.text = "Change"
        return label
    }()
    
    lazy var refresher: UIRefreshControl = {
        let refresh = UIRefreshControl()
        return refresh
    }()
    
    var metals = [Metal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }

    private func refreshData() {
        pricesTableView.refreshControl = refresher
    }
    
    private func getLiveQuotes() {
        let symbols = ["XAU", "XAG", "XPT", "XPD"]
        
        for symbol in symbols {
            APIService.shared.getRealTimeMetalQuotes(withSymbol: symbol, andCurrency: "USD") { [weak self] (metal, error) in
                if let err = error {
                    print("Error Getting Live Quotes : ", err)
                } else {
                    print("Wow Quotes Received : ", metal!)
                    self?.metals.append(metal!)
                    self?.pricesTableView.reloadData()
                }
            }
        }
    }
    
    private func setupViews() {
        
        view.backgroundColor = #colorLiteral(red: 0.2117647059, green: 0.6431372549, blue: 0.9882352941, alpha: 1)
        
        view.addSubview(headerView)
        headerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        headerView.addSubview(metalNameLbl)
        metalNameLbl.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 28).isActive = true
        metalNameLbl.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 0).isActive = true
        metalNameLbl.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        headerView.addSubview(metalPriceChangeLbl)
        metalPriceChangeLbl.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 0).isActive = true
        metalPriceChangeLbl.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -28).isActive = true
        
        headerView.addSubview(metalPriceLbl)
        metalPriceLbl.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 0).isActive = true
        metalPriceLbl.leadingAnchor.constraint(equalTo: metalNameLbl.trailingAnchor, constant: 8).isActive = true
        
        view.addSubview(lastUpdateLable)
        lastUpdateLable.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60).isActive = true
        lastUpdateLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        lastUpdateLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        lastUpdateLable.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        pricesTableView.register(PricesCell.self, forCellReuseIdentifier: PricesCell.identifier)
        
        pricesTableView.delegate = self
        pricesTableView.dataSource = self
        
        view.addSubview(pricesTableView)
        pricesTableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 5).isActive = true
        pricesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        pricesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        pricesTableView.bottomAnchor.constraint(equalTo: lastUpdateLable.topAnchor, constant: -16).isActive = true
        pricesTableView.separatorColor = .clear
        refreshData()
        getLiveQuotes()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return metals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = pricesTableView.dequeueReusableCell(withIdentifier: PricesCell.identifier, for: indexPath) as? PricesCell else { return UITableViewCell() }
        
        cell.selectionStyle = .none
        
        if metals.count > 0 {
            let metal = metals[indexPath.row]
            cell.populate(with: metal)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tabBarController?.selectedIndex = 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(view.bounds.size.height / 7)
    }
}

