//
//  tutorial.swift
//  Mealbud
//
//  Created by Edvin Molla on 1/4/24.
//

import SwiftUI

struct tutorial: View {
    
    @State var placeHolderText = "I'm plaeholder"
    
    var body: some View {
        
        VStack {
            
            Text("\(placeHolderText)")
            
            Button("man says") {placeHolderText = "hahaha"}
            
            CustomButton1(text: $placeHolderText)
  
        }
        
        
    }
}

struct CustomButton1: View {
    
    @Binding var text: String

    var body: some View {
        Button("Cat says") {text = "Meow"}
    }
}



#Preview {
    tutorial()
}
