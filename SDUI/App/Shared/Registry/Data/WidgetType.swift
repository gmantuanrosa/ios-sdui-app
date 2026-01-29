//
//  WidgetType.swift
//  SDUI
//
//  Created by Gian Carlo Mantuan Dala Rosa on 29/01/26.
//

import Foundation

/// A protocol that defines the distinct types of widgets available in a specific domain (e.g., Home, Profile).
///
/// Conforming types are usually Enums that represent the mapping between the Server's JSON `type` string
/// and the Client's internal representation.
protocol WidgetType: Hashable, Codable {
    /// A safe default case to handle API responses containing widget types
    /// that this version of the app does not yet understand.
    static var unknown: Self { get }
    
    /// A default list of items to render if the server fails or returns empty data.
    static var fallback: [WidgetItem<Self>] { get }
}

extension WidgetType {
    /// Default implementation returns an empty list.
    static var fallback: [WidgetItem<Self>] {
        return []
    }
}
