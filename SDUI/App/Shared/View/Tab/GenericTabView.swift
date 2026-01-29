//
//  GenericTabView.swift
//  SDUI
//
//  Created by Gian Carlo Mantuan Dala Rosa on 20/01/26.
//

import SwiftUI

/// A reusable list view that renders a stack of Server Driven UI widgets.
///
/// This view is agnostic to the specific type of widgets it displays, relying on
/// a `WidgetType` generic and a ViewBuilder closure to delegate the actual rendering.
struct GenericTabView<T: WidgetType, Content: View>: View {
    let title: String
    let view: (WidgetItem<T>) -> Content
    let items: [WidgetItem<T>]
    
    /// - Parameters:
    ///   - title: The navigation title for this screen.
    ///   - items: The list of `WidgetItem` models to render.
    ///   - view: A factory closure that transforms a `WidgetItem` into a specific SwiftUI View.
    init(
        title: String,
        items: [WidgetItem<T>],
        @ViewBuilder view: @escaping (WidgetItem<T>) -> Content
    ) {
        self.title = title
        self.view = view
        
        // Automatically use the fallback configuration if the provided list is empty.
        if items.isEmpty {
            self.items = T.fallback
        } else {
            self.items = items
        }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(items, id: \.id) { item in
                        view(item)
                    }
                }
                .padding()
            }
            .navigationTitle(title)
        }
    }
}
