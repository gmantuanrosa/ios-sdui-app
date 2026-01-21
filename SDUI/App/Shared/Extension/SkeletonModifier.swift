//
//  SkeletonModifier.swift
//  SDUI
//
//  Created by Gian Carlo Mantuan Dala Rosa on 20/01/26.
//

import SwiftUI

struct SkeletonModifier: ViewModifier {
    let isLoading: Bool
    
    func body(content: Content) -> some View {
        content
            .redacted(reason: isLoading ? .placeholder : [])
            .opacity(isLoading ? 0.5 : 1.0)
            .animation(.easeInOut, value: isLoading)
    }
}

extension Optional {
    func or(skeleton: Bool, default value: Wrapped) -> Wrapped {
        if skeleton { return value }
        
        return self ?? value
    }
}

extension View {
    func skeleton(isLoading: Bool) -> some View {
        modifier(SkeletonModifier(isLoading: isLoading))
    }
}
