//
//  LessonView.swift
//  PracticeNote
//
//  Created by Asror Aliqulov on 08/10/23.
//

import SwiftUI
enum CurrentView:String{
    case notes = "notes"
    case images = "images"
    case cards = "cards"
}
struct LessonView: View {
    
    @Bindable var lesson:LessonDataModel
    @State private var temporaryText:String = ""
            
    @State  var selectedView:CurrentView = .notes
    
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
            else if (selectedView == .cards){
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink{
                        TranslatorView(lesson:lesson)
                    }label: {
                        Image(systemName: "plus")
                            .foregroundStyle(Color(.label))
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


