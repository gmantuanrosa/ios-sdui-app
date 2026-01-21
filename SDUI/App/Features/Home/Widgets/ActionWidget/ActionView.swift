//
//  ActionView.swift
//  SDUI
//
//  Created by Gian Carlo Mantuan Dala Rosa on 20/01/26.
//

import SwiftUI

struct ActionView: View {
    let actions: [String]
    
    var body: some View {
        HStack {
            ForEach(actions, id: \.self) { action in
                VStack {
                    Circle()
                        .fill(Color.blue.opacity(0.2))
                        .frame(height: 50)
                    
                    Text(action)
                        .font(.caption)
                        .lineLimit(1)
                }
                .frame(maxWidth: .infinity)
            }
        }
        .padding()
        .background(Color.gray.opacity(0.05))
        .cornerRadius(12)
    }
}

#Preview {
    ActionView(actions: ["Action 1", "Action 2", "Action 3"])
}
