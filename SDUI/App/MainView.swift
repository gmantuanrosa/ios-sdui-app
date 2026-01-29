//
//  MainView.swift
//  SDUI
//
//  Created by Gian Carlo Mantuan Dala Rosa on 20/01/26.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            GenericTabView(
                title: "Home",
                items: HomeConfig.mockResponse()
            ) { item in
                HomeConfig.view(for: item)
            }
            .tabItem { Label("Home", systemImage: "house") }
            
            GenericTabView(
                title: "Profile",
                items: ProfileConfig.mockResponse()
            ) { item in
                ProfileConfig.view(for: item)
            }
            .tabItem { Label("Profile", systemImage: "person") }
        }
    }
}

#Preview {
    MainView()
}
