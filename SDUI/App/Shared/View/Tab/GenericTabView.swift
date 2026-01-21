//
//  GenericTabView.swift
//  SDUI
//
//  Created by Gian Carlo Mantuan Dala Rosa on 20/01/26.
//

import SwiftUI

struct GenericTabView<T: WidgetType>: View {
    let title: String
    let registry: WidgetRegistry<T>
    let items: [WidgetItem<T>]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(items) { item in
                        registry.view(for: item)
                    }
                }
                .padding()
            }
            .navigationTitle(title)
        }
    }
}
