//
//  Alert.swift
//  Meals
//
//  Created by Matt Deuschle on 12/10/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

import Foundation
import UIKit

class Alert {

    let controller: UIViewController

    init(controller: UIViewController) {
        self.controller = controller
    }

    func showAlert(message: String = "An error occured. Be careful") {
        let alertController = UIAlertController(title: "Alert",
                                                message: message,
                                                preferredStyle: .alert)
        let action = UIAlertAction(title: "OK",
                                   style: .cancel,
                                   handler: nil)
        alertController.addAction(action)
        controller.present(alertController,
                           animated: true,
                           completion: nil)
    }

}
