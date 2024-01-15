//
//  MenuBarOptions.swift
//  Mealbud
//
//  Created by Edvin Molla on 12/30/23.
//

import Foundation



enum MenuBarOptions: Int, CaseIterable {
    case neapolitanPizzas
    case pizzaPies
    case pastas
    case sandwiches
    case salads
    
    var title: String {
        switch self {
        case .neapolitanPizzas: return "Neapolitan Pizzas"
        case .pizzaPies: return "Pizza Pies"
        case .pastas: return "Pastas"
        case .sandwiches: return "Sandwiches"
        case .salads: return "Salads"
//        case .fancy: return "Fancy"
        }
    }
    
    var foodItems: [FoodItem] {
        switch self {
        case .neapolitanPizzas:
            return neapolitanPizzasItems
        case .pizzaPies:
            return pizzaPiesItems
        case .pastas:
            return pastaItems
        case .sandwiches:
            return sandwichItems
        case .salads:
            return saladItems

        }
    }
}
