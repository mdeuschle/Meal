//
//  Item.swift
//  Meals
//
//  Created by Matt Deuschle on 12/3/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

import Foundation

class Item : NSObject, NSCoding {

    var name: String
    var calories: Int

    init(name: String, calories: Int) {
        self.name = name
        self.calories = calories
    }

    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: "name") as! String
        self.calories = aDecoder.decodeInteger(forKey: "calories")
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(calories, forKey: "calories")
    }
}

func ==(first: Item, second: Item) -> Bool {
    let result = first.name == second.name && first.calories == second.calories
    return result
}
