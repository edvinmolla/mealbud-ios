//
//  ItemView.swift
//  Mealbud
//
//  Created by Edvin Molla on 1/1/24.
//

import SwiftUI

struct ItemView: View {
    @State private var buttonValue = false
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                
                
                RoundedRectangle(cornerRadius: 14)
                    .frame(height: UIScreen.main.bounds.height * 0.24)
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
                                HStack {
                                    Image(systemName: "xmark.circle.fill")
                                        .font(.system(size: 50))
                                        .foregroundColor(.white)
                                        .padding(.horizontal)
                                        .onTapGesture {
                                            presentationMode.wrappedValue.dismiss()
                                        }
                                    
                                    Spacer()
                                }
                                .padding(.top, 60)
                                
                                
                                Spacer()
                                HStack {
                                    VStack {
                                        HStack {
                                            Text("Italian Sandwich")
                                                .font(.custom("Uber Move Bold", size: 26))
                                                .foregroundColor(.white)
                                                .padding(.horizontal)
                                            Spacer()
                                        }
                                        HStack {
                                            Text("from Epic at Ackerman • 10+ min")
                                                .font(.custom("Uber Move Bold", size: 14))
                                                .foregroundColor(.white.opacity(0.9))
                                                .padding(.horizontal)
                                            Spacer()
                                        }
                                    }
                                    
                                    VStack {
                                        Text("$9.75")
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
                    Text("allergies enum list")
                }
                
                
                
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    Rectangle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 8)
                        .edgesIgnoringSafeArea(.horizontal)
                        .padding(.top, 20)
                    
                    SideRadio()
                        .padding(.top)
                    
                }
                
                
                Spacer()
                
                
                Button(action: {
                    
                }) {
                    Text("Order Now")
                        .frame(width: UIScreen.main.bounds.width * 0.75)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(Color.white)
                        .font(.custom("Uber Move Bold", size: 23))
                        .cornerRadius(14)
                }
                .padding()
                .padding(.top, -10)
                
                
            }.ignoresSafeArea()
                .navigationBarBackButtonHidden(true)
            
        }
        .navigationBarHidden(true)
        
        
    }
    
}


#Preview {
    ItemView()
}


