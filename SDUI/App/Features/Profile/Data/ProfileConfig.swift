//
//  ProfileConfig.swift
//  SDUI
//
//  Created by Gian Carlo Mantuan Dala Rosa on 20/01/26.
//

import SwiftUI

class ProfileConfig {
    static func registry() -> WidgetRegistry<ProfileWidgetType> {
        let registry = WidgetRegistry<ProfileWidgetType>()
        
        registry.register(type: .userInfo) { item in
            AnyView(UserInfoWidget(source: item.source))
        }
        
        registry.register(type: .banner) { item in
            AnyView(BannerWidget(source: item.source))
        }
        
        registry.register(type: .graph) { item in
            AnyView(GraphWidget(source: item.source))
        }
        
        return registry
    }
    

    static func mockResponse() -> [WidgetItem<ProfileWidgetType>] {
        let data: [WidgetItem<ProfileWidgetType>] = [
            WidgetItem(id: "10", type: .userInfo, position: 0, source: "/v1/user/123"),
            WidgetItem(id: "11", type: .banner, position: 1, source: "v1/user/membership_status"),
            WidgetItem(id: "12", type: .graph, position: 2, source: "/v1/user/graph")
        ]
        
        return data.sorted()
    }
}
