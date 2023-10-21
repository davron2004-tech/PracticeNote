//
//  InSubjectView.swift
//  PracticeNote
//
//  Created by Asror Aliqulov on 07/10/23.
//

import SwiftUI

struct SubjectView: View {
    var subject: SubjectDataModel
    @State var isAddingLesson = false
    @State var lessonName = ""
    var body: some View {
        NavigationStack {
            List {
                ForEach(subject.lessons) { lesson in
                    NavigationLink{
                        LessonView(lesson: lesson)
                    }label: {
                        Text(lesson.lessonName)
                    }
                }
            }
            .navigationTitle("\(subject.subjectName)")
            .toolbar {
                Button {
                    isAddingLesson = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $isAddingLesson){
                LessonFormView(isShowingLessonForm: $isAddingLesson,subject: subject)
            }
        }
        
    }
}

