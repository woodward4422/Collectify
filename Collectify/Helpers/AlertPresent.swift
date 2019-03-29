//
//  AlertPresent.swift
//  Collectify
//
//  Created by Noah Woodward on 3/29/19.
//  Copyright © 2019 Noah Woodward. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func presentAlert(title: String = "Error", errorMessage: String?) {
        let alert = UIAlertController(title: title, message: errorMessage, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
        self.present(alert, animated: true)
    }
}
