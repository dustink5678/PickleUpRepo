//
//  MainTabView.swift
//  TwitterSwiftUI
//
//  Created by Dustin King on 7/24/24.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex = 0
    @State private var bounceStates: [Bool] = [false, false, false, false, false]
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedIndex) {
                FeedView()
                    .tag(0)
                
                ExploreView()
                    .tag(1)
                
                NotificationsView()
                    .tag(2)
                
                MessagesView()
                    .tag(3)
                
                ProfileView()
                    .tag(4)
            }
            .onChange(of: selectedIndex) { oldValue, newValue in
                bounceStates[newValue] = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    bounceStates[newValue] = false
                }
            }
            
            VStack {
                Spacer()
                HStack {
                    ForEach(0..<5) { index in
                        Spacer()
                        VStack {
                            Image(systemName: tabIcon(for: index))
                                .foregroundColor(selectedIndex == index ? .orange : .gray)
                                .scaleEffect(bounceStates[index] ? 1.5 : 1.0)
                                .font(.system(size: 22)) // Adjust this value to increase the icon size
                                .animation(.interpolatingSpring(stiffness: 250, damping: 20), value: bounceStates[index])
                                .onTapGesture {
                                    selectedIndex = index
                                }
                            Text(tabTitle(for: index))
                                .foregroundColor(selectedIndex == index ? .orange : .gray)
                                .font(.system(size: 12))
                        }
                        Spacer()
                    }
                }
            }
        }
    }
    
    func tabIcon(for index: Int) -> String {
        switch index {
        case 0: return "house"
        case 1: return "newspaper"
        case 2: return "magnifyingglass"
        case 3: return "message"
        case 4: return "person"
        default: return ""
        }
    }
    
    func tabTitle(for index: Int) -> String {
        switch index {
        case 0: return "Home"
        case 1: return "Explore"
        case 2: return "Games"
        case 3: return "Messages"
        case 4: return "Profile"
        default: return ""
        }
    }
}

#Preview {
    MainTabView()
}



