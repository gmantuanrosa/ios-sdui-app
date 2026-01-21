//
//  ProfileWidgetType.swift
//  SDUI
//
//  Created by Gian Carlo Mantuan Dala Rosa on 20/01/26.
//

enum ProfileWidgetType: String, WidgetType {
    case userInfo = "user_info"
    case banner
    case graph
    case unknown
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try? container.decode(String.self)
        
        self = ProfileWidgetType(rawValue: string ?? "") ?? .unknown
    }
}
