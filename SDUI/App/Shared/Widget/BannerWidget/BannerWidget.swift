//
//  BannerWidget.swift
//  SDUI
//
//  Created by Gian Carlo Mantuan Dala Rosa on 20/01/26.
//

import SwiftUI

struct BannerWidget: View {
    let source: String
    
    @State
    private var data: BannerResponse?
    
    var body: some View {
        WidgetShell(
            source: source,
            action: { url in
                try? await Task.sleep(nanoseconds: 1 * 1_000_000_000)
                
                let response: BannerResponse
                if url.contains("halloween") {
                    response = BannerResponse(
                        title: "Spooky Gains!",
                        message: "Complete 3 workouts to unlock the ghost badge.",
                        variant: .halloween
                    )
                } else if url.contains("membership") {
                    response = BannerResponse(
                        title: "Membership Expiring",
                        message: "Renew now to keep your streak alive!",
                        variant: .warning
                    )
                } else {
                    response = BannerResponse(
                        title: "Welcome",
                        message: "Good to see you again.",
                        variant: .info
                    )
                }
                
                await MainActor.run {
                    self.data = response
                }
            },
            content: { isLoading in
                BannerView(
                    data: data.or(
                        skeleton: isLoading,
                        default: BannerResponse(
                            title: "Loading Title...",
                            message: "Loading Message...",
                            variant: .info
                        )
                    )
                )
                .skeleton(isLoading: isLoading)
            }
        )
    }
}
