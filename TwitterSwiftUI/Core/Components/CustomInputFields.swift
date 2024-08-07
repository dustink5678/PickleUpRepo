//
//  CustomInputFields.swift
//  TwitterSwiftUI
//
//  Created by Dustin King on 7/28/24.
//

import SwiftUI

struct CustomInputFields: View {
    let imageName: String
    let placeholderText: String
    var isSecureField: Bool? = false
    @Binding var text: String
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width:20,height:20)
                    .foregroundColor(Color(.gray))
                
                if isSecureField ?? false {
                    SecureField(placeholderText, text: $text)
                } else {
                    TextField(placeholderText,text: $text)
                }
            }
            Divider()
                .background(Color(.gray))
        }
    }
}

#Preview {
    CustomInputFields(imageName: "envelope",
                      placeholderText: "Email",
                      isSecureField: false,
                      text: .constant(""))
}
