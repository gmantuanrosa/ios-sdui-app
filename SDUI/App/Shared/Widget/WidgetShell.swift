//
//  WidgetShell.swift
//  SDUI
//
//  Created by Gian Carlo Mantuan Dala Rosa on 20/01/26.
//

import SwiftUI

struct WidgetShell<Content: View>: View {
    let source: String
    let action: @MainActor (String) async -> Void
    
    @ViewBuilder
    let content: (Bool) -> Content
    
    @State
    private var isLoading: Bool
    
    init(
        source: String,
        action: @escaping @MainActor (String) async -> Void,
        content: @escaping (Bool) -> Content
    ) {
        self.source = source
        self.action = action
        self.content = content
        
        _isLoading = State(initialValue: !source.isEmpty)
    }
    
    var body: some View {
        Group {
            content(isLoading)
        }
        .task {
            guard !source.isEmpty else { return }
            
            defer { withAnimation { isLoading = false } }
            
            await action(source)
        }
    }
}
