//
//  CheckOut.swift
//  Mealbud
//
//  Created by Edvin Molla on 1/4/24.
//

import SwiftUI
import Stripe

struct CheckOut: View {
    
    @State private var location = ""
    @State private var phone = ""
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var backendModel = BackendModel()
    @StateObject var applePayModel = ApplePayModel()

    var itemName: String
    var itemPrice: String
    var itemDescription: String
    var itemImage: String
    
    @AppStorage("selectedSide") var selectedSide = ""
    @AppStorage("selectedDrink") var selectedDrink = ""
    @AppStorage("applePayPrice") var applePayPrice = ""
    
    
    var body: some View {
        
        let subtotal = Double(itemPrice.replacingOccurrences(of: "$", with: "", options: .literal, range: nil)) ?? 0
        let delivery = 2.00
        let tax = 0.00
        let service = 0.35
        let total = subtotal + delivery + tax + service
        
        NavigationView {
            
            VStack{
                
                
                
                VStack{
                    HStack {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 50))
                            .foregroundColor(.black)
                            .padding(.horizontal)
                            .onTapGesture {
                                presentationMode.wrappedValue.dismiss()
                            }
                        Spacer()
                    }
                    
                    Form {
                        Section(header: Text("Deliver to"))
                        {
                            TextField("Office/Delivery location", text: $location)
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
                                    Text("Delivery")
                                    Spacer()
                                    Text("$2.00")
                                } .padding(.vertical,2)
                                HStack{
                                    Text("Tax")
                                    Spacer()
                                    Text("$0.00")
                                } .padding(.vertical,2)
                                HStack{
                                    Text("Service")
                                    Spacer()
                                    Text("$0.35")
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
                                applePayPrice = String(format: "%.2f", total)
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
                .background(Color.gray.opacity(0.1))
                .navigationBarBackButtonHidden(true)
                
                
                
               
                

            }
            
            
        }
        
    }
}

#Preview {
    CheckOut(itemName: "ad", itemPrice: "ads", itemDescription: "ads", itemImage: "ads")
}
