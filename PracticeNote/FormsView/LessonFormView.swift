//
//  LessonFormView.swift
//  PracticeNote
//
//  Created by Davron Abdukhakimov on 07/10/23.
//

import SwiftUI

struct LessonFormView: View {
    @State var lessonName = ""
    @Binding var isShowingLessonForm:Bool
    var folder:FolderDataModel?
    var subject:SubjectDataModel?
    var body: some View {
        NavigationView{
            Form{
                TextField("Lesson name", text: $lessonName)
                    .presentationDetents([.medium])
                    .presentationDragIndicator(.visible)
            }
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button{
                        isShowingLessonForm = false
                    } label: {
                        Text("Cancel")
                            .foregroundStyle(.red)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button{
                        if let realFolder = folder{
                            realFolder.lessons.append(LessonDataModel(lessonName: lessonName))
                        }
                        if let realSubject = subject{
                            realSubject.lessons.append(LessonDataModel(lessonName: lessonName))
                        }
                        
                        isShowingLessonForm = false
                    } label: {
                        Text("Save")
                            .foregroundStyle(.blue)
                    }
                }
            }
        }
    }
}


