//
//  TwitterSwiftUIApp.swift
//  TwitterSwiftUI
//
//  Created by Dustin King on 7/24/24.
//

// THIS IS ANOTHER TEST FOR DUSTY BUNS


import SwiftUI
import Firebase

@main
struct TwitterSwiftUIApp: App {
    
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView()
            }
            .environmentObject(viewModel)
        }
    }
}
