//
//  HomeConfig.swift
//  SDUI
//
//  Created by Gian Carlo Mantuan Dala Rosa on 20/01/26.
//

import SwiftUI

/// The View Factory for the "Home" domain.
///
/// This class is responsible for mapping a generic `WidgetItem<HomeWidgetType>`
/// into a concrete SwiftUI view. It acts as a switchboard: reading the `type` enum
/// and initializing the corresponding View component.
class HomeConfig {
    @MainActor
    @ViewBuilder
    static func view(for item: WidgetItem<HomeWidgetType>) -> some View {
        switch item.type {
        case .banner:
            // Ensures the BannerWidget receives the source URL to fetch its specific image/content
            BannerWidget(source: item.source)
            
        case .action:
            ActionWidget(source: item.source)
            
        case .unknown:
            // Safely handle deprecated or future widget types by rendering nothing
            EmptyView()
        }
    }
}
