//
//  MenuItemSection.swift
//  Mealbud
//
//  Created by Edvin Molla on 12/30/23.
//

import SwiftUI

struct MenuItemSection: View {
    
    let option: MenuBarOptions
    @Binding var currentOption: MenuBarOptions
    
    var body: some View {
       
    
            
            VStack(alignment: .leading, spacing: 24) {
                
                
                Text(option.title)
                    .font(.title.bold())
                    .padding(.top)
                    .foregroundColor(.black)
                
                ForEach(option.foodItems) { foodItem in
                    
                    NavigationLink(destination: ItemView(itemName: foodItem.title, itemDescription: foodItem.description, itemPrice: foodItem.price, itemImage: foodItem.imageName)) {
                        
                        HStack(spacing: 16) {
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text(foodItem.title)
                                    .font(.title3.bold())
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.leading)
                                
                                Text(foodItem.description)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                    .multilineTextAlignment(.leading)
                                
                                Text("\(foodItem.price)")
                                    .font(.system(size: 14))
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                            }
                            
                            Spacer()
                            
                            
                            Image(foodItem.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 96, height: 88)
                                .clipped()
                                .cornerRadius(10)
                            
                        }
                        
                    }
                    
                    
                    Divider()
                }
            }
        
        .modifier(OffsetModifier(option: option, currentOption: $currentOption))
        
    }
}


#Preview {
    MenuItemSection(option: .neapolitanPizzas, currentOption: .constant(.neapolitanPizzas))
}
