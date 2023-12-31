//
//  MenuBarOptions.swift
//  Mealbud
//
//  Created by Edvin Molla on 12/30/23.
//

import Foundation

enum MenuBarOptions: Int, CaseIterable {
    case japanese
    case american
    case italian
    case salads
    case fancy
    
    var title: String {
        switch self {
        case .japanese: return "Japanese"
        case .american: return "American"
        case .italian: return "Italian"
        case .salads: return "Salads"
        case .fancy: return "Fancy"
        }
    }
    
    var foodItems: [FoodItem] {
        switch self {
        case .japanese:
            return japaneseFood
        case .american:
            return saladItems
        case .italian:
            return italianFood
        case .salads:
            return saladItems
        case .fancy:
            return italianFood
        }
    }
}
