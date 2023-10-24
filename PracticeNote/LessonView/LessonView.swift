//
//  LessonView.swift
//  PracticeNote
//
//  Created by Asror Aliqulov on 08/10/23.
//

import SwiftUI

struct LessonView: View {
    enum CurrentView{
        case notes
        case images
        case cards
    }
    @Bindable var lesson:LessonDataModel
    @State var temporaryText:String = ""
    @State var selectedView:CurrentView = .notes
    var body: some View {
        NavigationStack {
            TabView (selection:$selectedView){
                NoteView(temporaryText: $temporaryText, lesson: lesson)
                    .tabItem { Label("Note", systemImage: "pencil.line") }
                    .tag(CurrentView.notes)
                ImagesView(lesson: lesson)
                    .tabItem { Label("Images", systemImage: "photo.stack") }
                    .tag(CurrentView.images)
                CardsView(lesson:lesson)
                    .tabItem { Label("Vocabs", systemImage: "list.clipboard.fill") }
                    .tag(CurrentView.cards)
            }
            .navigationTitle(lesson.lessonName)
            .navigationBarTitleDisplayMode(.inline)
        }
        .toolbar{
            if(selectedView == .notes){
                ToolbarItem(placement: .topBarTrailing) {
                    Button{
                        lesson.text = temporaryText
                    }label: {
                        Text("Save")
                    }
                }
            }
        }
        .onAppear{
            if (lesson.text != nil){
                temporaryText = lesson.text!
            }
        }
    }
}


