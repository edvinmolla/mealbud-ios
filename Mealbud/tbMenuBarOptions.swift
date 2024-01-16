//
//  MenuBarOptions.swift
//  Mealbud
//
//  Created by Edvin Molla on 12/30/23.
//

import Foundation



enum tbMenuBarOptions: Int, CaseIterable {
    case combos
    case tacos
    case burritos
    case quesadillas
    case tbSpecials
    
    var title: String {
        switch self {
        case .combos: return "Combos"
        case .tacos: return "Tacos"
        case .burritos: return "Burritos"
        case .quesadillas: return "Quesadillas"
        case .tbSpecials: return "Specials"
    
        }
    }
    
    var foodItems: [tacobellItem] {
        switch self {
        case .combos: return comboItems
        case .tacos: return tacoItems
        case .burritos: return burritoItems
        case .quesadillas: return quesadillaItems
        case .tbSpecials: return tbSpecialItems
      
        }
    }
}
