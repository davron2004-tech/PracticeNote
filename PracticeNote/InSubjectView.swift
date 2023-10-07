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
    @State var folderName = ""
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
                if let folders = subject.folders {
                    Section("Folders") {
                        ForEach(folders, id: \.self) { folder in
                            Text(folder)
                        }
                    }
                }
                if let lessons = subject.lessons {
                    Section("Lessons") {
                        ForEach(lessons, id: \.self) { lesson in
                            Text(lesson)
                        }
                    }
                }
            }
            .navigationTitle("Add Folder")
            .sheet(isPresented: $isAddingFolder, content: {
                Form(content: {
                    TextField("Folder name", text: $folderName)
                        .presentationDetents([.medium])
                        .presentationDragIndicator(.visible)
                })
            })
        }
    }
}

#Preview {
    InSubjectView(subject: SubjectDataModel(subjectName: "KOrean", emoji: "🗿"))
}
