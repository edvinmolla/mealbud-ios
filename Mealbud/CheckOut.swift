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
    var selectedSide: String
    var selectedDrink: String
    
    var body: some View {
        
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
                                    Text("$24.23")
                                        .font(.custom("Uber Move Bold", size: 18))
                                }
                            }
                            
                        }
                        
                        Section {
                            VStack(spacing: 10){
                                HStack{
                                    Text("Subtotal")
                                    Spacer()
                                    Text(itemPrice)
                                }
                                .padding(.vertical,2)
                                .padding(.top, 8)
                                HStack{
                                    Text("Delivery")
                                    Spacer()
                                    Text("$24")
                                } .padding(.vertical,2)
                                HStack{
                                    Text("Tax")
                                    Spacer()
                                    Text("$24")
                                } .padding(.vertical,2)
                                HStack{
                                    Text("Service")
                                    Spacer()
                                    Text("$24")
                                }
                                Divider()
                                HStack{
                                    Text("Total")
                                    Spacer()
                                    Text("$24")
                                }
                                .padding(.bottom, 8)
                                .font(.custom("Uber Move Bold", size: 16))
                            }
                            .font(.custom("Uber Move Medium", size: 16))
                        }
                        
                        
                        
                        
                        
                        
                        
                        
                    }
                    
                    .frame(width: UIScreen.main.bounds.width)
                    
                    
                   
                    
                    
                }
                .background(Color.gray.opacity(0.1))
                .navigationBarBackButtonHidden(true)
                
                
                VStack {
                    if backendModel.paymentIntentParams != nil {
                        
                        PaymentButton() {
                            applePayModel.pay(clientSecret: backendModel.paymentIntentParams?.clientSecret)
                            
                        }
                        .padding(.horizontal, 20)
                        
                        
                        
                    } else {
                        ProgressView()
                    }
                    if let paymentStatus = applePayModel.paymentStatus {
                        HStack {
                            switch paymentStatus {
                            case .success:
                                
                                
                                Image(systemName: "checkmark.circle.fill").foregroundColor(.green)
                                Text("Payment complete!")
                                
                                
                               
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
                .onAppear {
                    if (!StripeAPI.deviceSupportsApplePay()) {
                        print("Apple Pay is not supported on this device.")
                    } else {
                        backendModel.preparePaymentIntent(paymentMethodType: "card", currency: "usd")
                    }
                }
                
                
                
            }
            
        }
        
    }
}

//#Preview {
//    CheckOut()
//}
