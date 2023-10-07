//
//  PracticeNoteApp.swift
//  PracticeNote
//
//  Created by Asror Aliqulov on 06/10/23.
//

import SwiftUI
import SwiftData
@main
struct PracticeNoteApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                
        }
        .modelContainer(for: [SubjectDataModel.self,FolderDataModel.self,LessonDataModel.self,NoteDataModel.self,CardDataModel.self])
    }
}
