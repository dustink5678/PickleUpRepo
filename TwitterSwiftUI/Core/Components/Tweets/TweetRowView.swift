//
//  TweetRowView.swift
//  TwitterSwiftUI
//
//  Created by Dustin King on 7/24/24.
//

import SwiftUI

struct TweetRowView: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            //Profle image + user info + tweet
            HStack(alignment: .top, spacing: 12){
                Circle()
                    .fill(Gradient(colors: [.yellow, .black]))
                    .frame(width: 56, height: 56)
                
                // user info and tweet caption
                VStack(alignment: .leading, spacing: 4) {
                    HStack{
                        Text("Bruce Wayne")
                            .font(.subheadline).bold()
                        Text("@batman")
                            .foregroundColor(.gray)
                            .font(.caption)
                        Text("2w")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    
                    //tweet
                    Text("I believe in Harvey Dent")
                        .font(.subheadline)
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                }
            }
            //Action  Button
            HStack{
                Button{
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                Spacer()
                Button{
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }
                Spacer()
                Button{
                } label: {
                    Image(systemName: "heart")
                        .font(.subheadline)
                }
                Spacer()
                Button{
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
            }
            .padding()
            .foregroundColor(.gray)
            Divider()
        }
    }
}

#Preview {
    TweetRowView()
}
