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

struct tacobellItem: Identifiable {
    var id = UUID().uuidString
    let title: String
    let description: String
    let price: String
    let imageName: String
    
}

var comboItems: [tacobellItem] = [
    
    .init(title: "3 Crunchy Tacos Combo", description: "A trio of tacos with crispy shells, filled with seasoned beef, crisp lettuce, and topped with shredded cheddar cheese, creating a perfect crunch in every bite.", price: "$7.49", imageName: "3 Crunchy Tacos Combo"),
    .init(title: "3 Crunchy Tacos Supreme® Combo", description: "Pepperoni, red onions, mozzarella, pomodoro", price: "$8.99", imageName: "3 Crunchy Tacos Supreme® Combo"),
    .init(title: "3 Soft Tacos Combo", description: "Soft, warm tortillas enveloping a filling of juicy ground beef, fresh lettuce, and a generous sprinkle of cheddar cheese, offering a tender and flavorful experience.", price: "$7.49", imageName: "3 Soft Tacos Combo"),
    .init(title: "3 Soft Tacos Supreme® Combo", description: "Portobello mushrooms, crimini mushrooms, oyster mushrooms, mozzarella, goat cheese", price: "$8.99", imageName: "3 Soft Tacos Supreme® Combo"),
    
    .init(title: "Burrito Supreme® Combo", description: "A delightful burrito stuffed with savory beef, refried beans, crisp lettuce, diced tomatoes, rich sour cream, and cheddar cheese, all wrapped in a soft flour tortilla.", price: "$8.79", imageName: "Burrito Supreme® Combo"),
    .init(title: "Crunchwrap Supreme® Combo", description: "A unique combination of textures, featuring seasoned beef, warm nacho cheese, a crunchy tostada shell, sour cream, lettuce, and diced tomatoes, all neatly folded in a grilled tortilla.", price: "$8.49", imageName: "Crunchwrap Supreme® Combo"),
    .init(title: "Nachos BellGrande® Combo", description: "A generous portion of crisp tortilla chips topped with seasoned beef, warm nacho cheese, refried beans, sour cream, and diced tomatoes, perfect for sharing.", price: "$9.15", imageName: "Nachos BellGrande® Combo"),
    .init(title: "Chicken Quesadilla Combo", description: "A toasted flour tortilla filled with juicy, marinated grilled chicken, a blend of melted cheeses, and a tangy sauce, offering a satisfying melt-in-your-mouth experience.", price: "$9.05", imageName: "Chicken Quesadilla Combo"),

]

var tacoItems: [tacobellItem] = [

    .init(title: "Crunchy Taco", description: "A classic favorite with a crispy taco shell filled to the brim with seasoned beef, fresh lettuce, and shredded cheddar cheese, offering a delightful crunch with every bite.", price: "$1.89", imageName: "Crunchy Taco"),
    .init(title: "Crunchy Taco Supreme®", description: "", price: "$2.69", imageName: "Crunchy Taco Supreme®"),
    .init(title: "Soft Taco", description: "A soft, warm flour tortilla wrapped around savory seasoned beef, crisp lettuce, and shredded cheddar cheese, creating a perfectly balanced and satisfying taco.", price: "$1.89", imageName: "Soft Taco"),
    .init(title: "Soft Taco Supreme®", description: "", price: "$2.69", imageName: "Soft Taco Supreme®"),
    .init(title: "Nacho Cheese Doritos® Locos Tacos", description: "A bold twist on the classic taco with a shell made from Doritos chips, filled with seasoned beef, crisp lettuce, and shredded cheddar cheese for an irresistible crunch and flavor.", price: "$2.69", imageName: "Nacho Cheese Doritos® Locos Tacos"),
    .init(title: "Nacho Cheese Doritos® Locos Tacos Supreme®", description: "", price: "$3.19", imageName: "Nacho Cheese Doritos® Locos Tacos Supreme®"),
    
]

var burritoItems: [tacobellItem] = [
    .init(title: "Bean Burrito", description: "A hearty vegetarian option with a soft flour tortilla filled with creamy refried beans, onions, red sauce, and melted cheddar cheese, offering a comforting and fulfilling meal.", price: "$1.99", imageName: "Bean Burrito"),
    .init(title: "Beefy 5-Layer Burrito", description: "A layered delight with seasoned beef, creamy nacho cheese sauce, a hearty helping of refried beans, sour cream, and cheddar cheese, all wrapped in a warm flour tortilla.", price: "$3.79", imageName: "Beefy 5-Layer Burrito"),
    .init(title: "Burrito Supreme®", description: "A substantial burrito filled with seasoned beef, refried beans, lettuce, tomatoes, rich sour cream, and cheddar cheese, all rolled in a soft flour tortilla for a supreme taste.", price: "4.69", imageName: "Burrito Supreme®"),
]

var quesadillaItems: [tacobellItem] = [

    .init(title: "Cheese Quesadilla", description: "A simple yet satisfying option with a blend of melted cheeses and a creamy jalapeño sauce, grilled to perfection in a flour tortilla, creating a gooey, cheesy delight.", price: "$4.29", imageName: "Cheese Quesadilla"),
    .init(title: "Chicken Quesadilla", description: "Marinated grilled chicken combined with a melted cheese blend and a tangy sauce, grilled between a flour tortilla, offering a delightful balance of flavors and textures.", price: "$5.19", imageName: "Chicken Quesadilla"),
    .init(title: "Steak Quesadilla", description: "A flavorful quesadilla with tender, marinated steak, melted cheese blend, and a zesty sauce, grilled between a flour tortilla for a deliciously cheesy and meaty treat.", price: "$5.39", imageName: "Steak Quesadilla"),

]

var tbSpecialItems: [tacobellItem] = [
    .init(title: "Nachos BellGrande®", description: " A generous portion of crisp tortilla chips topped with seasoned beef, warm nacho cheese, refried beans, sour cream, and diced tomatoes, perfect for sharing.", price: "$5.79", imageName: "Nachos BellGrande®"),
    .init(title: "Cheesy Gordita Crunch", description: "A unique combination of a soft, warm gordita shell and a crunchy taco shell, filled with seasoned beef, lettuce, and a blend of melted cheeses, topped with a spicy ranch sauce.", price: "$4.59", imageName: "Cheesy Gordita Crunch"),
]


var neapolitanPizzasItems: [FoodItem] = [
    
    .init(title: "Margherita Pizza", description: "Mozzarella, pomodoro, basil", price: "$9.95", imageName: "Margherita Pizza"),
    .init(title: "Pepperoni Pizza", description: "Pepperoni, red onions, mozzarella, pomodoro", price: "$10.95", imageName: "Pepperoni Pizza"),
    .init(title: "Pizza Bianca", description: "Garlic, ricotta, mozzarella, Parmesan, dry oregano, thyme, red pepper flakes", price: "$10.95", imageName: "Pizza Bianca"),
    .init(title: "Tre Funghi Pizza", description: "Portobello mushrooms, crimini mushrooms, oyster mushrooms, mozzarella, goat cheese", price: "$10.95", imageName: "Tre Funghi Pizza")

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
