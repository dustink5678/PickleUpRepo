//
//  TextArea.swift
//  TwitterSwiftUI
//
//  Created by Dustin King on 7/25/24.
//

import SwiftUI

struct TextArea: View {
    @Binding var text: String
    let placeholder: String

    init(_ placeholder: String, text: Binding<String>) {
        self.placeholder = placeholder
        self._text = text
        UITextView.appearance().backgroundColor = .clear
    }

    var body: some View {
        ZStack(alignment: .topLeading) {
            TextEditor(text: $text)
                .padding(.horizontal, 4)
                .padding(.vertical, 8)
                .font(.body)
            
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color(.placeholderText))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
                    .font(.body)
                    .allowsHitTesting(false)
                    .offset(y:5)
            }
        }
        // Removed the overlay with RoundedRectangle
    }
}

#Preview {
   NewTweetView()
}
