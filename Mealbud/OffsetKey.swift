//
//  OffsetKey.swift
//  Mealbud
//
//  Created by Edvin Molla on 12/30/23.
//

import SwiftUI

struct OffsetKey: PreferenceKey {
    static var defaultValue: CGRect = .zero
    
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}
