//
//  Meal.swift
//  Meals
//
//  Created by Matt Deuschle on 12/3/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

import Foundation

class Meal {

    var name: String
    var happiness: Int
    var items = [Item]()

    init(name: String, happiness: Int) {
        self.name = name
        self.happiness = happiness
    }

    func details() -> String {
        var message = "Happiness: \(happiness)"
        for item in items {
            message += "\n\(item.name) | \(item.calories) calories"
        }
        return message
    }
}
