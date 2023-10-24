//
//  InSubjectView.swift
//  PracticeNote
//
//  Created by Asror Aliqulov on 07/10/23.
//

import SwiftUI
import SwiftData

struct SubjectView: View {
    @Environment(\.modelContext) var context
    var subject: SubjectDataModel
    var sortedLessons:[LessonDataModel]{
        subject.lessons.sorted(by: {
            $0.date > $1.date
        })
    }
    @State var isAddingLesson = false
    @State var lessonName = ""
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(sortedLessons) { lesson in
                    NavigationLink{
                        LessonView(lesson: lesson)
                    }label: {
                        Text(lesson.lessonName)
                    }
                }
                .onDelete{ indexSet in
                    var order = 0
                    for lesson in subject.lessons{
                        if lesson == sortedLessons[indexSet.first!]{
                            break
                        }
                        else{
                            order += 1
                        }
                    }
                    subject.lessons.remove(at:order)
                    do{
                        try context.save()
                    }
                    catch{
                        
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
                LessonFormView(isShowingLessonForm: $isAddingLesson, subject: subject)
            }
            
        }  
    }
    
}

