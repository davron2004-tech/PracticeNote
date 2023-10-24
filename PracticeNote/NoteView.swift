//
//  NoteView.swift
//  PracticeNote
//
//  Created by Asror Aliqulov on 08/10/23.
//

import SwiftUI

struct NoteView: View {
    @Binding var temporaryText: String
    @Bindable var lesson:LessonDataModel
    var body: some View {
        NavigationStack {
            
            TextEditor(text: $temporaryText)
                .padding()
                .scrollContentBackground(.hidden)
                .background(Color("BackgroundColor"))
                
        }
        .onDisappear{
            lesson.text = temporaryText
        }
        
    }
}


