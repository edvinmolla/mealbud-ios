//
//  OffsetModifier.swift
//  Mealbud
//
//  Created by Edvin Molla on 12/30/23.
//

import Foundation
import SwiftUI

struct tbOffsetModifier: ViewModifier {
    
    let option: tbMenuBarOptions
    @Binding var currentOption: tbMenuBarOptions
    
    func body(content: Content) -> some View {
        content
            .overlay(
                
                GeometryReader{ proxy in
            
                    Color.clear
                        .preference(key: OffsetKey.self, value:proxy.frame(in: .named("scroll")))
                    
                }
            )
            .onPreferenceChange(OffsetKey.self) { proxy in
                let offset = proxy.minY
                withAnimation {
                    currentOption = (offset < 20 && -offset < (proxy.midX / 2) && currentOption != option)
                    ? option : currentOption
                }
            }
    }
}
