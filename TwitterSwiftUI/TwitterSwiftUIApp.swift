//
//  TwitterSwiftUIApp.swift
//  TwitterSwiftUI
//
//  Created by Dustin King on 7/24/24.
//

import SwiftUI

@main
struct TwitterSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{
                LoginView()
            }
        }
    }
}
