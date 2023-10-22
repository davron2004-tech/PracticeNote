//
//  LessonView.swift
//  PracticeNote
//
//  Created by Asror Aliqulov on 08/10/23.
//

import SwiftUI

struct LessonView: View {
    @Bindable var lesson:LessonDataModel
    var body: some View {
        NavigationStack {
            TabView {
                NoteView(lesson: lesson)
                    .tabItem { Label("Note", systemImage: "pencil.line") }
                ImagesView(lesson: lesson)
                    .tabItem { Label("Images", systemImage: "photo.stack") }
                CardsView(lesson:lesson)
                    .tabItem { Label("Vocabs", systemImage: "list.clipboard.fill") }
            }
            .navigationTitle(lesson.lessonName)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


