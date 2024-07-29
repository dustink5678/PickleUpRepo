//
//  NewTweetView.swift
//  TwitterSwiftUI
//
//  Created by Dustin King on 7/25/24.
//

import SwiftUI

struct NewTweetView: View {
    @State private var caption = ""
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack{
            HStack{
                Button{
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(Color(.systemBlue))
                }
                Spacer()
                
                Button{
                    print("Tweet")
                } label: {
                    Text("Tweet")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [.orange, .purple]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                                    )
                                )
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
            }
            .padding()
            
            HStack(alignment: .top){
                Circle()
                    .fill(Gradient(colors: [.green, .purple]))
                    .frame(width:64, height:64)
                
                TextArea("What's Happening?",  text: $caption)
            }
            .padding()
        }
    }
}
#Preview {
    NewTweetView()
}

