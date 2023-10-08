//
//  InSubjectView.swift
//  PracticeNote
//
//  Created by Asror Aliqulov on 07/10/23.
//

import SwiftUI

struct InSubjectView: View {
    var subject: SubjectDataModel
    @State var isAddingFolder = false
    @State var isAddingLesson = false
    @Binding var isShowingInSubjectView:Bool
    @State var lessonName = ""
    var body: some View {
        NavigationStack {
            List {
                HStack(alignment: .center) {
                    Button {
                        isAddingFolder = true
                    } label: {
                        Text("Add Folder")
                    }
                    Button {
                        isAddingLesson = true
                    } label: {
                        Text("Add Lesson")
                    }
                }
                .buttonStyle(.borderedProminent)
                if (!subject.folders.isEmpty) {
                    Section("Folders") {
                        ForEach(subject.folders) { folder in
                            NavigationLink{
                                LessonsView(folder: folder)
                            } label: {
                                Text(folder.folderName)
                            }
                            
                        }
                        
                    }
                }
                if (!subject.lessons.isEmpty) {
                    Section("Lessons") {
                        ForEach(subject.lessons) { lesson in
                            Text(lesson.lessonName)
                        }
                    }
                }
            }
            .navigationTitle("\(subject.subjectName)")
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button{
                        isShowingInSubjectView = false
                    } label: {
                        Text("Subjects")
                            .foregroundStyle(.blue)
                            .underline()
                    }
                }
            }
            .sheet(isPresented: $isAddingFolder) {
                FolderFormView(isShowingFolderForm: $isAddingFolder,subject:subject)
                    .presentationDetents([.medium])
            }
            .sheet(isPresented: $isAddingLesson){
                LessonFormView(isShowingLessonForm: $isAddingLesson,subject: subject)
                    .presentationDetents([.medium])
            }
        }
        
    }
}

#Preview {
    InSubjectView(subject: SubjectDataModel(subjectName: "KOrean", emoji: "🗿"), isShowingInSubjectView: .constant(true))
}
