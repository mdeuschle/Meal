//
//  NewItemViewController.swift
//  Meals
//
//  Created by Matt Deuschle on 12/4/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

import UIKit

protocol AddNewItemDelegate {
    func addItem(item: Item)
}


class NewItemViewController: UIViewController {

    @IBOutlet var addNewItemNameTextfield: UITextField?
    @IBOutlet var addCaloriesTextField: UITextField?

    var addItemDelegate: AddNewItemDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func addNewItemTapped() {

        if let newItemName = addNewItemNameTextfield, let addCalories = addCaloriesTextField {
            if let newItemNameText = newItemName.text, let addCaloriesText = addCalories.text {
                if Int(addCaloriesText) != nil {
                    let newItem = Item(name: newItemNameText, calories: Int(addCaloriesText)!)
                    if let delegate = addItemDelegate {
                        delegate.addItem(item: newItem)
                    }
                }
            }
        }

        if let navigation = navigationController {
            navigation.popViewController(animated: true)
        }
    }

}
