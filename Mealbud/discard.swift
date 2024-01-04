//
//  discard.swift
//  Mealbud
//
//  Created by Edvin Molla on 1/3/24.
//

import SwiftUI

struct discard: View {
    
    
    @AppStorage("persistedValue") private var placeHolderText: String = "I'm Edvin"
    
    var body: some View {
        
        VStack {
            Text("\(placeHolderText)")
            
            CustomButton1(placeHolderText: $placeHolderText)
            Button("Dog says") {self.placeHolderText = "WOof"}
        }
        
        
    }
}

struct CustomButton1: View {
    
    @Binding var placeHolderText: String
    
    var body: some View {
        
        Button("Cat says") {  self.placeHolderText = "Meow" }
    }
}



#Preview {
    discard()
}
