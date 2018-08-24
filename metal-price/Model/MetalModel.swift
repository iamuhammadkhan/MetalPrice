//
//  MetalModel.swift
//  metal-price
//
//  Created by MuhammadKhan on 8/23/18.
//  Copyright © 2018 Lutebox. All rights reserved.
//

import Foundation

struct MetalModel {
    
    var metalName: String
    var askPrice: Double
    var askIndicator: MetalAskIndicator
    var priceChange: Double
    var currency: String
}

enum MetalName {
    case gold
    case silver
    case platinum
    case palladium
}

enum Currency {
    case usd
    case gbp
    case euro
}

enum MetalAskIndicator {
    case up
    case down
}

struct Metal: Decodable {
    
    let PercentChange: Double
    let Change: Double
    let PreviousClose: Double
    let Average: Double
    let Close: Double
    let Low: Double
    let High: Double
    let Open: Double
    let Spread: Double
    let Ask: Double
    let Bid: Double
    let Delay: Double
    let Outcome: String
    let Source: String
    let PreviousCloseDate: String
    let Time: String
    let Date: String
    let Currency: String
    let QuoteType: String
    let Unit: String
    let Symbol: String
    let Name: String
    let Identity: String
    let Message: String?
}
