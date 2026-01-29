//
//  WidgetItem.swift
//  SDUI
//
//  Created by Gian Carlo Mantuan Dala Rosa on 20/01/26.
//

import Foundation

/// A generic envelope representing a single UI component driven by the server.
///
/// - Note: `T` represents the domain-specific enum (e.g., `HomeWidgetType`).
struct WidgetItem<T: WidgetType>: Identifiable, Codable, Comparable, Sendable {
    /// Unique identifier for the widget (diffing/lists).
    let id: String
    
    /// The specific type of widget, used to determine which View to render.
    let type: T
    
    /// The sort order priority, allowing the server to dictate the vertical arrangement of views.
    let position: Int
    
    /// A URL or identifier used to fetch data specific to this widget (if the data isn't embedded).
    let source: String
    
    /// Conformance to Comparable allows sorting widgets by their `position` property.
    static func < (lhs: WidgetItem, rhs: WidgetItem) -> Bool {
        return lhs.position < rhs.position
    }
}
