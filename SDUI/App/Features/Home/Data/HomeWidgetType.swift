//
//  HomeWidgetType.swift
//  SDUI
//
//  Created by Gian Carlo Mantuan Dala Rosa on 20/01/26.
//

/// The registry of available components for the Home screen.
///
/// The raw value represents the string expected in the JSON response (e.g., "banner").
enum HomeWidgetType: String, WidgetType {
    case banner
    case action
    case unknown
    
    /// Defines a fallback layout if the Home API fails entirely.
    static var fallback: [WidgetItem<HomeWidgetType>] {
        [
            WidgetItem(
                id: "fallback",
                type: .action,
                position: 1,
                source: ""
            )
        ]
    }
    
    // Custom decoder ensures that unknown strings don't crash the app,
    // but instead default to `.unknown`.
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try? container.decode(String.self)
        
        self = HomeWidgetType(rawValue: string ?? "") ?? .unknown
    }
}
