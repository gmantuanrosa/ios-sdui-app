//
//  BannerVariant.swift
//  SDUI
//
//  Created by Gian Carlo Mantuan Dala Rosa on 20/01/26.
//

import SwiftUI

enum BannerVariant: String, Codable, Sendable {
    case info
    case warning
    case halloween
    
    var backgroundColor: Color {
        switch self {
        case .info: return Color.blue.opacity(0.1)
        case .warning: return Color.red.opacity(0.1)
        case .halloween: return Color.orange.opacity(0.2)
        }
    }
    
    var tintColor: Color {
        switch self {
        case .info: return .blue
        case .warning: return .red
        case .halloween: return .orange
        }
    }
    
    var iconName: String {
        switch self {
        case .info: return "info.circle.fill"
        case .warning: return "exclamationmark.triangle.fill"
        case .halloween: return "waveform.path.ecg"
        }
    }
}
