
import SwiftUI

struct MainEntry: View {
    @State var showSheet: Bool = false
    
    let drinkOption: MenuDrinkOptions
    
    
    var body: some View {
        
        
        NavigationView {
            
            VStack(alignment: .leading) {
                
               
                
                Text("Best Value")
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                    .padding(.horizontal, 15)
                    .padding(.top, 40)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 14) {
                        ForEach(drinkOption.drinkItems) { item in
                            
                            VStack {
                                
                                Image(item.imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                                    .background(Color.red.opacity(12))
                                    .cornerRadius(14)
                                
                                VStack(alignment: .leading) {
                                    
                                    HStack
                                    {
                                        Text(item.title)
                                    
                                            .font(.custom("Uber Move Bold", size: 14))
                                            .padding(.horizontal, 3)
                                        Spacer()
                                             Text(item.price)
                                            .font(.custom("Uber Move Bold", size: 12))
                                    }
                                    
                                    
                                    HStack {
                                            Text(item.description)
                                            .font(.custom("Uber Move Medium", size: 10))
                                            .fontWeight(.regular)
                                        
                                        
                                       
                                    }
                                    .padding(.horizontal, 3)
                                }
                                .frame(maxWidth:100)
                            }.fullScreenCover(isPresented: $showSheet, content: {
                                            CheckOut(itemName: item.title, itemPrice: item.price, itemDescription: item.description, itemImage: item.imageName)
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
                
                
                
           
            
                
                
                
                
                
                
            }
        }
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}




#Preview{
    MainEntry(drinkOption: .drinks)
    }
