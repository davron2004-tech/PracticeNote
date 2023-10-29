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
    private var sortedLessons:[LessonDataModel]{
        subject.lessons.sorted(by: {
            $0.date > $1.date
        })
    }
    @State private var isAddingLesson = false
    var body: some View {
        
        NavigationStack {
            ZStack{
                Color("BackgroundColor")
                    .ignoresSafeArea()
                if(sortedLessons.count == 0){
                    VStack{
                        Spacer()
                        HStack{
                            Spacer()
                            Text("No lessons")
                                .foregroundStyle(.secondary)
                                .font(.system(size:25))
                                .multilineTextAlignment(.center)
                            Spacer()
                        }
                        
                        Spacer()
                    }
                }
                else{
                    List {
                        ForEach(sortedLessons) { lesson in
                            NavigationLink{
                                LessonView(lesson: lesson)
                            }label: {
                                Text(lesson.lessonName)
                            }
                            .listRowBackground(Color("ListRow"))
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
                    .scrollContentBackground(.hidden)
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
                    .presentationDetents([.medium])
                    .presentationDragIndicator(.visible)
            }
            
        }
        .tint(Color("LabelColor"))
    }
    
}

