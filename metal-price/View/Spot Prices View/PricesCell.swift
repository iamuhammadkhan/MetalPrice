//
//  PricesCell.swift
//  metal-price
//
//  Created by MuhammadKhan on 8/23/18.
//  Copyright © 2018 Lutebox. All rights reserved.
//

import UIKit

class PricesCell: UITableViewCell {

    let cardView: UIView = {
        let cv = UIView()
        cv.backgroundColor = .white
        cv.layer.cornerRadius = 5
        cv.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0.1176470588, alpha: 1)
        cv.layer.shadowRadius = 4
        cv.layer.shadowOpacity = 0.3
        cv.layer.shadowOffset = CGSize(width: -2, height: 0.5)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    let mainStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 20
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let innerStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 5
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let metalNameLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Kailasa", size: 16)
        label.textAlignment = .left
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0.1176470588, alpha: 1)
        label.text = ""
        return label
    }()

    let metalPriceLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Kailasa", size: 16)
        label.textAlignment = .right
        label.textColor = #colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 1)
        label.text = ""
        return label
    }()
    
    let metalPriceChangeLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Kailasa", size: 16)
        label.textAlignment = .right
        label.textColor = #colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 1)
        label.text = ""
        return label
    }()
    
    let indicatorButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.contentMode = .scaleAspectFit
        button.imageView?.image = nil
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        indicatorButton.setImage(nil, for: .normal)
        metalNameLbl.text?.removeAll()
        metalPriceLbl.text?.removeAll()
        metalPriceChangeLbl.text?.removeAll()
    }
    
    private func setupView() {
        
        addSubview(cardView)
        cardView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        cardView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        cardView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12).isActive = true
        cardView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12).isActive = true
        
        cardView.addSubview(mainStackView)
        mainStackView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 16).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -16).isActive = true
        
        indicatorButton.heightAnchor.constraint(equalToConstant: 15).isActive = true
        indicatorButton.widthAnchor.constraint(equalToConstant: 15).isActive = true
        
        innerStackView.addArrangedSubview(metalPriceLbl)
        innerStackView.addArrangedSubview(indicatorButton)
        
        mainStackView.addArrangedSubview(metalNameLbl)
        mainStackView.addArrangedSubview(innerStackView)
        mainStackView.addArrangedSubview(metalPriceChangeLbl)
    }
    
//    func populate(with metal: Metal) {
//        
//        metalNameLbl.text = metal.Name.capitalized
//        metalPriceLbl.text = "$\(metal.Ask.withCommas())"
//        
//        if metal.askIndicator == .down {
//            indicatorButton.setImage(#imageLiteral(resourceName: "down"), for: .normal)
//            metalPriceChangeLbl.text = "(\(metal.priceChange))"
//            metalPriceChangeLbl.textColor = #colorLiteral(red: 0.9994671941, green: 0.001003724639, blue: 0.27533409, alpha: 1)
//        } else {
//            indicatorButton.setImage(#imageLiteral(resourceName: "up"), for: .normal)
//            metalPriceChangeLbl.text = "$\(metal.Change.withCommas())"
//            metalPriceChangeLbl.textColor = #colorLiteral(red: 0.1985552907, green: 0.7826311588, blue: 0.3914662302, alpha: 1)
//        }
//    }
}
