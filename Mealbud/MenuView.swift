//
//  MenuView.swift
//  Mealbud
//
//  Created by Edvin Molla on 12/30/23.
//

import SwiftUI

struct MenuView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedOption: MenuBarOptions = .japanese
    @State private var currentOption: MenuBarOptions = .japanese
    
    var body: some View {
        
        VStack {
            HStack(spacing: 16) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .font(.title2)
                }
                
                Text("Miami - South Beach")
                    .font(.title3)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                }
            }
            .padding(.horizontal)
            .foregroundColor(.black)
            
            
            
            
            // menu options bar
            MenuOptionsList(sselectedOption: $selectedOption, currentOption: $currentOption)
                .padding([.top, .horizontal])
                .overlay(
                    Divider()
                        .padding(.horizontal, -16)
                    , alignment: .bottom
                    )
            
            ScrollViewReader {proxy in
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        ForEach(MenuBarOptions.allCases, id: \.self) { option in
                            MenuItemSection(option: option, currentOption: $currentOption)
                            
                        }
                    }
                    .onChange(of: selectedOption, perform: { _ in
                        withAnimation(.easeInOut) {
                            proxy.scrollTo(selectedOption, anchor: .topTrailing)
                        }
                    })
                    .padding(.horizontal)

                }
                .coordinateSpace(name: "scroll")
                	
            }
        }
        .navigationBarHidden(true)
        .padding(.top, 20)
    }
    
}

#Preview {
    MenuView()
}
