//
//  Meal.swift
//  Meals
//
//  Created by Matt Deuschle on 12/3/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

import Foundation

class Meal: NSObject, NSCoding {

    var name: String
    var happiness: Int
    var items = [Item]()

    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as! String
        happiness = aDecoder.decodeInteger(forKey: "happiness")
        items = aDecoder.decodeObject(forKey: "items") as! [Item]

    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(happiness, forKey: "happiness")
        aCoder.encode(items, forKey: "items")
    }

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
