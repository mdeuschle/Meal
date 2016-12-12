//
//  Dao.swift
//  Meals
//
//  Created by Matt Deuschle on 12/11/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

import Foundation

class Dao {
    let mealArchive: String
    let itemsArchive: String

    init() {
        let userDirs = NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                           .userDomainMask,
                                                           true)
        mealArchive = ("\(userDirs[0])/meals")
        itemsArchive = ("\(userDirs[0])/items")
    }

    func archiveMeals(meals: [Meal]) {
        NSKeyedArchiver.archiveRootObject(meals, toFile: mealArchive)
    }

    func archiveItem(items: [Item]) {
        NSKeyedArchiver.archivedData(withRootObject: items)
        NSKeyedArchiver.archiveRootObject(items, toFile: itemsArchive)
    }

    func unArchiveItems() -> [Item] {

        if let unArchivedItem =  NSKeyedUnarchiver.unarchiveObject(withFile: itemsArchive) as? [Item] {
            return unArchivedItem
        } else {
            return [Item]()
        }
    }

    func unArchiveMeals() -> [Meal] {
        if let unArchivedMeal = NSKeyedUnarchiver.unarchiveObject(withFile: mealArchive)  as? [Meal] {
            return unArchivedMeal
        } else {
            return [Meal]()
        }
    }
}




