//
//  ContentView.swift
//  TwitterSwiftUI
//
//  Created by Dustin King on 7/24/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu = false
    var body: some View {
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
                .offset(x: showMenu ? 0: -300, y: 0)
                .background(showMenu ? Color.white : Color.clear)
        }
        .navigationTitle("Home")
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
}

#Preview {
    NavigationView{
        ContentView()
    }
}
