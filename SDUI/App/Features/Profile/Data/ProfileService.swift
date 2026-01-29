//
//  ProfileService.swift
//  SDUI
//
//  Created by Gian Carlo Mantuan Dala Rosa on 29/01/26.
//

import Foundation

/// Mock service providing the Structure (Layout) of the Profile screen.
///
/// In a real application, this would fetch a JSON array defining:
/// - Which widgets to show (UserInfo, Graph, Banner)
/// - What order to show them in (position)
/// - Where the widgets should fetch their specific data (source)
class ProfileService {
    static func mockResponse() -> [WidgetItem<ProfileWidgetType>] {
        let data: [WidgetItem<ProfileWidgetType>] = [
            WidgetItem(id: "10", type: .userInfo, position: 1, source: "/v1/user/123"),
            WidgetItem(id: "11", type: .banner, position: 0, source: "v1/user/membership_status"),
            WidgetItem(id: "12", type: .graph, position: 2, source: "/v1/user/graph")
        ]
        
        return data.sorted()
    }
}
