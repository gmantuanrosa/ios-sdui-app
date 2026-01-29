//
//  SkeletonModifier.swift
//  SDUI
//
//  Created by Gian Carlo Mantuan Dala Rosa on 20/01/26.
//

import SwiftUI

/// A view modifier that applies a "shimmer" or placeholder effect
/// when the data is currently loading.
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
    /// A helper to provide specific logic for optional values in a skeleton state.
    ///
    /// If the view is in `skeleton` mode, this returns the `value` (mock data) immediately
    /// to ensure the redacted view has the correct shape/size.
    func or(skeleton: Bool, default value: Wrapped) -> Wrapped {
        if skeleton { return value }
        
        return self ?? value
    }
}

extension View {
    /// Applies the standard Skeleton loading effect.
    func skeleton(isLoading: Bool) -> some View {
        modifier(SkeletonModifier(isLoading: isLoading))
    }
}
