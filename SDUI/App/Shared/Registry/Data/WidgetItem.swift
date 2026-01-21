//
//  WidgetItem.swift
//  SDUI
//
//  Created by Gian Carlo Mantuan Dala Rosa on 20/01/26.
//

import Foundation

protocol WidgetType: Hashable, Codable {
    static var unknown: Self { get }
}

struct WidgetItem<T: WidgetType>: Identifiable, Codable, Comparable, Sendable {
    let id: String
    let type: T
    let position: Int
    let source: String
    
    static func < (lhs: WidgetItem, rhs: WidgetItem) -> Bool {
        return lhs.position < rhs.position
    }
}
