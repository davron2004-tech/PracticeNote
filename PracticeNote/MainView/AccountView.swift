//
//  AccountView.swift
//  PracticeNote
//
//  Created by Asror Aliqulov on 06/10/23.
//

import SwiftUI
import SwiftData
struct AccountView: View {
    @Query private var subjects:[SubjectDataModel]
    @Query private var lessons:[LessonDataModel]
    @State private var wordCount = 0
    @State private var lessonCount = 0
    var body: some View {
        NavigationStack {
            ZStack{
                Color("BackgroundColor")
                    .ignoresSafeArea()
                List {
                    Section {
                        HStack {
                            Text("Subjects:").bold()
                            Spacer()
                            Text("\(subjects.count)")
                        }
                        HStack {
                            Text("Lessons:").bold()
                            Spacer()
                            Text("\(lessonCount)")
                        }
                        HStack {
                            Text("Words:").bold()
                            Spacer()
                            Text("\(wordCount)")
                        }
                    } header: {
                        Text("Stats")
                    }
                    .listRowBackground(Color("ListRow"))
                }
                .scrollContentBackground(.hidden)
            }
        }
        .onAppear{
            wordCount = 0
            lessonCount = 0
            for subject in subjects {
                lessonCount += subject.lessons.count
                for lesson in subject.lessons {
                    wordCount += lesson.cards.count
                }
            }
                
        }
    }
}
