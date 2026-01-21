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
                registry: HomeConfig.registry(),
                items: HomeConfig.mockResponse()
            )
            .tabItem { Label("Home", systemImage: "house") }
            
            GenericTabView(
                title: "Profile",
                registry: ProfileConfig.registry(),
                items: ProfileConfig.mockResponse()
            )
            .tabItem { Label("Profile", systemImage: "person") }
        }
    }
}

#Preview {
    MainView()
}
