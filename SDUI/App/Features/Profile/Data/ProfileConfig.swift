//
//  ProfileConfig.swift
//  SDUI
//
//  Created by Gian Carlo Mantuan Dala Rosa on 20/01/26.
//

import SwiftUI

class ProfileConfig {
    @MainActor
    @ViewBuilder
    static func view(for item: WidgetItem<ProfileWidgetType>) -> some View {
        switch item.type {
        case .banner:
            BannerWidget(source: item.source)
            
        case .graph:
            GraphWidget(source: item.source)
            
        case .userInfo:
            UserInfoWidget(source: item.source)
            
        case .unknown:
            EmptyView()
        }
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
