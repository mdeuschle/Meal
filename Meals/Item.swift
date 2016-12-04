//
//  Item.swift
//  Meals
//
//  Created by Matt Deuschle on 12/3/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

import Foundation


class Item: Equatable {

    var name: String
    var calories: Int

    init(name: String, calories: Int) {
        self.name = name
        self.calories = calories
    }
}

func ==(first: Item, second: Item) -> Bool {

    return first.name == second.name && first.calories == second.calories
}
