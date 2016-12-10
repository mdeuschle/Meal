//
//  MealTableViewController.swift
//  Meals
//
//  Created by Matt Deuschle on 12/3/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

import UIKit


class MealTableViewController: UITableViewController, AddMealDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    var meals = [Meal(name: "Pizza", happiness: 9),
                 Meal(name: "Hot Dogs", happiness: 8),
                 Meal(name: "Breakfast Burritos", happiness: 9),
                 Meal(name: "Porterhouse Steak", happiness: 9),
                 Meal(name: "Toast", happiness: 5)
    ]

    func addMeal(meal: Meal) {
        meals.append(meal)
        tableView.reloadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addMealSegue" {
            if let dvc = segue.destination as? AddMealViewController {
                dvc.addMealDelegate = self
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let meal = meals[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "mealCell") else {
            return UITableViewCell()
        }
        cell.textLabel?.text = meal.name
        let longPress = UILongPressGestureRecognizer(target: self,
                                                     action: #selector(MealTableViewController.showDetails(recognizer:)))
        cell.addGestureRecognizer(longPress)
        return cell
    }

    func showDetails(recognizer: UILongPressGestureRecognizer) {
        if recognizer.state == .began {
            if let cell = recognizer.view as? UITableViewCell {
                if let indexPath = tableView.indexPath(for: cell) {
                    let meal = meals[indexPath.row]

                    func removeMeal(action: UIAlertAction) {
                        meals.remove(at: indexPath.row)
                        tableView.reloadData()
                    }

                    let alertController = UIAlertController(title: "\(meal.name)",
                        message: meal.details(),
                        preferredStyle: .alert)
                    let removeAction = UIAlertAction(title: "Remove",
                                                    style: .destructive,
                                                    handler: removeMeal)
                    alertController.addAction(removeAction)
                    let cancelAction = UIAlertAction(title: "Cancel",
                                                    style: .cancel,
                                                    handler: nil)
                    alertController.addAction(cancelAction)
                    present(alertController,
                            animated: true,
                            completion: nil)

                }
            }
        }
    }








}
