//
//  Date.swift
//  EventsApp
//
//  Created by Gabriel Silveira on 15/07/19.
//  Copyright © 2019 Gabriel Silveira. All rights reserved.
//

import Foundation

extension Date {
    var ddMMyyyy: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: self)
    }
}
