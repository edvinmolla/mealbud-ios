//
//  CheckOut.swift
//  Mealbud
//
//  Created by Edvin Molla on 1/4/24.
//

import SwiftUI
import Stripe
import Foundation


func getCurrentAndFutureTimes() -> (currentTimePlus20: String, currentTimePlus40: String) {
    let currentDate = Date()
    
    // Save the current time
    let formatter = DateFormatter()
    formatter.dateFormat = "h:mm a"
//    let currentTime = formatter.string(from: currentDate)
    
    var leftEnd = "N/A"
    var rightEnd = "N/A"
    
    // Adding 20 minutes to the current date
    if let timePlus20 = Calendar.current.date(byAdding: .minute, value: 20, to: currentDate) {
        leftEnd = formatter.string(from: timePlus20)
        
        // Adding another 20 minutes to the current date
        if let timePlus40 = Calendar.current.date(byAdding: .minute, value: 20, to: timePlus20) {
            rightEnd = formatter.string(from: timePlus40)
        }
    }
    
    // Save the values in AppStorage
    @AppStorage("leftEnd") var leftEndStorage = leftEnd
    @AppStorage("rightEnd") var rightEndStorage = rightEnd
    
    return (leftEnd, rightEnd)
}



struct CheckOut: View {

    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var backendModel = BackendModel()
    @StateObject var applePayModel = ApplePayModel()
    @AppStorage("isHidden") var isHidden = false
    let callTimeFunction = getCurrentAndFutureTimes()
    
    
    var itemName: String
    var itemPrice: String
    var itemDescription: String
    var itemImage: String
    
    @AppStorage("location") var location = ""
    @AppStorage("phone") var phone = ""
    @AppStorage("savedItemImage") var savedItemImage = ""
    @AppStorage("selectedSide") var selectedSide = ""
    @AppStorage("selectedDrink") var selectedDrink = ""
    @AppStorage("applePayPrice") var applePayPrice = ""
    @AppStorage("drinkCheckout") var drinkCheckout = "false"
    @AppStorage("savedItemName") var savedItemName = ""
    @AppStorage("savedItemDescription") var savedItemDescription = ""
    @AppStorage("itemSubtotal") var itemSubtotal = ""
    @AppStorage("savedItemTotalPrice") var savedItemTotalPrice = ""
    
    func setAmount() {
        // Your API endpoint URL
        let apiUrl = URL(string: "https://mealbud.us/setamount")!
        
        // Prepare the data to be sent in the POST request
        let postData: [String: Any] = [
            "amount": savedItemTotalPrice,
           
        ]
        
        // Convert the data to JSON
        guard let jsonData = try? JSONSerialization.data(withJSONObject: postData) else {
            print("Error converting data to JSON")
            return
        }
        
        var request = URLRequest(url: apiUrl)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        
        // Set headers if needed
        // request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Create a URLSession task for the request
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
            } else if let data = data {
                // Handle the response data as needed
                print("API call successful. Response: \(String(data: data, encoding: .utf8) ?? "")")
            }
        }.resume()
    }
    
    func makeAPICall() {
        // Your API endpoint URL
        let apiUrl = URL(string: "https://mealbud.us/sendorder")!
        
        // Prepare the data to be sent in the POST request
        let postData: [String: Any] = [
            "location": location,
            "phone": phone,
            "itemName": savedItemName,
            "totalPrice": savedItemTotalPrice,
            "foodSide": selectedSide,
            "drinkSide": selectedDrink
            // Add other variables as needed
        ]
        
        // Convert the data to JSON
        guard let jsonData = try? JSONSerialization.data(withJSONObject: postData) else {
            print("Error converting data to JSON")
            return
        }
        
        var request = URLRequest(url: apiUrl)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        
        // Set headers if needed
        // request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Create a URLSession task for the request
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
            } else if let data = data {
                // Handle the response data as needed
                print("API call successful. Response: \(String(data: data, encoding: .utf8) ?? "")")
            }
        }.resume()
    }
    
    
    var body: some View {
        
        let subtotal = Double(itemPrice.replacingOccurrences(of: "$", with: "", options: .literal, range: nil)) ?? 0
        let delivery = 2.50
        let tax = 0.99
        let service = 0.40
        let total = subtotal + delivery + tax + service
        
        NavigationView {
            
            VStack{
            
                VStack{
                
                    HStack {
                        
                        if drinkCheckout != "true" {
                           
                            HStack(spacing: 10) {
                                Button {
                                    presentationMode.wrappedValue.dismiss()
                                    
                                      
                                } label: {
                                    Image(systemName: "arrow.left.circle.fill")
                                        .font(.system(size: 27))
                                }
                             
                                
                                Spacer()
                                
                             
                            }
                            .padding(.horizontal)
                            .foregroundColor(.black)
                            
                        } else {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 50))
                                .foregroundColor(.black)
                                .padding(.horizontal)
                                .onTapGesture {
                                    presentationMode.wrappedValue.dismiss()
                                }
                            
                        }
       
                        
                        Spacer()
                        
                        if isHidden {
                            
                       
                            Link(destination: URL(string: "tel://14244075941")!) {
                                        Image(systemName: "phone")
                                            .resizable()
                                            .frame(width: 25, height: 25)
                                            .foregroundColor(.black)
                                    }

                        
                            Button(action: {
                                        // Use the URL scheme to open the messaging app with a pre-made message
                                        let message = "Hey, how's my order looking?"
                                        let urlString = "sms://14244075941&body=\(message)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
                                        if let url = URL(string: urlString) {
                                            UIApplication.shared.open(url)
                                        }
                                    }) {
                                        Image(systemName: "message")
                                            .resizable()
                                            .frame(width: 25, height: 25)
                                            .padding(.horizontal, 15)
                                            .foregroundColor(.black)
                                            .padding(.horizontal)
                                    }
                        
                        }
                        
                    }
                    
                    if !isHidden {
                        
                        VStack {
                            
                            
                            Form {
                                Section(header: Text("Deliver to"))
                                {
                                    TextField("Delivery details", text: $location)
                                    TextField("Phone number", text: $phone)
                                }
                                
                                
                                Section
                                {
                                    
                                    HStack {
                                        Image(itemImage)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 60, height: 60)
                                            .clipped()
                                            .cornerRadius(10)
                                        
                                        VStack{
                                            
                                            HStack{
                                                Text(itemName)
                                                    .font(.custom("Uber Move Bold", size: 16))
                                                Spacer()
                                            }
                                            HStack{
                                                Text(itemDescription)
                                                    .font(.custom("Uber Move Medium", size: 12))
                                                Spacer()
                                            }
                                            
                                            
                                            
                                        }
                                        
                                        Spacer()
                                        
                                        VStack{
                                            Text(itemPrice)
                                                .font(.custom("Uber Move Bold", size: 18))
                                        }
                                    }
                                    
                                }
                                
                                Section {
                                    VStack(spacing: 10){
                                        HStack{
                                            Text(selectedSide.count > 3 ? "Subtotal w/ side" : "Subtotal")
                                            Spacer()
                                            Text(selectedSide.count > 3 ? "$\(String(format: "%.2f", (Double(itemPrice.replacingOccurrences(of: "$", with: "", options: .literal, range: nil)) ?? 0) + 1.25))" : itemPrice)
                                            
                                            
                                        }
                                        .padding(.vertical,2)
                                        .padding(.top, 8)
                                        HStack{
                                            Text("Delivery fee")
                                            Spacer()
                                            Text("$2.50")
                                        } .padding(.vertical,2)
                                        HStack{
                                            Text("Taxes")
                                            Spacer()
                                            Text("$0.99")
                                        } .padding(.vertical,2)
                                        HStack{
                                            Text("Service fee")
                                            Spacer()
                                            Text("$0.40")
                                        }
                                        Divider()
                                        
                                        
                                        
                                        HStack {
                                            Text("Total")
                                            Spacer()
                                            Text(String(format: "$%.2f", selectedSide.count > 3 ? total + 1.25 : total))
                                        }
                                        .padding(.bottom, 8)
                                        .font(.custom("Uber Move Bold", size: 16))
                                    }
                                    .font(.custom("Uber Move Medium", size: 16))
                                }
                                
                                
                                
                                
                                
                                
                                
                            }
                            
                            .frame(width: UIScreen.main.bounds.width)
                            
                            
                            VStack {
                                
                                if backendModel.paymentIntentParams != nil {
                                    
                                    PaymentButton() {
                                        
                                        applePayPrice = String(format: "%.2f", selectedSide.count > 3 ? total + 1.25 : total)
                                        applePayModel.pay(clientSecret: backendModel.paymentIntentParams?.clientSecret)
                                    
                                    }
                                    .padding(.horizontal)
                                } else {
                                    ProgressView()
                                }
                                if let paymentStatus = applePayModel.paymentStatus {
                                    HStack {
                                        switch paymentStatus {
                                        case .success:
                                            
                                            
                                            
                                            
                                            Image(systemName: "checkmark.circle.fill").foregroundColor(.green)
                                            Text("Payment complete!")
                                                .onAppear {
                                                    
                                                  
                                                    presentationMode.wrappedValue.dismiss()
                                                    savedItemName = itemName
                                                    savedItemDescription = itemDescription
                                                    itemSubtotal = itemPrice
                                                    savedItemImage = itemImage
                                                    savedItemTotalPrice = String(format: "%.2f", selectedSide.count > 3 ? total + 1.25 : total)
                                                    
                                                    isHidden = true
                                                    makeAPICall()
                                                    selectedSide = ""
                                                    selectedDrink = ""
                                                    applePayPrice = ""
                                                }
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                        case .error:
                                            Image(systemName: "xmark.octagon.fill").foregroundColor(.red)
                                            Text("Payment failed!")
                                        case .userCancellation:
                                            Image(systemName: "xmark.octagon.fill").foregroundColor(.orange)
                                            Text("Payment canceled.")
                                        @unknown default:
                                            Text("Unknown status")
                                        }
                                    }
                                }
                            }
                            .ignoresSafeArea(.keyboard)
                            .onAppear {
                                if (!StripeAPI.deviceSupportsApplePay()) {
                                    print("Apple Pay is not supported on this device.")
                                } else {
                                    backendModel.preparePaymentIntent(paymentMethodType: "card", currency: "usd")
                                }
                            }
                            
                            
                        }
                        
                    } else {
                        
                        VStack {
                            
                            Form {
                                Section(header: Text("Delivering to"))
                                {
                                    Text(location)
                                        .font(.custom("Uber Move Medium", size: 16))
                                    Text(phone)
                                        .font(.custom("Uber Move Medium", size: 16))
                                    
                                }
                                .listRowBackground(Color.clear)
                                
                                Section
                                {
                                    
                                    HStack {
                                        Image(savedItemImage)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 60, height: 60)
                                            .clipped()
                                            .cornerRadius(10)
                                        
                                        VStack{
                                            
                                            HStack{
                                                Text(savedItemName)
                                                    .font(.custom("Uber Move Bold", size: 16))
                                                Spacer()
                                            }
                                            HStack{
                                                Text(savedItemDescription)
                                                    .font(.custom("Uber Move Medium", size: 12))
                                                Spacer()
                                            }
                                            
                                            
                                            
                                        }
                                        
                                        Spacer()
                                        
                                        VStack{
                                            Text(itemSubtotal)
                                                .font(.custom("Uber Move Bold", size: 18))
                                        }
                                    }
                                    
                                }
                                
//                                Section {
//                                    VStack(spacing: 10){
//                                        HStack{
//                                            Text(selectedSide.count > 3 ? "Subtotal w/ side" : "Subtotal")
//                                            Spacer()
//                                            Text(selectedSide.count > 3 ? "$\(String(format: "%.2f", (Double(itemPrice.replacingOccurrences(of: "$", with: "", options: .literal, range: nil)) ?? 0) + 1.25))" : itemSubtotal)
//                                            
//                                            
//                                        }
//                                        .padding(.vertical,2)
//                                        .padding(.top, 8)
//                                        
//                                        
//                                        
//                                        HStack {
//                                            Text("You paid")
//                                            Spacer()
//                                            Text(selectedSide.count > 3 ? "$\(String(format: "%.2f", (Double(itemSubtotal.replacingOccurrences(of: "$", with: "", options: .literal, range: nil)) ?? 0) +  0.99 + 2.50 + 0.40 + 1.25))" : "$\(String(format: "%.2f", (Double(itemSubtotal.replacingOccurrences(of: "$", with: "", options: .literal, range: nil)) ?? 0) +  0.99 + 2.50 + 0.40))")
//                                           
//                                            
////                                            Text(savedItemTotalPrice)
//                                        }
//                                        .padding(.bottom, 8)
//                                        .font(.custom("Uber Move Bold", size: 16))
//                                    }
//                                    .font(.custom("Uber Move Medium", size: 16))
//                                }
                                
                                Section {
                                    VStack(spacing: 10) {
                                        HStack{
                                            Text("Estimated time")
                                                .font(.custom("Uber Move Bold", size: 20))
                                            
                                            
                                            Spacer()
                                        }
                                        
                                        
                                        HStack{
                                            Text(callTimeFunction.currentTimePlus20 + " – " + callTimeFunction.currentTimePlus40)
                                                .font(.custom("Uber Move Medium", size: 32))
                                            
                                            
                                            Spacer()
                                        }
                                        
                                      
                                            
                                          
                                            
                                            
                                        
                                        
                                    }
                                    
                                }
                                .listRowBackground(Color.clear)
                                
                                
                                
                                
                                
                            }
                            Spacer()
                            
                            VStack {
                                
                                Button(action: {
                                   
                                    presentationMode.wrappedValue.dismiss()
                                    isHidden = false
                                
                                }) {
                                    
                                    Text("Received Order")
                                        .frame(width: UIScreen.main.bounds.width * 0.81, height: 24)
                                        .padding()
                                        .background(Color.black)
                                        .foregroundColor(Color.white)
                                        .font(.custom("Uber Move Bold", size: 23))
                                        .cornerRadius(14)
                                }
                                
                                .padding(.horizontal)
                                
                                HStack{
                                    Text("Only one order at a time allowed until March 1st")
                                        .foregroundColor(.gray.opacity(0.9))
                                        .font(.custom("Uber Move Medium", size: 13))
                                    
                                    
                                    
                                }
                                
                                
                                
                                
                            }
                        }
                        
                        
                        
                        
                    }
                    
                    
                    
                }
                .background(Color.gray.opacity(0.1))
                .navigationBarBackButtonHidden(true)
                
                
                
                
                
                
            }
                .onAppear {
                                 
                    savedItemTotalPrice = String(format: "%.2f", selectedSide.count > 3 ? total + 1.25 : total)
                    
                    setAmount()
                               }
            
            
            
        }
        
        .navigationBarHidden(true)
    }
}

#Preview {
    CheckOut(itemName: "Name Placeholder", itemPrice: "$12.99", itemDescription: "Description smaple", itemImage: "fettucine")
}
