//
//  ContentView.swift
//  TestProject0105
//
//  Created by Federico on 01/05/2022.
//

import SwiftUI

struct MainEntry: View {
    
    @State var showingBottomSheet = false
  
    
    
    var body: some View {
        
        
        VStack(alignment: .leading) {
            
            Text("Delicious Delights")
                .fontWeight(.bold)
                .font(.system(size: 20))
                .padding(.horizontal, 15)
                .padding(.top, 40)
                .padding(.bottom, 14)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 14) {
                    ForEach(0..<10) { index in
                        
                        
                        VStack {
                            
                            Image("boba")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 130, height: 130)
                                .background(Color.blue)
                                .cornerRadius(14)
                            
                            VStack(alignment: .leading) {
                                
                                Text("Bruin Fresh")
                                    .minimumScaleFactor(0.5)
                                    .fontWeight(.semibold)
                                    .padding(.horizontal, 3)
                                
                                HStack {
                                    Text("Banans Strawberry")
                                        .font(.system(size: 14))
                                        .fontWeight(.regular)
                                        
                                    
                                    Spacer()
                                    Text("$5")
                                }
                                .padding(.horizontal, 3)
                            }
                            .frame(maxWidth:130)
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
                .padding(.bottom, 15)
                .fontWeight(.bold)
                .font(.system(size: 20))
            
            GeometryReader { geometry in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(0..<3) { index in
                            RoundedRectangle(cornerRadius: 14)
                                .frame(width: geometry.size.width * 0.75, height: 180)
                                .foregroundColor(Color.blue)
                                .overlay(
                                    Text("Card")
                                        .foregroundColor(.white)
                                )
                        }
                    }.padding(.horizontal, 15)
                    
                }
                
            }
            
            
            
            
            Spacer()
            
            
            
            Divider()
            
            
            HStack {
                
                Button {
                    showingBottomSheet.toggle()
                } label: {
                    
                    HStack {
                        
                        Text("Tap to view order")
                            .fontWeight(.bold)
                            .font(.title2)
//                            .foregroundColor(.white)
                        
                        
                        Spacer()
                        
                        Image(systemName: "arrow.up.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
//                            .foregroundColor(.white)
                        
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
            
            
         
            
            
            
            
        }.sheet(isPresented: $showingBottomSheet) {
            BottomSheetView()
                .presentationDetents([.fraction(0.3)])
            
            
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
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainEntry()
    }
}
