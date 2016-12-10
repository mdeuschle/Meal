//
//  RemoveMealController.swift
//  Meals
//
//  Created by Matt Deuschle on 12/10/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

import Foundation
import UIKit

class RemoveMealController {

    let controller: UIViewController
    init(controller: UIViewController) {
        self.controller = controller
    }

    func removeMeal(meal: Meal, handler: @escaping ((UIAlertAction!)-> Void)) {
        let alertController = UIAlertController(title: "\(meal.name)",
            message: meal.details(),
            preferredStyle: .alert)
        let removeAction = UIAlertAction(title: "Remove",
                                         style: .destructive,
                                         handler: handler)
        alertController.addAction(removeAction)
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .cancel,
                                         handler: nil)
        alertController.addAction(cancelAction)
        controller.present(alertController,
                animated: true,
                completion: nil)
    }
}




