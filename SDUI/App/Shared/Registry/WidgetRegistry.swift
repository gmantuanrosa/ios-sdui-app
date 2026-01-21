//
//  WidgetRegistry.swift
//  SDUI
//
//  Created by Gian Carlo Mantuan Dala Rosa on 20/01/26.
//

import SwiftUI

@MainActor
final class WidgetRegistry<T: WidgetType> {
    typealias WidgetBuilder = (WidgetItem<T>) -> AnyView
    
    private var builders: [T: WidgetBuilder] = [:]
    
    func register(type: T, builder: @escaping WidgetBuilder) {
        builders[type] = builder
    }
    
    func view(for item: WidgetItem<T>) -> AnyView {
        guard item.type != T.unknown, let builder = builders[item.type] else {
            return AnyView(EmptyView())
        }
        
        return builder(item)
    }
}
