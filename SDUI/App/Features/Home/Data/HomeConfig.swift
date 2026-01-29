//
//  HomeConfig.swift
//  SDUI
//
//  Created by Gian Carlo Mantuan Dala Rosa on 20/01/26.
//

import SwiftUI

class HomeConfig {
    @MainActor
    @ViewBuilder
    static func view(for item: WidgetItem<HomeWidgetType>) -> some View {
        switch item.type {
        case .banner:
            BannerWidget(source: item.source)
            
        case .action:
            ActionWidget(source: item.source)
            
        case .unknown:
            EmptyView()
        }
    }
    
    static func mockResponse() -> [WidgetItem<HomeWidgetType>] {
        let data: [WidgetItem<HomeWidgetType>] = [
            WidgetItem(id: "1", type: .banner, position: 0, source: "v1/banner/halloween"),
            WidgetItem(id: "2", type: .action, position: 1, source: ""),
            WidgetItem(id: "3", type: .unknown, position: 2, source: "")
        ]
        
        return data.sorted()
    }
}
