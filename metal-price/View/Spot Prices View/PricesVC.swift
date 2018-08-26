//
//  PricesVC.swift
//  metal-price
//
//  Created by MuhammadKhan on 8/23/18.
//  Copyright © 2018 Lutebox. All rights reserved.
//

import UIKit
import SVProgressHUD

class PricesVC: UIViewController {

    let pricesTableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    let lastUpdateLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Kailasa", size: 15)
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        label.text = ""
        return label
    }()
    
    let ratesStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fillEqually
        sv.alignment = .fill
        sv.spacing = 4
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let goldRatesStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 5
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let silverRatesStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 5
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let platinumRatesStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 5
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let palladiumRatesStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 5
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let goldRatesView: UIView = {
        let cv = UIView()
        cv.backgroundColor = .white
        //cv.layer.cornerRadius = 5
        cv.layer.masksToBounds = true
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    let silverRatesView: UIView = {
        let cv = UIView()
        cv.backgroundColor = .white
        cv.layer.masksToBounds = true
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    let platinumRatesView: UIView = {
        let cv = UIView()
        cv.backgroundColor = .white
        cv.layer.masksToBounds = true
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    let palladiumRatesView: UIView = {
        let cv = UIView()
        cv.backgroundColor = .white
        cv.layer.masksToBounds = true
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    let goldRatesImageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .white
        image.layer.cornerRadius = 5
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        image.image = #imageLiteral(resourceName: "gold")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let silverRatesImageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .white
        image.layer.cornerRadius = 5
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        image.image = #imageLiteral(resourceName: "silver")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let platinumRatesImageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .white
        image.layer.cornerRadius = 5
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        image.image = #imageLiteral(resourceName: "platinum")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let palladiumRatesImageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .white
        image.layer.cornerRadius = 5
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        image.image = #imageLiteral(resourceName: "palladium")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let goldPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Kailasa", size: 22)
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 0.7)
        label.text = ""
        return label
    }()
    
    let silverPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Kailasa", size: 22)
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 0.7)
        label.text = ""
        return label
    }()
    
    let platinumPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Kailasa", size: 22)
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 0.7)
        label.text = ""
        return label
    }()
    
    let palladiumPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Kailasa", size: 22)
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 0.7)
        label.text = "USD 939.50"
        return label
    }()
    
    lazy var refresher: UIRefreshControl = {
        let refresh = UIRefreshControl()
        return refresh
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }

//    private func refreshData() {
//        pricesTableView.refreshControl = refresher
//        pricesTableView.beginUpdates()
//        refresher.endRefreshing()
//        pricesTableView.endUpdates()
//    }
    
    private func getLiveQuotes() {
        
        SVProgressHUD.show()
        
        APIService.shared.getMetalQuotes { [weak self] (data, error) in
            
            if let err = error {
                
                SVProgressHUD.dismiss()
                print("Error Getting Live Quotes : ", err)
                
            } else {
                
                SVProgressHUD.dismiss()
                
                guard let metal = data else { return }
                self?.goldPrice.text = "USD " + metal.gold
                self?.silverPrice.text = "USD " + metal.silver
                self?.platinumPrice.text = "USD " + metal.platinum
                self?.lastUpdateLbl.text = "Last Updated: \(metal.date) 00:00 ET"
            }
        }
        
//        let symbols = [ "XPD", "XPT", "XAG", "XAU" ]
//        
//        for symbol in symbols {
//            APIService.shared.getRealTimeMetalQuotes(withSymbol: symbol, andCurrency: "USD") { [weak self] (metal, error) in
//                if let err = error {
//                    SVProgressHUD.dismiss()
//                    print("Error Getting Live Quotes : ", err)
//                } else {
//                    SVProgressHUD.dismiss()
//                    self?.metals.append(metal!)
//                    self?.pricesTableView.reloadData()
//                    self?.lastUpdateLable.text = "Last Updated: \(metal!.Date) \(metal!.Time)"
//                }
//            }
//        }
    }
    
    private func setupViews() {
        
        getLiveQuotes()
        
        view.addSubview(lastUpdateLbl)
        lastUpdateLbl.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        lastUpdateLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        lastUpdateLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        lastUpdateLbl.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        view.addSubview(ratesStackView)
        ratesStackView.topAnchor.constraint(equalTo: lastUpdateLbl.bottomAnchor, constant: 8).isActive = true
        ratesStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        ratesStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        ratesStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -54).isActive = true
        
        goldRatesView.addSubview(goldRatesImageView)
        goldRatesImageView.topAnchor.constraint(equalTo: goldRatesView.topAnchor, constant: 0).isActive = true
        goldRatesImageView.leadingAnchor.constraint(equalTo: goldRatesView.leadingAnchor, constant: 0).isActive = true
        goldRatesImageView.trailingAnchor.constraint(equalTo: goldRatesView.trailingAnchor, constant: 0).isActive = true
        goldRatesImageView.bottomAnchor.constraint(equalTo: goldRatesView.bottomAnchor, constant: 0).isActive = true
        
        goldRatesView.addSubview(goldPrice)
        goldPrice.leadingAnchor.constraint(equalTo: goldRatesView.leadingAnchor, constant: 0).isActive = true
        goldPrice.trailingAnchor.constraint(equalTo: goldRatesView.trailingAnchor, constant: 0).isActive = true
        goldPrice.bottomAnchor.constraint(equalTo: goldRatesView.bottomAnchor, constant: 0).isActive = true
        goldPrice.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        silverRatesView.addSubview(silverRatesImageView)
        silverRatesImageView.topAnchor.constraint(equalTo: silverRatesView.topAnchor, constant: 0).isActive = true
        silverRatesImageView.leadingAnchor.constraint(equalTo: silverRatesView.leadingAnchor, constant: 0).isActive = true
        silverRatesImageView.trailingAnchor.constraint(equalTo: silverRatesView.trailingAnchor, constant: 0).isActive = true
        silverRatesImageView.bottomAnchor.constraint(equalTo: silverRatesView.bottomAnchor, constant: 0).isActive = true
        
        silverRatesView.addSubview(silverPrice)
        silverPrice.leadingAnchor.constraint(equalTo: silverRatesView.leadingAnchor, constant: 0).isActive = true
        silverPrice.trailingAnchor.constraint(equalTo: silverRatesView.trailingAnchor, constant: 0).isActive = true
        silverPrice.bottomAnchor.constraint(equalTo: silverRatesView.bottomAnchor, constant: 0).isActive = true
        silverPrice.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        platinumRatesView.addSubview(platinumRatesImageView)
        platinumRatesImageView.topAnchor.constraint(equalTo: platinumRatesView.topAnchor, constant: 0).isActive = true
        platinumRatesImageView.leadingAnchor.constraint(equalTo: platinumRatesView.leadingAnchor, constant: 0).isActive = true
        platinumRatesImageView.trailingAnchor.constraint(equalTo: platinumRatesView.trailingAnchor, constant: 0).isActive = true
        platinumRatesImageView.bottomAnchor.constraint(equalTo: platinumRatesView.bottomAnchor, constant: 0).isActive = true
        
        platinumRatesView.addSubview(platinumPrice)
        platinumPrice.leadingAnchor.constraint(equalTo: platinumRatesView.leadingAnchor, constant: 0).isActive = true
        platinumPrice.trailingAnchor.constraint(equalTo: platinumRatesView.trailingAnchor, constant: 0).isActive = true
        platinumPrice.bottomAnchor.constraint(equalTo: platinumRatesView.bottomAnchor, constant: 0).isActive = true
        platinumPrice.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        palladiumRatesView.addSubview(palladiumRatesImageView)
        palladiumRatesImageView.topAnchor.constraint(equalTo: palladiumRatesView.topAnchor, constant: 0).isActive = true
        palladiumRatesImageView.leadingAnchor.constraint(equalTo: palladiumRatesView.leadingAnchor, constant: 0).isActive = true
        palladiumRatesImageView.trailingAnchor.constraint(equalTo: palladiumRatesView.trailingAnchor, constant: 0).isActive = true
        palladiumRatesImageView.bottomAnchor.constraint(equalTo: palladiumRatesView.bottomAnchor, constant: 0).isActive = true
        
        palladiumRatesView.addSubview(palladiumPrice)
        palladiumPrice.leadingAnchor.constraint(equalTo: palladiumRatesView.leadingAnchor, constant: 0).isActive = true
        palladiumPrice.trailingAnchor.constraint(equalTo: palladiumRatesView.trailingAnchor, constant: 0).isActive = true
        palladiumPrice.bottomAnchor.constraint(equalTo: palladiumRatesView.bottomAnchor, constant: 0).isActive = true
        palladiumPrice.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        goldRatesStackView.addArrangedSubview(goldRatesView)
        
        silverRatesStackView.addArrangedSubview(silverRatesView)
        
        platinumRatesStackView.addArrangedSubview(platinumRatesView)
        
        palladiumRatesStackView.addArrangedSubview(palladiumRatesView)
        
        ratesStackView.addArrangedSubview(goldRatesStackView)
        ratesStackView.addArrangedSubview(silverRatesStackView)
        ratesStackView.addArrangedSubview(platinumRatesStackView)
        ratesStackView.addArrangedSubview(palladiumRatesStackView)
        
        //pricesTableView.register(PricesCell.self, forCellReuseIdentifier: PricesCell.identifier)
        
        //pricesTableView.delegate = self
        //pricesTableView.dataSource = self
        
        //view.addSubview(pricesTableView)
        //pricesTableView.topAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: 5).isActive = true
        //pricesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        //pricesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        //pricesTableView.bottomAnchor.constraint(equalTo: lastUpdateLable.topAnchor, constant: -16).isActive = true
        //pricesTableView.separatorColor = .clear
        //refreshData()
    }
}

//extension PricesVC: UITableViewDelegate, UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return metals.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = pricesTableView.dequeueReusableCell(withIdentifier: PricesCell.identifier, for: indexPath) as? PricesCell else { return UITableViewCell() }
//
//        cell.selectionStyle = .none
//
//        if metals.count > 0 {
//            let metal = metals[indexPath.row]
//            cell.populate(with: metal)
//        }
//
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tabBarController?.selectedIndex = 1
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return CGFloat(view.bounds.size.height / 7)
//    }
//}
