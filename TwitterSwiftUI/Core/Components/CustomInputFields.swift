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
    @Binding var text: String
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width:20,height:20)
                    .foregroundColor(Color(.gray))
                TextField(placeholderText,text: $text)
            }
            Divider()
                .background(Color(.gray))
        }
    }
}

#Preview {
    CustomInputFields(imageName: "envelope", placeholderText: "Email", text: .constant(""))
}
