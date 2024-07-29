//
//  SideMenuOptionRowView.swift
//  TwitterSwiftUI
//
//  Created by Dustin King on 7/25/24.
//

import SwiftUI

struct SideMenuOptionRowView: View {
    let viewModel: SideMenuViewModel
    var body: some View {
        HStack(spacing: 20){
            Image(systemName: viewModel.imageName)
                .font(.headline)
                .foregroundColor(.gray)
            Text(viewModel.title)
                .foregroundColor(.black)
                .font(.subheadline)
            Spacer()
        }
        .frame(height:40)
        .padding(.horizontal)
    }
}

#Preview {
    SideMenuOptionRowView(viewModel: .profile)
}
