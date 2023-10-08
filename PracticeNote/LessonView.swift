//
//  LessonView.swift
//  PracticeNote
//
//  Created by Asror Aliqulov on 08/10/23.
//

import SwiftUI

struct LessonView: View {
    var body: some View {
        NavigationStack {
            TabView {
                NoteView()
                    .tabItem { Label("Note", systemImage: "pencil.line") }
                ImagesView()
                    .tabItem { Label("Images", systemImage: "photo.stack") }
                VacabulariesView()
                    .tabItem { Label("Vocabs", systemImage: "list.clipboard.fill") }
            }
            .navigationTitle("Lesson Name")
        }
    }
}

#Preview {
    LessonView()
}
