//
//  ProfileView.swift
//  TwitterSwiftUI
//
//  Created by Dustin King on 7/24/24.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedFilter: TweetFilterViewModel = .tweets
    @Environment(\.presentationMode) var mode
    @Namespace var animation
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack(alignment: .leading) {
            headerView
            actionButtons
            userInfoDetails
            tweetFilterBar
            tweetsView
            Spacer()
        }
    }
}

#Preview {
    ProfileView()
}

extension ProfileView {
    var headerView: some View {
        ZStack(alignment: .bottomLeading) {
            LinearGradient(
                gradient: Gradient(colors: [.orange, .purple]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .foregroundColor(.white)
            .clipShape(RoundedShape(corners: .bottomRight))
            .ignoresSafeArea()
            
            VStack {
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.clear)
                        .offset(x: 11, y: 12)
                }
                
                Circle()
                    .fill(Gradient(colors: [.green, .purple]))
                    .frame(width: 72, height: 72)
                    .offset(x: 16, y: 36)
            }
        }
        .frame(height: 100)
    }
    
    var actionButtons: some View {
        HStack(spacing: 12) {
            Button {
                // Action for bell button
            } label: {
                Spacer()
                Image(systemName: "bell.badge")
                    .font(.title3)
                    .padding(6)
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.purple, .orange],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .background(
                        Circle() // Create a circle for the background
                            .stroke(
                                LinearGradient(
                                    gradient: Gradient(colors: [.orange, .purple]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                lineWidth: 2 // Adjust this value to change the border thickness
                            )
                    )
            }
            
            Button {
                // Action for edit profile button
            } label: {
                Text("Edit Profile")
                    .font(.subheadline).bold()
                    .frame(width: 120, height: 32)
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.purple, .orange],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .background(
                        Capsule() // Create a circle for the background
                            .stroke(
                                LinearGradient(
                                    gradient: Gradient(colors: [.purple, .orange]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                lineWidth: 2 // Adjust this value to change the border thickness
                            )
                    )
            }
        }
        .padding(.trailing)
    }
    
    var userInfoDetails: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text("Heath Ledger")
                    .font(.title2).bold()
                    .foregroundColor(textColor)
                
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
            }
            Text("@joker")
                .font(.subheadline)
                .foregroundColor(subtextColor)
            Text("Your moms favorite villain")
                .font(.subheadline)
                .padding(.vertical)
                .foregroundColor(subtextColor)
            HStack(spacing: 24) {
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                    Text("Gotham, NY")
                }
                HStack {
                    Image(systemName: "link")
                    Text("www.thejoker.com")
                }
            }
            .font(.caption)
            .foregroundColor(subtextColor)
            
            UserStatsView()
                .padding(.vertical)
        }
        .padding(.horizontal)
    }
    
    var tweetFilterBar: some View {
        HStack {
            ForEach(TweetFilterViewModel.allCases, id: \.rawValue) { item in
                VStack {
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == item ? .semibold : .regular)
                        .foregroundColor(selectedFilter == item ? .black : .gray)
                    
                    if selectedFilter == item {
                        Capsule()
                            .foregroundColor(Color(.systemBlue))
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    } else {
                        Capsule()
                            .foregroundColor(Color.clear)
                            .frame(height: 3)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedFilter = item
                    }
                }
            }
        }
        .overlay(Divider().offset(x: 0, y: 16))
    }
    
    var tweetsView: some View {
        ScrollView {
            LazyVStack {
                ForEach(0 ... 9, id: \.self) { _ in
                    TweetRowView()
                        .padding()
                }
            }
        }
    }
    
    var buttonIconColor: Color {
        colorScheme == .dark ? Color.white : Color.black
    }
    
    var buttonTextColor: Color {
        colorScheme == .dark ? Color.white : Color.black
    }
    
    var buttonBorderColor: Color {
        colorScheme == .dark ? Color.white.opacity(0.5) : Color.gray
    }
    
    var textColor: Color {
        colorScheme == .dark ? Color.white : Color.black
    }
    
    var subtextColor: Color {
        colorScheme == .dark ? Color.white.opacity(0.7) : Color.gray
    }
}
