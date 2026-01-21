//
//  BannerView.swift
//  SDUI
//
//  Created by Gian Carlo Mantuan Dala Rosa on 20/01/26.
//

import SwiftUI

struct BannerView: View {
    let data: BannerResponse
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            // Dynamic Icon
            Image(systemName: data.variant.iconName)
                .font(.title2)
                .foregroundStyle(data.variant.tintColor)
            
            VStack(alignment: .leading, spacing: 4) {
                // Content
                Text(data.title)
                    .font(.headline)
                    .foregroundStyle(Color.primary)
                
                Text(data.message)
                    .font(.subheadline)
                    .foregroundStyle(Color.secondary)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        // Dynamic Background
        .background(data.variant.backgroundColor)
        .cornerRadius(12)
        // Dynamic Border
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(data.variant.tintColor.opacity(0.3), lineWidth: 1)
        )
    }
}

#Preview {
    BannerView(
        data: .init(
            title: "Preview Title",
            message: "Preview Message",
            variant: .info
        )
    )
}
