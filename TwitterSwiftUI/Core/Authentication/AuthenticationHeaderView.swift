//
//  AuthenticationHeader.swift
//  TwitterSwiftUI
//
//  Created by Dustin King on 7/28/24.
//

import SwiftUI

struct AuthenticationHeaderView: View {
    let title1: String
    let title2: String
    var body: some View {
        VStack(alignment: .leading){
            HStack{Spacer()}
            Text(title1)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Text(title2)
                .font(.largeTitle)
                .fontWeight(.semibold)
        }
        .frame(height:260)
        .padding(.leading)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [.orange, .purple]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
                    )
                )
        .foregroundColor(.white)
        .clipShape(RoundedShape(corners: .bottomRight))
    }
}

#Preview {
    AuthenticationHeaderView(title1: "Hello", title2: "Welcome Back")
}
