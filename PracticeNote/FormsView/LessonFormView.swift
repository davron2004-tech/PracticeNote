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
    var subject:SubjectDataModel
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
                        subject.lessons.append(LessonDataModel(lessonName: lessonName, date: Date()))
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


