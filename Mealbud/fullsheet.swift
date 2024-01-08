//
//  fullsheet.swift
//  Mealbud
//
//  Created by Edvin Molla on 1/4/24.
//

import SwiftUI

struct fullsheet: View {
    
    @State var showSheet: Bool = false
    
    var body: some View {
        ZStack {
            Color.green
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            Button("click"){
                showSheet.toggle()
            }
            .fullScreenCover(isPresented: $showSheet, content: {
                SecondScreen()
            })
        }
    }
}

struct SecondScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.red
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            Button("dismiss") {
                presentationMode.wrappedValue.dismiss()
            }
          
        }
    }
}

#Preview {
    fullsheet()
}
