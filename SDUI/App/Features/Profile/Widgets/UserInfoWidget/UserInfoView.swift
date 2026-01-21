//
//  UserInfoView.swift
//  SDUI
//
//  Created by Gian Carlo Mantuan Dala Rosa on 20/01/26.
//

import SwiftUI

struct UserInfoView: View {
    let user: UserProfile
    
    var body: some View {
        HStack(spacing: 16) {
            // Avatar
            Circle()
                .fill(Color.gray.opacity(0.3))
                .frame(width: 60, height: 60)
                .overlay(
                    Text(String(user.name.prefix(1)))
                        .font(.title2).bold()
                        .foregroundStyle(.secondary)
                )
            
            // Text Info
            VStack(alignment: .leading, spacing: 4) {
                Text(user.name)
                    .font(.title2)
                    .bold()
                
                Text(user.email)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

#Preview {
    UserInfoView(
        user: UserProfile(
            name: "John Doe", 
            email: "email@email.com"
        )
    )
}
