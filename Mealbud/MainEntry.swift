//
//  ContentView.swift
//  TestProject0105
//
//  Created by Federico on 01/05/2022.
//

import SwiftUI

struct MainEntry: View {
    @State var showSheet: Bool = false
    @State var showingBottomSheet = false
    @State var ordered = true
   
    var body: some View {
        
        
        NavigationView {
            
            VStack(alignment: .leading) {
                
               
                
                Text("Delicious Delights")
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                    .padding(.horizontal, 15)
                    .padding(.top, 40)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 14) {
                        ForEach(0..<10) { index in
                            
                            
                            VStack {
                                
                                Image("boba")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                                    .background(Color.blue)
                                    .cornerRadius(14)
                                
                                VStack(alignment: .leading) {
                                    
                                    HStack
                                    {
                                        Text("Bruin Fresh")
                                            .minimumScaleFactor(0.5)
                                            .font(.custom("Uber Move Bold", size: 14))
                                            .padding(.horizontal, 3)
                                        Spacer()
                                        Text("$5")
                                            .font(.custom("Uber Move Bold", size: 14))
                                    }
                                    
                                    
                                    HStack {
                                        Text("Banans Strawberryasdasd")
                                            .font(.custom("Uber Move Medium", size: 10))
                                            .fontWeight(.regular)
                                        
                                        
                                       
                                    }
                                    .padding(.horizontal, 3)
                                }
                                .frame(maxWidth:100)
                            }.fullScreenCover(isPresented: $showSheet, content: {
                                CheckOut()
                            })
                            .onTapGesture {
                                showSheet.toggle()
                            }
                            
                        }
                    }.padding(.horizontal, 14)
                }
                
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 8)
                    .edgesIgnoringSafeArea(.horizontal)
                    .padding(.top, 20)
                
                
                Text("Featured Restaurants")
                    .padding(.horizontal, 20)
                    .padding(.top, 15)
                  
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                
                GeometryReader { geometry in
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            //                        ForEach(0..<3) { index in
                            //                            RoundedRectangle(cornerRadius: 14)
                            //                                .frame(width: geometry.size.width * 0.75, height: 180)
                            //                                .foregroundColor(Color.blue)
                            //                                .overlay(
                            //                                    Text("Card")
                            //                                        .foregroundColor(.white)
                            //                                )
                            //                        }
                            
                            NavigationLink(destination: MenuView()) {
                                
                                RoundedRectangle(cornerRadius: 14)
                                    .frame(width: geometry.size.width * 0.92, height: 200)
                                    .foregroundColor(Color.red)
                                    .overlay(
                                        
                                        ZStack {
                                            
                                            Image("epicatackerman")
                                                .resizable()
                                                .cornerRadius(14)
                                            
                                            LinearGradient(
                                                gradient: Gradient(
                                                    colors: [Color.black.opacity(1), Color.black.opacity(0.5)]),
                                                startPoint: .bottom,
                                                endPoint: .top
                                            )
                                            .edgesIgnoringSafeArea(.all)
                                            .cornerRadius(14)
                                            
                                            
                                            VStack {
                                                Spacer()
                                                
                                                HStack {
                                                    Text("Epic at Ackerman")
                                                        .font(.custom("Uber Move Bold", size: 23))
                                                        .foregroundColor(.white)
                                                        .padding(.horizontal)
                                                    Spacer()
                                                    Text("from $7.30")
                                                        .font(.custom("Uber Move Bold", size: 16))
                                                        .foregroundColor(.white)
                                                        .padding(.horizontal)
                                                    
                                                }
                                                HStack {
                                                    Text("$0.35 Delivery • 10+ min")
                                                        .font(.custom("Uber Move Medium", size: 14))
                                                        .foregroundColor(.white)
                                                        .padding(.horizontal)
                                                    Spacer()
                                                    
                                                    
                                                }
                                                
                                                
                                            }
                                            .padding(.bottom, 10)
                                            
                                            
                                        }
                                        
                                        
                                        
                                        
                                    )
                                
                            }
                            .buttonStyle(PlainButtonStyle())
                            
                           
                            
                        }.padding(.horizontal, 15)
                        
                    }
                    
                }
                
                
                
                
                Spacer()
                
                
                
                if ordered {
                    
                    Divider()
                    
                    
                    HStack {
                        
                        Button {
                            
                            showingBottomSheet.toggle()
                        } label: {
                            
                            HStack {
                                
                                Spacer()
                                
                                VStack {
                                    
                                    HStack {
                                        
                                        Text("View Order")
                                            .font(.custom("Uber Move Bold", size: 23))
                                            .font(.title2)
                                          
                                        
                                    Spacer()
                                        
                                    }
                                    
                                    
                                    HStack {
                                        
                                        Text("Preparing ...")
                                            .font(.custom("Uber Move Meium", size: 15))
                                        
                                        Spacer()
                                       
                                    }
                                    
                                    
                                    
                                }
                             
                               
                                
                                Image(systemName: "arrow.up.circle.fill")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                          
                                Spacer()
                            }
                            .padding(.horizontal, 30)
                            .padding(.vertical, 5)
                            //                    .background(.black)
                            .cornerRadius(14)
                            
                            
                        }
                        .buttonStyle(PlainButtonStyle())
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.horizontal, 25)
                        
                    }
                    
                    
                }
                
                
            
                
                
                
                
                
                
            }.sheet(isPresented: $showingBottomSheet) {
                BottomSheetView()
                    .presentationDetents([.fraction(0.3)])
                
                
            }
        }
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}


struct BottomSheetView: View {
    var body: some View {
        
        
        
        
        
        ZStack {
            
            
            VStack {
                HStack {
                    Text("Estimated delivery")
                        .fontWeight(.semibold)
                        .font(.subheadline)
                        .padding(.horizontal, 30)
                    
                    Spacer()
                    
                }
                
                HStack {
                    
                    HStack {
                        Text("8:33am – 8: 55am")
                        
                            .fontWeight(.light)
                            .font(.title)
                            .padding(.horizontal, 14)
                        
                        
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "message")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .padding(.horizontal, 15)
                                .foregroundColor(.black)
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "phone")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(.black)
                            
                        }
                    }
                    .padding()
                    
                    
                    
                }
                .frame(maxWidth:.infinity)
                .background(Color.gray.opacity(0.1))
                
                //
                
                
                
                HStack {
                    
                    HStack {
                        Image("fettucine")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .background(Color.blue)
                            .cornerRadius(14)
                        
                        VStack {
                            HStack {
                                Text("Fettucine Alfredo w/ Chicken")
                                    .font(.subheadline)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                
                                Spacer()
                            }
                            
                            HStack {
                                Text("Total: $12.65")
                                    .font(.footnote)
                                Spacer()
                            }
                            
                        }
                        
                        Spacer()
                    }
                    .padding(.top, 10)
                    .padding(.horizontal, 30)
                }
            }
            
            
            
            
            
            
            
            
            
        }
        
        
        
        
        
        
        
        
        
        
        
    }
    
    
}



#Preview{
    MainEntry()
    }
