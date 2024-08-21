//
//  ContentView.swift
//  TwitterSwiftUI
//
//  Created by Dustin King on 7/24/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu = false
    @EnvironmentObject var viewModel : AuthViewModel
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        Group {
            // no user logged in
            if viewModel.userSession == nil {
                LoginView()
            } else {
                // have a logged in user
                mainInterfaceView
            }
        }
    }
}

// Allows a view with the Authentication View Model
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AuthViewModel()
        NavigationView {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}

extension ContentView {
    
    var mainInterfaceView: some View {
        ZStack(alignment: .topLeading){
            MainTabView()
                .navigationBarHidden(showMenu)
            
            if showMenu{
                ZStack{
                    Color(.black)
                        .opacity(showMenu ? 0.25 : 0.0)
                }.onTapGesture {
                    withAnimation(.easeInOut){
                        showMenu = false
                    }
                }
                .ignoresSafeArea()
            }
            
            SideMenuView()
                .frame(width: 300)
                .offset(x: showMenu ? 0 : -300, y: 0)
                .background(showMenu ? menuBackgroundColor : Color.clear)
        }
        .navigationTitle("PickleUp")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading){
                Button{
                    withAnimation(.easeInOut){
                        showMenu.toggle()
                    }
                } label: {
                    Circle()
                        .fill(Gradient(colors: [.green, .purple]))
                        .frame(width:32, height: 32)
                }
            }
        }
        .onAppear{
            showMenu = false
        }
    }
    var menuBackgroundColor: Color {
        colorScheme == .dark ? Color.black : Color.white
    }
}
