//
//  LoginView.swift
//  TwitterSwiftUI
//
//  Created by Dustin King on 7/28/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel : AuthViewModel
    var body: some View {
        VStack{
            AuthenticationHeaderView(title1: "Hello,", title2: "Welcome Back")
            VStack(spacing:40){
                CustomInputFields(imageName:"envelope", placeholderText: "Email", text: $email)
                CustomInputFields(imageName:"lock", placeholderText: "Password", isSecureField: true, text: $password)
            }
            .padding(.horizontal,32)
            .padding(.top,44)
            
            HStack{
                Spacer()
                NavigationLink{
                    Text("Reset password view..")
                } label : {
                    Text("Forgot Password?")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(Color(.systemBlue))
                        .padding(.top)
                        .padding(.trailing,24)
                                         
                }
            }
            
            Button{
                viewModel.login(withEmail: email, password: password)
            } label: {
                Text("Sign In")
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
            
            NavigationLink{
                RegistrationView()
                    .navigationBarHidden(true)
            } label: {
                HStack{
                    Text("Don't have an account?")
                        .font(.footnote)
                    Text("Sign Up")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom,32)
            .foregroundColor(Color(.systemBlue))
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

#Preview {
    LoginView()
}
