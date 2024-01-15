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


var neapolitanPizzasItems: [FoodItem] = [
    
    .init(title: "Margherita Pizza", description: "Mozzarella, pomodoro, basil", price: "$9.95", imageName: "margherittapizza"),
    .init(title: "Pepperoni Pizza", description: "Pepperoni, red onions, mozzarella, pomodoro", price: "$10.95", imageName: "pepperonipizza"),
    .init(title: "Pizza Bianca", description: "Garlic, ricotta, mozzarella, Parmesan, dry oregano, thyme, red pepper flakes", price: "$10.95", imageName: "pizzabianca"),
    .init(title: "Tre Funghi Pizza", description: "Portobello mushrooms, crimini mushrooms, oyster mushrooms, mozzarella, goat cheese", price: "$10.95", imageName: "trefunghi")

]

var pizzaPiesItems: [FoodItem] = [

    .init(title: "Chicken Broccolini LA Pie", description: "Cornmeal, Mozzarella, Jalapeno Pie with creamy Garlic Sauce, Pepperoni, Chicken, Broccolini and Parmesan Cheese", price: "$10.95", imageName: "Chicken Broccolini LA Pie"),
    .init(title: "Frutti De Mare Pie", description: "Shrimp, calamari, salmon, pomodoro, mozzarella, fresh herbs", price: "$11.95", imageName: "Frutti De Mare Pie"),
    .init(title: "Mambo Italiano Pie", description: "Pepperoni, meatballs, sautéed mushrooms, peppers, red onion, sausage, mozzarella, Parmesan", price: "$10.95", imageName: "Mambo Italiano Pie"),
]

var pastaItems: [FoodItem] = [
    
    .init(title: "Creamy Garlic Parmesan Chicken Fettuccine", description: "Parmesan garlic sauce, broccolini, chicken breast", price: "$9.95", imageName: "Creamy Garlic Parmesan Chicken Fettuccine"),
    .init(title: "Creamy Garlic Parmesan Fettuccine", description: "Parmesan garlic sauce, broccolini", price: "$8.75", imageName: "Creamy Garlic Parmesan Fettuccine"),
    .init(title: "Creamy Shrimp Scampi Fettuccine", description: "Fettuccini pasta with creamy parmesan garlic sauce , red crushed pepper, lemon, shrimp and parsley.", price: "$10.95", imageName: "Creamy Shrimp Scampi Fettuccine"),
    .init(title: "Spaghetti & Meatballs", description: "Pomodoro, meatballs, basil, Parmesan", price: "$9.95", imageName: "Spaghetti & Meatballs"),
    .init(title: "Spaghetti Pomodoro", description: "Pomodoro, basil, Parmesan", price: "$8.75", imageName: "Spaghetti Pomodoro"),

]

var sandwichItems: [FoodItem] = [
    
    .init(title: "Chicken Caprese Sandwich", description: "Chicken breast, fresh mozzarella, tomato, pesto, arugula", price: "$9.75", imageName: "Chicken Caprese Sandwich"),
    .init(title: "Parmesan Chicken Sandwich", description: "Breaded chicken breast, provolone, mozzarella, Parmesan, pomodoro", price: "$9.75", imageName: "Parmesan Chicken Sandwich"),
    .init(title: "Vegetarian Ciabatta Sandwich", description: "Baby spinach, caramelized red onion, portabella mushrooms, Campari tomatoes, roasted red peppers, basil purée", price: "$8.95", imageName: "Vegetarian Ciabatta Sandwich"),

]

var saladItems: [FoodItem] = [
    
    .init(title: "Caesar Salad", description: "Romaine hearts, garlic crouton, Parmesan, anchovy vinaigrette", price: "$8.95", imageName: "caesarsalad"),
    .init(title: "Greek Salad", description: "Romaine, radicchio, tomatoes, red onion, cucumber, Kalamata olives, feta, lemon oregano vinaigrette", price: "$8.95", imageName: "greeksalad"),
    .init(title: "Chopped Salad", description: "Market lettuces, chopped tomato, avocado, red onion, salami, Castelvetrano olives, garbanzo beans, provolone, red wine herb vinaigrette", price: "$9.95", imageName: "choppedsalad")

]
