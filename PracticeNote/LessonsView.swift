//
//  LessonsView.swift
//  PracticeNote
//
//  Created by Davron Abdukhakimov on 08/10/23.
//

import SwiftUI

struct LessonsView: View {
    var folder: FolderDataModel
    @State var isAddingLesson = false
    @State var lessonName = ""
    var body: some View {
        NavigationStack {
            List {
                HStack(alignment: .center) {
                    Button {
                        isAddingLesson = true
                    } label: {
                        Text("Add Lesson")
                    }
                }
                .buttonStyle(.borderedProminent)
                if (!folder.lessons.isEmpty) {
                    Section("Lessons") {
                        ForEach(folder.lessons) { lesson in
                            Text(lesson.lessonName)
                        }
                    }
                }
            }
            .navigationTitle("\(folder.folderName)")
            .sheet(isPresented: $isAddingLesson){
                LessonFormView(isShowingLessonForm: $isAddingLesson,folder: folder)
                    .presentationDetents([.medium])
            }
        }
        
    }
}


