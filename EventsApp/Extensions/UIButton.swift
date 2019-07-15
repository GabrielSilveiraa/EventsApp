//
//  UIButton.swift
//  EventsApp
//
//  Created by Gabriel Silveira on 15/07/19.
//  Copyright © 2019 Gabriel Silveira. All rights reserved.
//

import UIKit

extension UIButton {
    func setupAppearance() {
        layer.cornerRadius = 4
        backgroundColor = .black
        setTitleColor(.white, for: .normal)
    }
}
