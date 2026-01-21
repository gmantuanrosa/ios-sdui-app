//
//  GraphWidget.swift
//  SDUI
//
//  Created by Gian Carlo Mantuan Dala Rosa on 20/01/26.
//

import SwiftUI

struct GraphWidget: View {
    let source: String
    
    @State
    private var points: [Double]?
    
    var body: some View {
        WidgetShell(
            source: source,
            action: { url in
                try? await Task.sleep(nanoseconds: 2_000_000_000)
                points = [10, 50, 30, 80, 40, 60]
            },
            content: { isLoading in
                GraphView(
                    data: points.or(
                        skeleton: isLoading,
                        default: [10, 50, 30, 80, 40, 60]
                    )
                )
                .skeleton(isLoading: isLoading)
            }
        )
    }
}
