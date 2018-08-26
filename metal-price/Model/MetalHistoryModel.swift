//
//  MetalHistoryModel.swift
//  metal-price
//
//  Created by MuhammadKhan on 8/24/18.
//  Copyright © 2018 Lutebox. All rights reserved.
//

import Foundation

struct MetalHistory: Decodable {
    
    let Average: Double
    let Close: Double
    let Low: Double
    let High: Double
    let Open: Double
    let Delay: Double
    let Outcome: String
    let EndTime: String
    let EndDate: String
    let StartTime: String
    let StartDate: String
    let Currency: String
    let QuoteType: String?
    let Symbol: String
    let Name: String
    let Identity: String?
    let Message: String?
}
