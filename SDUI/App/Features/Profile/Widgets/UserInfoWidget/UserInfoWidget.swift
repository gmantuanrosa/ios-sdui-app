//
//  UserInfoWidget.swift
//  SDUI
//
//  Created by Gian Carlo Mantuan Dala Rosa on 20/01/26.
//

import SwiftUI

struct UserInfoWidget: View {
    let source: String
    
    @State
    private var user: UserProfile?
    
    var body: some View {
        WidgetShell(
            source: source,
            action: { url in
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                user = UserProfile(name: "John Doe", email: "johndoe@email.com")
            },
            content: { isLoading in
                UserInfoView(
                    user: user.or(
                        skeleton: isLoading, 
                        default: UserProfile(
                            name: "Loading Name Template",
                            email: "loading.email@template.com"
                        )
                    )
                )
                .skeleton(isLoading: isLoading)
            }
        )
    }
}
