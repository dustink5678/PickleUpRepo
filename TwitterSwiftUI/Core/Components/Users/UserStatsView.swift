//
//  UserStatsView.swift
//  TwitterSwiftUI
//
//  Created by Dustin King on 7/25/24.
//

import SwiftUI

struct UserStatsView: View {
    var body: some View {
        HStack(spacing: 24){
            HStack(spacing:4){
                Text("807").font(.subheadline).bold()
                Text("Following").font(.caption)
                    .foregroundColor(.gray)
            }
            HStack(spacing:4){
                Text("8.9M").font(.subheadline).bold()
                Text("Followers").font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
}

#Preview {
    UserStatsView()
}
