//
//  MainTabView.swift
//  TwitterSwiftUI
//
//  Created by Dustin King on 7/24/24.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex = 0
    var body: some View {
        TabView(selection: $selectedIndex) {
            FeedView()
                .onTapGesture{
                    self.selectedIndex = 0
                }
                .tabItem{
                    Image(systemName: "house")
                }.tag(0)
            
            ExploreView()
                .onTapGesture{
                    self.selectedIndex = 1
                }
                .tabItem{
                    Image(systemName: "magnifyingglass")
                }.tag(1)
            
            NotificationsView()
                .onTapGesture{
                    self.selectedIndex = 2
                }
                .tabItem{
                    Image(systemName: "bell")
                }.tag(2)
            
            MessagesView()
                .onTapGesture{
                    self.selectedIndex = 3
                }
                .tabItem{
                    Image(systemName: "envelope")
                }.tag(3)
            
            
            //Future Self Develop
            
            
            ProfileView()
                .onTapGesture{
                    self.selectedIndex = 4
                }
                .tabItem{
                    Image(systemName: "person")
                }.tag(4)
        }
    }
}

#Preview {
    MainTabView()
}
