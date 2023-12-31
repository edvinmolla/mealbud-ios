//
//  MenuOptionsList.swift
//  Mealbud
//
//  Created by Edvin Molla on 12/30/23.
//

import SwiftUI

struct MenuOptionsList: View {
    
    @Binding var sselectedOption: MenuBarOptions
    @Binding var currentOption: MenuBarOptions
    @Namespace var animation
    
    var body: some View {
    
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30) {
                    ForEach(MenuBarOptions.allCases, id: \.self) { item in
                        
                        VStack {
                            Text(item.title)
                                .foregroundColor(item == currentOption ? .black : .gray)
                            
                            
                            if currentOption == item {
                                Capsule()
                                    .fill(.black)
                                    .matchedGeometryEffect(id: "item", in: animation)
                                    .frame(height: 3)
                                    .padding(.horizontal, -10)
                            } else {
                                Capsule()
                                    .fill(.clear)
                                    .frame(height: 3)
                                    .padding(.horizontal, -10)
                            }
                        }
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                self.sselectedOption = item
                                proxy.scrollTo(item, anchor: .topTrailing)

                            }
                        }
                    }
                    .onChange(of: currentOption) { _ in
                        proxy.scrollTo(currentOption, anchor: .topTrailing)
                    }
                }
            }
        }
        
    }
}

#Preview {
    MenuOptionsList(sselectedOption: .constant(.japanese), currentOption: .constant(.japanese))
}
