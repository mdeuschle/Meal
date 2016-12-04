//
//  MealTableViewController.swift
//  Meals
//
//  Created by Matt Deuschle on 12/3/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    var meals = [Meal(name: "Pizza", happiness: 9),
                 Meal(name: "Hot Dogs", happiness: 8),
                 Meal(name: "Breakfast Burritos", happiness: 9),
                 Meal(name: "Porterhouse Steak", happiness: 9),
                 Meal(name: "Toast", happiness: 5)
    ]

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
