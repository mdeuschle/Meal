//
//  AddMealViewController.swift
//  Meals
//
//  Created by Matt Deuschle on 12/3/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

import UIKit

class AddMealViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var addMealTextField: UITextField!
    @IBOutlet var addHappinessTextField: UITextField!
    @IBOutlet var itemTableView: UITableView!

    var items = [Item(name: "Mustard", calories: 6),
                 Item(name: "Mayo", calories: 20),
                 Item(name: "Peppers", calories: 4)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

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

    @IBAction func addButtonTapped(_ sender: UIButton) {

        if let navigation = navigationController {
            navigation.popViewController(animated: true)
        }
    }
}
