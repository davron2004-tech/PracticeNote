//
//  SubjectFormView.swift
//  PracticeNote
//
//  Created by Davron Abdukhakimov on 07/10/23.
//

import SwiftUI
import SwiftData
struct SubjectFormView: View {
    private let emojis = ["🗿","🍎","🔥"]
    @Environment(\.modelContext) var context
    @Binding var isShoiwngSubjectFormView:Bool
    @State private var subjectName: String = ""
    @State private var emoji: String = "🗿"
    var body: some View {
        NavigationStack {
            ZStack{
                Color("BackgroundColor")
                    .ignoresSafeArea()
                Form {
                    TextField("Subject Name", text: $subjectName)
                        .listRowBackground(Color("ListRow"))
                    Picker("Emoji", selection: $emoji) {
                        ForEach(emojis,id: \.self) { emoji in
                            Text(emoji)
                        }
                        
                    }
                    .listRowBackground(Color("ListRow"))
                    .listRowSeparator(.hidden)
                }
                
                .scrollContentBackground(.hidden)
            }
            
            .navigationTitle("Add New Subject")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button{
                        isShoiwngSubjectFormView = false
                    } label: {
                        Text("Cancel")
                            .foregroundStyle(.red)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button{
                        context.insert(SubjectDataModel(subjectName: subjectName, emoji: emoji, date: Date()))
                        isShoiwngSubjectFormView = false
                    } label: {
                        Text("Save")
                            .foregroundStyle(.blue)
                    }
                }
            }
        }
    }
}

#Preview{
    SubjectFormView(isShoiwngSubjectFormView: .constant(true))
}
