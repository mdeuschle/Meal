//
//  NewItemViewController.swift
//  Meals
//
//  Created by Matt Deuschle on 12/4/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

import UIKit

class NewItemViewController: UIViewController {

    @IBOutlet var addNewItemNameTextfield: UITextField?
    @IBOutlet var addCaloriesTextField: UITextField?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func addNewItemTapped() {

        if let newItemName = addCaloriesTextField, let addCalories = addCaloriesTextField {
            if let newItemNameText = newItemName.text, let addCaloriesText = addCalories.text {
                if Int(addCaloriesText) != nil {
                    let newItem = Item(name: newItemNameText, calories: Int(addCaloriesText)!)
                    print("\(newItem)")
                }
            }
        }

        if let navigation = navigationController {
            navigation.popViewController(animated: true)
        }
    }

}
