//
//  ActionWidget.swift
//  SDUI
//
//  Created by Gian Carlo Mantuan Dala Rosa on 20/01/26.
//

import SwiftUI

/// A widget that displays a horizontal list of quick actions (buttons).
///
/// This component demonstrates the "Smart Widget" pattern:
/// 1. It receives a `source` (endpoint).
/// 2. It uses `WidgetShell` to handle the async request.
/// 3. It manages its own loading state locally.
struct ActionWidget: View {
    let source: String
        
    @State
    private var actions: [String]?

    init(source: String) {
        self.source = source
        
        // Simulating a scenario where empty source means we have local default data
        if source.isEmpty {
            _actions = State(initialValue: ["Start Workout", "Log Weight", "Drink Water"])
        }
    }
    
    var body: some View {
        WidgetShell(
            source: source,
            action: { _ in },
            content: { isLoading in
                ActionView(
                    actions: actions.or(
                        skeleton: isLoading,
                        default: ["Action 1", "Action 2", "Action 3"] // Skeleton placeholder data
                    )
                )
                .skeleton(isLoading: isLoading)
            }
        )
    }
}
