//
//  TwitterSwiftUIApp.swift
//  TwitterSwiftUI
//
//  Created by Dustin King on 7/24/24.
//

import SwiftUI
import Firebase

@main
struct TwitterSwiftUIApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                LoginView()
            }
        }
    }
}
