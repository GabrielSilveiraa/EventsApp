//
//  UINavigationController.swift
//  EventsApp
//
//  Created by Gabriel Silveira on 13/07/19.
//  Copyright © 2019 Gabriel Silveira. All rights reserved.
//

import UIKit.UINavigationController

extension UINavigationController {
    func setupAppearance() {
        navigationBar.barStyle = .black
        navigationBar.tintColor = .white
        navigationBar.barTintColor = .red
        navigationBar.prefersLargeTitles = true
        navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}
