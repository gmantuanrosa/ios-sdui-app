//
//  GenericTabView.swift
//  SDUI
//
//  Created by Gian Carlo Mantuan Dala Rosa on 20/01/26.
//

import SwiftUI

struct GenericTabView<T: WidgetType, Content: View>: View {
    let title: String
    let view: (WidgetItem<T>) -> Content
    let items: [WidgetItem<T>]
    
    init(
        title: String,
        items: [WidgetItem<T>],
        @ViewBuilder view: @escaping (WidgetItem<T>) -> Content
    ) {
        self.title = title
        self.items = items
        self.view = view
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
