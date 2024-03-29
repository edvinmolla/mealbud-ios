//
//  ItemView.swift
//  Mealbud
//
//  Created by Edvin Molla on 1/1/24.
//

import SwiftUI

struct tbItemView: View {
    @State private var buttonValue = false
    @Environment(\.presentationMode) var presentationMode
    @State var showSheet: Bool = false
   
    
    var itemName: String
    var itemDescription: String
    var itemPrice: String
    var itemImage: String
    
    var body: some View {
        
        NavigationView {
            
            VStack {
       
              
                RoundedRectangle(cornerRadius: 14)
                    .frame(height: UIScreen.main.bounds.height * 0.24)
                    .foregroundColor(Color.red)
                    .overlay(
                        ZStack {
                            Image(itemImage)
                                .resizable()
                                .scaledToFill()
                                .frame(height: UIScreen.main.bounds.height * 0.24)
                                .clipped()
                
                                
                            
                            LinearGradient(
                                gradient: Gradient(
                                    colors: [Color.black.opacity(1), Color.black.opacity(0.5)]),
                                startPoint: .bottom,
                                endPoint: .top
                            )
                            .edgesIgnoringSafeArea(.all)
                            
                            
                            
                            
                            VStack {
                                HStack {
                                    Image(systemName: "arrow.backward.circle.fill")
                                        .font(.system(size: 50))
                                        .foregroundColor(.white)
                                        .padding(.horizontal)
                                        .onTapGesture {
                                            presentationMode.wrappedValue.dismiss()
                                        }
                                    
                                    Spacer()
                                }
                                .padding(.top, 40)
                                
                                
                                Spacer()
                                HStack {
                                    VStack {
                                        HStack {
                                            Text(itemName)
                                                .font(.custom("Uber Move Bold", size: 26))
                                                .foregroundColor(.white)
                                                .padding(.horizontal)
                                            Spacer()
                                        }
                                        HStack {
                                            Text("from Taco Bell UCLA • 6+ min")
                                                .font(.custom("Uber Move Bold", size: 14))
                                                .foregroundColor(.white.opacity(0.9))
                                                .padding(.horizontal)
                                            Spacer()
                                        }
                                    }
                                    
                                    VStack {
                                        Text(itemPrice)
                                            .font(.custom("Uber Move Bold", size: 34))
                                            .foregroundColor(.white)
                                            .padding(.horizontal)
                                    }
                                }
                                .padding(.bottom, 10)
                            }
                        }
                    )
                
                
                VStack {
                    HStack{
                        Text(itemDescription)
                            .font(.custom("Uber Move Medium", size: 15))
                            .padding(.horizontal)
                        Spacer()
                    }
                    .padding(.top, 10)
                    .padding(.bottom, 2)
                    
                    HStack{
                        Text("Visit UCLA dining website for allergen warnings.")
                            .font(.custom("Uber Move Medium", size: 10))
                            .padding(.horizontal)
                        
                        Spacer()
                    }
                    .padding(.bottom,10)
                   
                        
                }
           
                
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    Rectangle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 8)
                        .edgesIgnoringSafeArea(.horizontal)
                 
                    tbSideRadio()
                        .padding(.vertical)
                    
                    
                }
                
                
                Spacer()
                
                NavigationLink(
                    
                    destination: CheckOut(itemName: itemName, itemPrice: itemPrice, itemDescription: itemDescription, itemImage: itemImage),
                    label: {
                        
                        HStack {
                           Spacer()
                                Text("Order Now")
                                    
                            
                            Spacer()
                            
                            Image(systemName: "arrow.right")
                                .font(.system(size: 27))
                                
                            
                            
                            }
                        .frame(width: UIScreen.main.bounds.width * 0.81, height: 24)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(Color.white)
                        .font(.custom("Uber Move Bold", size: 23))
                        .cornerRadius(14)
                            .padding()
                            .padding(.bottom, 18)
                            
                            
                            
                            
                        }
                        
                    )
            }.ignoresSafeArea()
            .navigationBarBackButtonHidden(true)
                    
        }
//        .fullScreenCover(isPresented: $showSheet, content: {
//            CheckOut(itemName: itemName, itemPrice: itemPrice, itemDescription: itemDescription, itemImage: itemImage)
//        })
        .navigationBarHidden(true)
    }
}


#Preview {
    tbItemView(itemName: "Sandwich",  itemDescription: "Portobello mushrooms, crimini mushrooms, oyster mushrooms, mozzarella, goat cheese",itemPrice: "$10.24", itemImage: "fettucine")
}


