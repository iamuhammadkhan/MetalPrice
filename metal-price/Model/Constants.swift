//
//  Constants.swift
//  metal-price
//
//  Created by MuhammadKhan on 8/24/18.
//  Copyright © 2018 Lutebox. All rights reserved.
//

import Foundation

struct Constants {
    
    static private let scheme = "https://"
    
    static private let host = "globalmetals.xignite.com/"
    
    static private let path = "xGlobalMetals.json/"
    
    static private let token = "3D80D69500BF468A9E98A961E4646C46"
    
    static func getBaseUrl(withScheme scheme: String, andWitHost host: String, andWithPath path: String) -> String {
        
        return "\(scheme)\(host)\(path)"
    }
    
    static func getRealTimeMetalQuoteUrl(withSymbol metalSymbol: String, andCurrency currency: String) -> String {
        
        let baseUrl = getBaseUrl(withScheme: scheme, andWitHost: host, andWithPath: path)
        
        return "\(baseUrl)GetRealTimeExtendedMetalQuote?Symbol=\(metalSymbol)&Currency=\(currency)&_token=\(token)"
    }
    
    static func getHistoricalMetalQuotes(withSymbol metalSymbol: String, andCurrency currency: String, andWithStartDate stratDate: String, andWithEndDate endDate: String) -> String {
        
        let baseUrl = getBaseUrl(withScheme: scheme, andWitHost: host, andWithPath: path)
        
        return "\(baseUrl)GetHistoricalMetalQuotesRange?Symbol=\(metalSymbol)&Currency=\(currency)&StartDate=\(stratDate)&EndDate=\(endDate)&FixingTime=00:00&PeriodType=Daily&PriceType=Ask&_token=\(token)"
    }
    
    static let baseUrl = "http://services.packetizer.com/spotprices/?f=json"
}
