//
//  CustomTabBar.swift
//  TestProject0105
//
//  Created by Federico on 01/05/2022.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case house
    case message
    case leaf
    case person
  
}

struct CustomTabBar: View {
    @Binding var selectedTab: Tab
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
   
    
    
    var body: some View {
        VStack {
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    Image(systemName: selectedTab == tab ? fillImage : tab.rawValue)
//                        .scaleEffect(tab == selectedTab ? 1.25 : 1.0)
                        .foregroundColor(.black)
                        .font(.system(size: 23))
                        .onTapGesture {
                            selectedTab = tab
                        }
                    Spacer()
                }
            }
            .frame(width: nil, height: 50)
            .background(.thinMaterial)
           
            
        }
    }
}



struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant(.house))
    }
}
