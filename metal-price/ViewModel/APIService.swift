//
//  APIService.swift
//  metal-price
//
//  Created by MuhammadKhan on 8/24/18.
//  Copyright © 2018 Lutebox. All rights reserved.
//

import Foundation
import Alamofire

struct APIService {
    
    private init () {}
    
    static let shared = APIService()
        
    func getRealTimeMetalQuotes(withSymbol symbol: String, andCurrency currency: String, completion: @escaping (Metal?, Error?) -> ()) {
        
        let url = Constants.getRealTimeMetalQuoteUrl(withSymbol: symbol, andCurrency: currency)
        
        DispatchQueue.global(qos: .background).async {
            Alamofire.request(url).response { (response) in
                if let error = response.error {
                    DispatchQueue.main.async {
                        completion(nil, error)
                    }
                } else {
                    do {
                        let decoder = JSONDecoder()
                        let metal = try decoder.decode(Metal.self, from: response.data!)
                        
                        DispatchQueue.main.async {
                            completion(metal, nil)
                        }
                    } catch {
                        DispatchQueue.main.async {
                            completion(nil, error)
                        }
                    }
                }
            }
        }
    }
    
    func getHistoricalMetalQuotes(withSymbol symbol: String, andCurrency currency: String, andWithStartDate startDate: String, andWithEndDate endDate: String, completion: @escaping ([MetalHistory]?, Error?) -> ()) {
        
        let url = Constants.getHistoricalMetalQuotes(withSymbol: symbol, andCurrency: currency, andWithStartDate: startDate, andWithEndDate: endDate)
        
        DispatchQueue.global(qos: .background).async {
            Alamofire.request(url).response { (response) in
                if let error = response.error {
                    DispatchQueue.main.async {
                        completion(nil, error)
                    }
                } else {
                    do {
                        let decoder = JSONDecoder()
                        let metal = try decoder.decode([MetalHistory].self, from: response.data!)
                        
                        DispatchQueue.main.async {
                            completion(metal, nil)
                        }
                    } catch {
                        DispatchQueue.main.async {
                            completion(nil, error)
                        }
                    }
                }
            }
        }
    }
    
    func getMetalQuotes(completion: @escaping (Metal?, Error?) -> ()) {
        
        let url = Constants.baseUrl
        
        DispatchQueue.global(qos: .background).async {
            
            Alamofire.request(url).response { (response) in
                
                if let error = response.error {
                    DispatchQueue.main.async {
                        completion(nil, error)
                    }
                } else {
                    do {
                        let decoder = JSONDecoder()
                        let metal = try decoder.decode(Metal.self, from: response.data!)
                        
                        DispatchQueue.main.async {
                            completion(metal, nil)
                        }
                    } catch {
                        DispatchQueue.main.async {
                            completion(nil, error)
                        }
                    }
                }
            }
        }
    }
}
