//
//  UserRowView.swift
//  TwitterSwiftUI
//
//  Created by Dustin King on 7/24/24.
//

import SwiftUI

struct UserRowView: View {
    var body: some View {
        HStack(spacing: 12){
            Circle()
                .fill(Gradient(colors: [.yellow, .black]))
                .frame(width:40, height: 40)
            
            VStack(alignment: .leading, spacing: 4){
                Text("batman")
                    .font(.subheadline).bold()
                    .foregroundColor(.black)
                
                Text("Bruce Wayne")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
    }
}

#Preview {
    UserRowView()
}
