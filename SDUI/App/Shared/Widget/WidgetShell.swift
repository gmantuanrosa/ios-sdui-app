//
//  WidgetShell.swift
//  SDUI
//
//  Created by Gian Carlo Mantuan Dala Rosa on 20/01/26.
//

import SwiftUI

/// A container view responsible for the "Server" part of Server Driven UI.
///
/// This view handles the lifecycle of fetching data for a specific widget.
/// It manages the loading state and triggers the provided asynchronous action
/// when the view appears.
struct WidgetShell<Content: View>: View {
    /// The source URL or identifier for the data to be fetched.
    let source: String
    
    /// The asynchronous function to execute (usually an API call).
    /// - Parameter: The `source` string provided during initialization.
    let action: @MainActor (String) async -> Void
    
    /// A closure that produces the content view, receiving the current loading state.
    @ViewBuilder
    let content: (Bool) -> Content
    
    @State
    private var isLoading: Bool
    
    /// - Parameters:
    ///   - source: The endpoint or ID to fetch data from.
    ///   - action: The work to perform (e.g., `ViewModel.fetchData`).
    ///   - content: The view to display, which can react to `isLoading`.
    init(
        source: String,
        action: @escaping @MainActor (String) async -> Void,
        content: @escaping (Bool) -> Content
    ) {
        self.source = source
        self.action = action
        self.content = content
        
        // If there is no source to fetch, we are not "loading".
        _isLoading = State(initialValue: !source.isEmpty)
    }
    
    var body: some View {
        Group {
            content(isLoading)
        }
        .task {
            guard !source.isEmpty else { return }
            
            // `defer` ensures isLoading is set to false even if the action throws or returns early.
            defer { withAnimation { isLoading = false } }
            
            await action(source)
        }
    }
}
