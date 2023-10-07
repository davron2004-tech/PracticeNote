//
//  SubjectFormView.swift
//  PracticeNote
//
//  Created by Davron Abdukhakimov on 07/10/23.
//

import SwiftUI
let emojis = ["🗿","🍎","🔥"]
struct SubjectFormView: View {
    @State var subjectName:String
    @State var emoji:String
    var body: some View {
        Form{
            HStack {
                TextField("Subject Name", text: $subjectName)
                    
                Picker("Emoji", selection: $emoji) {
                    ForEach(emojis,id: \.self) { emoji in
                        Text(emoji)
                    }
                }
            }
        }
    }
}

#Preview{
    SubjectFormView(subjectName: "rrr",emoji: "🗿")
}
