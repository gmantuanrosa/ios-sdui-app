//
//  GraphView.swift
//  SDUI
//
//  Created by Gian Carlo Mantuan Dala Rosa on 20/01/26.
//

import SwiftUI

struct GraphView: View {
    let data: [Double]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Weekly Activity")
                .font(.caption)
                .foregroundStyle(.secondary)
            
            HStack(alignment: .bottom, spacing: 8) {
                ForEach(data.indices, id: \.self) { i in
                    Rectangle()
                        .fill(Color.orange)
                        .frame(height: data[i])
                }
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(12)
    }
}

#Preview {
    GraphView(data: [1.0, 2.0, 3.0, 4.0, 5.0])
}
