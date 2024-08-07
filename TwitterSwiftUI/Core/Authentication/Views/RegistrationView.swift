//
//  RegistrationView.swift
//  TwitterSwiftUI
//
//  Created by Dustin King on 7/28/24.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel : AuthViewModel
    var body: some View {
        VStack{
            AuthenticationHeaderView(title1: "Get started", title2: "Create your account")
            
            VStack(spacing:40){
                CustomInputFields(imageName:"envelope", placeholderText: "Email", text: $email)
                CustomInputFields(imageName:"person.text.rectangle", placeholderText: "Username", text: $username)
                CustomInputFields(imageName:"person", placeholderText: "Full Name", text: $fullname)
                CustomInputFields(imageName:"lock", placeholderText: "Password", isSecureField: true, text: $password)
            }
            .padding(32)
            
            Button{
                viewModel.register(withEmail: email, 
                                   password: password, 
                                   fullname: fullname,
                                   username: username)
            } label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width:340, height:50)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [.orange, .purple]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                                )
                            )
                    .clipShape(Capsule())
                    .padding()
                
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x:0, y:0)
            Spacer()
            
            Button{
                presentationMode.wrappedValue.dismiss()
            } label:{
                HStack{
                    Text("Already have an account?")
                        .font(.footnote)
                    Text("Sign In")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom,32)
            .foregroundColor(Color(.systemBlue))
        }
        .ignoresSafeArea()
    }
}

#Preview {
    RegistrationView()
}
