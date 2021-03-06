//
//  MealTableViewController.swift
//  Meals
//
//  Created by Matt Deuschle on 12/3/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

import UIKit


class MealTableViewController: UITableViewController, AddMealDelegate {

    var meals = [Meal]()

    func addMeal(meal: Meal) {
        meals.append(meal)
        Dao().archiveMeals(meals: meals)
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        meals = Dao().unArchiveMeals()

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
                    RemoveMealController(controller: self).removeMeal(meal: meal, handler: { alert in
                        self.meals.remove(at: indexPath.row)
                        self.tableView.reloadData()
                    })
                }
            }
        }
    }








}
