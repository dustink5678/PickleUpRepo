//
//  ProfilePhotoSelectorView.swift
//  TwitterSwiftUI
//
//  Created by Dustin King on 8/8/24.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    var body: some View {
        VStack{
            AuthenticationHeaderView(title1: "Setup account", title2: "Add a profile photo")
            Spacer()
            Button{
                print("Pick image here...")
            }label: {
                Image(systemName: "camera.circle")
                    .resizable()
                    .scaledToFill()
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.purple, .orange],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .frame(width:180, height:180)

            }
            Text("Select Here")
                .font(.largeTitle)
                .bold()
                .foregroundStyle(
                    LinearGradient(
                        colors: [.orange, .purple],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
            Spacer()
            Spacer()
        }
        .ignoresSafeArea()
    }
}

struct ProfilePhotoSelectorView_Preview: PreviewProvider {
    static var previews: some View {
        let viewModel = AuthViewModel()
        NavigationView {
            ProfilePhotoSelectorView()
                .environmentObject(viewModel)
        }
    }
}
