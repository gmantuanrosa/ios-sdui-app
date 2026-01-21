//
//  HomeWidgetType.swift
//  SDUI
//
//  Created by Gian Carlo Mantuan Dala Rosa on 20/01/26.
//

enum HomeWidgetType: String, WidgetType {
    case banner
    case action
    case unknown
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try? container.decode(String.self)
        
        self = HomeWidgetType(rawValue: string ?? "") ?? .unknown
    }
}
