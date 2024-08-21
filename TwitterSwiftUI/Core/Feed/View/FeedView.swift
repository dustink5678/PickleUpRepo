//
//  FeedView.swift
//  TwitterSwiftUI
//
//  Created by Dustin King on 7/24/24.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewTweetView = false
    var body: some View {
        
        ZStack (alignment: .bottomTrailing){
            ScrollView{
                LazyVStack{
                    ForEach(0 ... 20, id: \.self) { _ in
                        TweetRowView()
                            .padding()
                    }
                }
            }
            Button{
                showNewTweetView.toggle()
            } label: {
                Image(systemName: "note.text.badge.plus")
                    .resizable()
                    .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                    .frame(width: 45, height: 35)
                    .padding(17)
                    .padding(.trailing,-6)
                    .padding(.bottom,-5)
                    
                    
                 
            }
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [.orange, .purple]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                        )
                    )
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding(.horizontal, 10)
            .padding(.bottom,10)
            .fullScreenCover(isPresented: $showNewTweetView) {
                NewTweetView()
            }
        }
    }
}

#Preview {
    FeedView()
}
