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
}
