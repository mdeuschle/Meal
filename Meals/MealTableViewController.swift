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
        return cell
    }
}
