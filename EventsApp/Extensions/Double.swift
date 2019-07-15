//
//  Double.swift
//  EventsApp
//
//  Created by Gabriel Silveira on 15/07/19.
//  Copyright © 2019 Gabriel Silveira. All rights reserved.
//

import Foundation

extension Double {
    var currencyFormat: String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}
