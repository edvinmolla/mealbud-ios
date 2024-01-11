//
//  MenuDrinkOptions.swift
//  Mealbud
//
//  Created by Edvin Molla on 1/11/24.
//

import Foundation

enum MenuDrinkOptions: Int, CaseIterable {
    case drinks
    
    var title: String {
        switch self {
        case .drinks: return "Drinks"
        }
    }
    
    var drinkItems: [DrinkItem] {
        switch self {
        case .drinks:
            return drinkItemList
        }
    }
}
