//
//  Constants.swift
//  metal-price
//
//  Created by MuhammadKhan on 8/24/18.
//  Copyright © 2018 Lutebox. All rights reserved.
//

import Foundation

struct Constants {
    
    private init () {}
    
    //static let shared = Constants()
    
    static let scheme = "https://"
    
    static let host = "globalmetals.xignite.com/"
    
    static let path = "xGlobalMetals.json/"
    
    static let baseUrl = "\(Constants.scheme)\(Constants.host)\(Constants.path)"
    
    static let token = "3D80D69500BF468A9E98A961E4646C46"
    
    static func getRealTimeMetalQuoteUrl(withSymbol metalSymbol: String, andCurrency currency: String, andToken token: String) -> String {
        return "\(baseUrl)GetRealTimeExtendedMetalQuote?Symbol=\(metalSymbol)&Currency=\(currency)&_token=\(token)"
    }
    
    
}
