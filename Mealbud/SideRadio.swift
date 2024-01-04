import SwiftUI

struct SideRadio: View {
    var foodSide = ["Oatmeal Raisin", "Chocolate Chip", "Banana", "Apple", "Orange"]
    var drinkSide = ["Coke", "Diet Coke", "Dr Pepper", "Fanta", "Diet Fanta"]
    
    @State private var selectedSide: String = ""
    @State private var selectedDrink: String = ""
    
    var body: some View {
        VStack(spacing: 14) {
            
            VStack {
                
                HStack {
                    Text("Select side")
                        .font(.custom("Uber Move Bold", size: 22))
                    Spacer()
                }
                .padding(.vertical, 6)
                
                ForEach(foodSide, id: \.self) { option in
                    HStack {
                        Text(option)
                            .font(.custom("Uber Move Medium", size: 18))
                        
                        Spacer()
                        
                        if selectedSide == option {
                            Circle()
                                .stroke(Color.black, lineWidth: 8)
                                .frame(width: 23, height: 23)
                        } else {
                            Circle()
                                .stroke(Color.black, lineWidth: 2)
                                .frame(width: 24, height: 24)
                            
                        }
                    }
                    .foregroundColor(.black)
                    .onTapGesture {
                        selectedSide = option
                    }
                }
            }
            .padding(.horizontal, 20)
            
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .frame(height: 8)
                .edgesIgnoringSafeArea(.horizontal)
                .padding(.top, 20)
            
            VStack {
                
                HStack {
                    Text("Select Drink")
                        .font(.custom("Uber Move Bold", size: 22))
                    Spacer()
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
                                .frame(width: 24, height: 24)
                            
                        }
                    }
                    .foregroundColor(.black)
                    .onTapGesture {
                        selectedDrink = option
                    }
                }
                
            }
            .padding(.horizontal, 20)
            
            
            
        }
    }
}

struct RadioButton_Previews: PreviewProvider {
    static var previews: some View {
        SideRadio()
    }
}
