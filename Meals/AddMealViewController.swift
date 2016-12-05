//
//  AddMealViewController.swift
//  Meals
//
//  Created by Matt Deuschle on 12/3/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

import UIKit

protocol AddMealDelegate {
    func addMeal(meal: Meal)
}

class AddMealViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var addMealTextField: UITextField!
    @IBOutlet var addHappinessTextField: UITextField!
    @IBOutlet var itemTableView: UITableView!

    var items = [Item(name: "Mustard", calories: 6),
                 Item(name: "Mayo", calories: 20),
                 Item(name: "Peppers", calories: 4)
    ]

    var selectedItems = [Item]()

    var addMealDelegate: AddMealDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        stylizeNewItemButton()
    }

    func stylizeNewItemButton() {
        let newItemButton = UIBarButtonItem(title: "New Item",
                                            style: .plain,
                                            target: self,
                                            action: #selector(AddMealViewController.newItemButtonTapped))
        navigationItem.rightBarButtonItem = newItemButton
    }

    func newItemButtonTapped() {
        let dvc = NewItemViewController(nibName: "NewItemViewController", bundle: nil)
        if let navigation = navigationController {
            navigation.pushViewController(dvc, animated: true)
        }

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell") else {
            return UITableViewCell()
        }
        cell.textLabel?.text = item.name
        return cell
     }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            let item = items[indexPath.row]
            if cell.accessoryType == .none {
                selectedItems.append(item)
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
                if let position = selectedItems.index(of: item) {
                    selectedItems.remove(at: position)
                }
            }
        }
    }

    @IBAction func addButtonTapped(_ sender: UIButton) {

        if let mealName = addMealTextField.text, let mealHappiness = addHappinessTextField.text, let delegate = addMealDelegate {
            if let happinessInt = Int(mealHappiness) {
                let meal = Meal(name: mealName, happiness: happinessInt)
                delegate.addMeal(meal: meal)
                meal.items = selectedItems
                print("Meal \(meal.name) \(meal.happiness) \(meal.items)")
            }
        }

        if let navigation = navigationController {
            navigation.popViewController(animated: true)
        }
    }
}
