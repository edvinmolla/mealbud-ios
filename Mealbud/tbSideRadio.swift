import SwiftUI

struct tbSideRadio: View {
    var foodSide = ["Extra Beef", "no shit"]
    var drinkSide = ["Pepsi", "Dr Pepper", "Fanta", "Diet Fanta"]
    
    @AppStorage("selectedSide") var selectedSide = ""
    @AppStorage("selectedDrink") var selectedDrink = ""
    
    
    var body: some View {
        VStack(spacing: 14) {
            
//            VStack {
//            
//                HStack {
//                    Text("Customize")
//                        .font(.custom("Uber Move Bold", size: 22))
//                    Spacer()
//                    Text("$1.25")
//                        .font(.custom("Uber Move Bold", size: 20))
//                }
//                .padding(.vertical, 6)
//                
//                ForEach(foodSide, id: \.self) { option in
//                    HStack {
//                        Text(option)
//                            .font(.custom("Uber Move Medium", size: 18))
//                        
//                        
//                        Spacer()
//                        
//                        if selectedSide == option {
//                            Circle()
//                                .stroke(Color.black, lineWidth: 8)
//                                .frame(width: 23, height: 23)
//                        } else {
//                            Circle()
//                                .stroke(Color.black, lineWidth: 2)
//                                .frame(width: 23, height: 23)
//                            
//                        }
//                    }
//                   
//                    .foregroundColor(.black)
//                    .onTapGesture {
//                                            if selectedSide == option {
//                                                selectedSide = "" // Unselect if already selected
//                                            } else {
//                                                selectedSide = option
//                                            }
//                                        }
//                    Divider()
//                        .padding(.bottom, 5)
//                }
//            }
//            .padding(.horizontal, 20)
//            
//            
//            Rectangle()
//                .fill(Color.gray.opacity(0.2))
//                .frame(height: 8)
//                .edgesIgnoringSafeArea(.horizontal)
//                .padding(.top, 20)
            
            VStack {
                HStack {
                    Text("Select Drink")
                        .font(.custom("Uber Move Bold", size: 22))
                    Spacer()
                    
                    Text("Free")
                        .font(.custom("Uber Move Bold", size: 20))
                }
                .padding(.vertical, 6)
                
                ForEach(drinkSide, id: \.self) { option in
                    HStack {
                        Text(option)
                            .font(.custom("Uber Move Medium", size: 18))
                        
                        Spacer()
                        
                        if selectedDrink == option {
                            Circle()
                                .stroke(Color.black, lineWidth: 8)
                                .frame(width: 23, height: 23)
                        } else {
                            Circle()
                                .stroke(Color.black, lineWidth: 2)
                                .frame(width: 23, height: 23)
                            
                        }
                    }
                    .foregroundColor(.black)
                    .onTapGesture {
                                            if selectedDrink == option {
                                                selectedDrink = "" // Unselect if already selected
                                            } else {
                                                selectedDrink = option
                                            }
                                        }
                    Divider()
                        .padding(.bottom, 5)
                }
                
            }
            .padding(.horizontal, 20)
            
            
            
        }
    
    }
}

//struct RadioButton_Previews: PreviewProvider {
//    static var previews: some View {
//        SideRadio()
//    }
//}
