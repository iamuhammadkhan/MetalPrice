//
//  DoubleExtension.swift
//  metal-price
//
//  Created by MuhammadKhan on 8/24/18.
//  Copyright © 2018 Lutebox. All rights reserved.
//

import Foundation

extension Double {
    func withCommas() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value:self))!
    }
}
