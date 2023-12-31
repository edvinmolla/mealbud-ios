//
//  FoodItem.swift
//  Mealbud
//
//  Created by Edvin Molla on 12/30/23.
//

import Foundation

struct FoodItem: Identifiable {
    var id = UUID().uuidString
    let title: String
    let description: String
    let price: String
    let imageName: String
    
}

var japaneseFood: [FoodItem] = [
    
    .init(title: "Sushi", description: "amazing", price: "$23", imageName: "fettucine"),
    .init(title: "Sushi", description: "amazing", price: "$23", imageName: "fettucine"),
    .init(title: "Sushi", description: "amazing", price: "$23", imageName: "fettucine")

]

var saladItems: [FoodItem] = [
    
    .init(title: "Caesar Salad", description: "Romaine hearts, garlic crouton, Parmesan, anchovy vinaigrette", price: "$8.95", imageName: "caesarsalad"),
    .init(title: "Greek Salad", description: "Romaine, radicchio, tomatoes, red onion, cucumber, Kalamata olives, feta, lemon oregano vinaigrette", price: "$8.95", imageName: "greeksalad"),
    .init(title: "Chopped Salad", description: "Market lettuces, chopped tomato, avocado, red onion, salami, Castelvetrano olives, garbanzo beans, provolone, red wine herb vinaigrette", price: "$9.95", imageName: "choppedsalad")

]

var italianFood: [FoodItem] = [
    
    .init(title: "Sushi", description: "amazing", price: "$23", imageName: "fettucine"),
    .init(title: "Sushi", description: "amazing", price: "$23", imageName: "fettucine"),
    .init(title: "Sushi", description: "amazing", price: "$23", imageName: "fettucine")

]
