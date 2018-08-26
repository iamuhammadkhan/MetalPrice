//
//  ChartsVC.swift
//  metal-price
//
//  Created by MuhammadKhan on 8/23/18.
//  Copyright © 2018 Lutebox. All rights reserved.
//

import UIKit
import Charts

class ChartsVC: UIViewController, ChartViewDelegate {

    var newNums: [Double] = [35, 40, 50, 55, 45, 25, 15, 20, 30, 40, 35, 50]
    var numbers: [Double] = [30, 20, 15, 40, 25, 50, 35, 60, 45, 70, 15, 10]
    
    var lineChartEntry = [ChartDataEntry]()
    var line: LineChartDataSet!
    var currentMetalName = "Gold"
    let data = LineChartData()
    
    var segmentControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Gold", "Silver", "Platinum", "Palladium"])
        sc.selectedSegmentIndex = 0
        sc.translatesAutoresizingMaskIntoConstraints = false
        sc.tintColor = #colorLiteral(red: 0.2117647059, green: 0.6431372549, blue: 0.9882352941, alpha: 1)
        return sc
    }()
    
    let chartView: LineChartView = {
        let cv = LineChartView()
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    let mainStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 10
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let titleStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.alignment = .fill
        sv.spacing = 8
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let detailStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.alignment = .fill
        sv.spacing = 8
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let lastUpdateLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Last Updated: \(Date())"
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        label.textAlignment = .center
        label.font = UIFont(name: "Kailasa", size: 12)
        return label
    }()
    
    let metalNameLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Kailasa", size: 14)
        label.textAlignment = .left
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        label.text = "Name"
        return label
    }()
    
    let metalBidPriceLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Kailasa", size: 14)
        label.textAlignment = .right
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        label.text = "Bid"
        return label
    }()
    
    let metalAskPriceLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Kailasa", size: 14)
        label.textAlignment = .right
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        label.text = "Ask"
        return label
    }()
    
    let metalPriceChangeLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Kailasa", size: 14)
        label.textAlignment = .right
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        label.text = "Change"
        return label
    }()
    
    let metalName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Kailasa", size: 15)
        label.textAlignment = .left
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.text = "Gold"
        return label
    }()
    
    let metalBidPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Kailasa", size: 15)
        label.textAlignment = .right
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.text = "$1,189.50"
        return label
    }()
    
    let metalAskPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Kailasa", size: 15)
        label.textAlignment = .right
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.text = "$1,190.50"
        return label
    }()
    
    let metalPriceChange: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Kailasa", size: 15)
        label.textAlignment = .right
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.text = "$1.30"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    
    fileprivate func getChartData() {
        APIService.shared.getHistoricalMetalQuotes(withSymbol: "XAU", andCurrency: "USD", andWithStartDate: "8/1/2018", andWithEndDate: "8/24/2018") { (metals, error) in
            if let err = error {
                print("Error : ", err)
            } else {
                print("Wow : ", metals!)
            }
        }
    }
    
    private func setupViews() {
        
        //getChartData()
        
        view.addSubview(segmentControl)
        segmentControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 85).isActive = true
        segmentControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        segmentControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        segmentControl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        segmentControl.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
        
        view.addSubview(mainStackView)
        mainStackView.topAnchor.constraint(equalTo: segmentControl.bottomAnchor, constant: 12).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true

        mainStackView.addArrangedSubview(titleStackView)
        titleStackView.addArrangedSubview(metalNameLbl)
        titleStackView.addArrangedSubview(metalBidPriceLbl)
        titleStackView.addArrangedSubview(metalAskPriceLbl)
        titleStackView.addArrangedSubview(metalPriceChangeLbl)

        mainStackView.addArrangedSubview(detailStackView)
        detailStackView.addArrangedSubview(metalName)
        detailStackView.addArrangedSubview(metalBidPrice)
        detailStackView.addArrangedSubview(metalAskPrice)
        detailStackView.addArrangedSubview(metalPriceChange)

        mainStackView.addArrangedSubview(lastUpdateLable)
        
        view.addSubview(chartView)
        chartView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -58).isActive = true
        chartView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        chartView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        chartView.topAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: 12).isActive = true
        chartView.delegate = self
        
        let xAxis = chartView.xAxis
        xAxis.labelPosition = .bottom
        xAxis.labelCount = 12
        
        xAxis.drawLabelsEnabled = true
        xAxis.drawLimitLinesBehindDataEnabled = true
        xAxis.avoidFirstLastClippingEnabled = true
        
        updateChart(withMetalName: currentMetalName, andWithData: numbers)
    }
    
    private func updateChart(withMetalName metal: String, andWithData dataSet: [Double]) {
        for i in 0..<dataSet.count {
            let value = ChartDataEntry(x: Double(i), y: newNums[i])
            lineChartEntry.append(value)
        }
        
        line = LineChartDataSet(values: lineChartEntry, label: metal)
        line.colors = [ #colorLiteral(red: 0.2117647059, green: 0.6431372549, blue: 0.9882352941, alpha: 1) ]
        line.mode = .cubicBezier
        data.addDataSet(line)
        
        chartView.data = data
        chartView.chartDescription?.text = nil
        
        chartView.notifyDataSetChanged()
    }

    @objc private func segmentChanged(_ sender: UISegmentedControl) {

        switch sender.selectedSegmentIndex {
        case 1:
            currentMetalName = "Silver"
            updateChart(withMetalName: currentMetalName, andWithData: numbers)
        case 2:
            currentMetalName = "Platinum"
            updateChart(withMetalName: currentMetalName, andWithData: numbers)
        case 3:
            currentMetalName = "Palladium"
            updateChart(withMetalName: currentMetalName, andWithData: numbers)
        default:
            currentMetalName = "Gold"
            updateChart(withMetalName: currentMetalName, andWithData: numbers)
        }
    }
}
