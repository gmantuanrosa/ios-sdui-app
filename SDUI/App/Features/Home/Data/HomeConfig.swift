//
//  HomeConfig.swift
//  SDUI
//
//  Created by Gian Carlo Mantuan Dala Rosa on 20/01/26.
//

import SwiftUI

class HomeConfig {
    static func registry() -> WidgetRegistry<HomeWidgetType> {
        let registry = WidgetRegistry<HomeWidgetType>()
        
        registry.register(type: .banner) { item in
            AnyView(BannerWidget(source: item.source))
        }
        
        registry.register(type: .action) { item in
            AnyView(ActionWidget(source: item.source))
        }
        
        return registry
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
