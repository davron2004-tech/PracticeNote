//
//  NoteView.swift
//  PracticeNote
//
//  Created by Asror Aliqulov on 08/10/23.
//

import SwiftUI

struct NoteView: View {
    @State var temporaryText: String = ""
    @Bindable var lesson:LessonDataModel
    var body: some View {
        NavigationStack {
            
            TextEditor(text: $temporaryText)
        }
        .onAppear{
            if (lesson.text != nil){
                temporaryText = lesson.text!
            }
        }
        .onDisappear{
            lesson.text = temporaryText
        }
//        .toolbar{
//            ToolbarItem(placement: .topBarTrailing) {
//                Button{
//                    lesson.text = temporaryText
//                }label: {
//                    Text("Save")
//                        .foregroundStyle(.blue)
//                        .underline()
//                }
//            }
//        }
    }
}


