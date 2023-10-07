//
//  SubjectFormView.swift
//  PracticeNote
//
//  Created by Davron Abdukhakimov on 07/10/23.
//

import SwiftUI
let emojis = ["🗿","🍎","🔥"]
struct SubjectFormView: View {
    @State var subjectName: String = ""
    @State var emoji: String = ""
    var body: some View {
        NavigationStack {
            Form {
                TextField("Subject Name", text: $subjectName)
                
                Picker("Emoji", selection: $emoji) {
                    ForEach(emojis,id: \.self) { emoji in
                        Text(emoji)
                    }
                }
                
            }
            .navigationTitle("Add New Subject")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button{} label: {
                        Text("Cancel")
                            .foregroundStyle(.red)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button{} label: {
                        Text("Save")
                            .foregroundStyle(.blue)
                    }
                }
            }
        }
    }
}

#Preview{
    SubjectFormView()
}
