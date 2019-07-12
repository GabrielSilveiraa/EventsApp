//
//  UIViewController.swift
//  EventsApp
//
//  Created by Gabriel Silveira on 12/07/19.
//  Copyright © 2019 Gabriel Silveira. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(title: String? = nil, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
