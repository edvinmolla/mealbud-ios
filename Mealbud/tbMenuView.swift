//
//  MenuView.swift
//  Mealbud
//
//  Created by Edvin Molla on 12/30/23.
//

import SwiftUI

struct tbMenuView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedOption: tbMenuBarOptions = .combos
    @State private var currentOption: tbMenuBarOptions = .combos
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                HStack(spacing: 10) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "arrow.left.circle.fill")
                            .font(.system(size: 27))
                    }
                    
                    Text("Taco Bell at UCLA")
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                 
                }
                .padding(.horizontal)
                .foregroundColor(.black)
                
                
                
                
                // menu options bar
                tbMenuOptionsList(sselectedOption: $selectedOption, currentOption: $currentOption)
                    .padding([.top, .horizontal])
                    .overlay(
                        Divider()
                            .padding(.horizontal, -16)
                        , alignment: .bottom
                    )
                
                
                ScrollViewReader {proxy in
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        VStack {
                            ForEach(tbMenuBarOptions.allCases, id: \.self) { option in
                                tbMenuItemSection(option: option, currentOption: $currentOption)
                                
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
            .padding(.top, 20)
        }.navigationBarHidden(true)
    }
    
}

#Preview {
    tbMenuView()
}
