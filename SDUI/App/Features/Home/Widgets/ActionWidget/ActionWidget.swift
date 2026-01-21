//
//  ActionWidget.swift
//  SDUI
//
//  Created by Gian Carlo Mantuan Dala Rosa on 20/01/26.
//

import SwiftUI

struct ActionWidget: View {
    let source: String
        
    @State
    private var actions: [String]?

    init(source: String) {
        self.source = source
        
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
                        default: ["Action 1", "Action 2", "Action 3"]
                    )
                )
                .skeleton(isLoading: isLoading)
            }
        )
    }
}
