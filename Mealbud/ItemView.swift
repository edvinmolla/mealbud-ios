//
//  ItemView.swift
//  Mealbud
//
//  Created by Edvin Molla on 1/1/24.
//

import SwiftUI

struct ItemView: View {
    var body: some View {
       
        ZStack {
            
            VStack {
                
                
                GeometryReader { geometry in
                    
                    RoundedRectangle(cornerRadius: 14)
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.24)
                        .foregroundColor(Color.red)
                        .overlay(
                            
                            ZStack {
                                
                                Image("italiansandwich")
                                    .resizable()
                                
                                
                                LinearGradient(
                                    gradient: Gradient(
                                        colors: [Color.black.opacity(1), Color.black.opacity(0.5)]),
                                    startPoint: .bottom,
                                    endPoint: .top
                                )
                                .edgesIgnoringSafeArea(.all)
                                
                                
                                
                                VStack {
                                    Spacer()
                                    
                                    HStack {
                                        Text("Italian Sandwich")
                                            .font(.custom("Uber Move Bold", size: 26))
                                            .foregroundColor(.white)
                                            .padding(.horizontal)
                                        Spacer()
                                        Text("$9.75")
                                            .font(.custom("Uber Move Bold", size: 23))
                                            .foregroundColor(.white)
                                            .padding(.horizontal)
                                        
                                    }
                                    HStack {
                                        Text("from Epic at Ackerman • 10+ min")
                                            .font(.custom("Uber Move Bold", size: 14))
                                            .foregroundColor(.white.opacity(0.9))
                                            .padding(.horizontal)
                                        Spacer()
                                        
                                        
                                    }
                                    
                                    
                                }
                                .padding(.bottom, 10)
                                
                                
                            }
                            
                            
                            
                            
                        )
                    
                  
                }.ignoresSafeArea()
                
              
            
                
                
            
                
                
                
            }
           
            
            
            VStack {
                
                Text("Whatever")
               
            }
        
           
        }
        
     
        
 
        
        
    }
}

#Preview {
    ItemView()
}
