//
//  FoodItem.swift
//  Mealbud
//
//  Created by Edvin Molla on 12/30/23.
//

import Foundation

struct DrinkItem: Identifiable {
    var id = UUID().uuidString
    let title: String
    let description: String
    let price: String
    let imageName: String
    
}


var drinkItemList: [DrinkItem] = [
    
    //bobas
    .init(title: "Milk Tea", description: "Milk Tea (Water, Water, Non Dairy Creamer, Dark Brown Sugar", price: "$5.00", imageName: "milkteaboba"),
    .init(title: "Thai Tea", description: "Thai Iced Tea (Water, Low-Fat Milk, Condensed Milk, Sugar", price: "$5.00", imageName: "thaiboba"),
    .init(title: "Vietnamese Coffee", description: "Vietnamese Iced Coffee (Water, Half & Half Milk, Condensed Milk, Sugar, Instant Espresso", price: "$5.00", imageName: "vietnameseboba"),
   
      //smothies
        .init(title: "Blue Machine", description: "Naked Juice - Blue Machine (Apple Juice, Banana Puree, Blueberry Puree, Blackberry Puree, Chicory Root Fiber", price: "$5.00", imageName: "bluemachine-smoothie"),
    .init(title: "Green Machine", description: "Naked Juice - Green Machine (Apple Juice, Mango Puree, Pineapple Juice, Banana Puree, Kiwi Puree, Spirulina, Natural Flavor", price: "$5.00", imageName: "greenmachine-smoothie"),
    .init(title: "Mighty Mango", description: "Naked Juice - Mighty Orange Mango (Mango Puree, Apple Juice, Orange Juice, Banana Puree, Lemon Juice, Natural Flavors", price: "$5.00", imageName: "mightymango-smoothie"),
    .init(title: "Strawberry Banana", description: "Naked Juice - Strawberry Banana (Strawberry Puree, Apple Juice from Concentrate (Water, Apple Juice Concentrate), Banana Puree", price: "$5.00", imageName: "strawberry-smoothie"),
    
        //combuchas
    .init(title: "Apple Kombucha", description: "Pink Lady Apple Kombucha", price: "$5.00", imageName: "apple-kombucha"),
    .init(title: "Pomegranate Kombucha", description: "Pink Lady Apple Kombucha", price: "$5.00", imageName: "pomegranate-kombucha"),
]
