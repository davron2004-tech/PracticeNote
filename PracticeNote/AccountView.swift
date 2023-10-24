//
//  AccountView.swift
//  PracticeNote
//
//  Created by Asror Aliqulov on 06/10/23.
//

import SwiftUI
import SwiftData
struct AccountView: View {
    @State var isSheetShowingVocab = false
    @Query var subjects:[SubjectDataModel]
    @Query var lessons:[LessonDataModel]
    @State var wordCount = 0
    @State var lessonCount = 0
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
                }
            }
            
            .navigationTitle("Davron")
        }
        .sheet(isPresented: $isSheetShowingVocab){
            VStack {
                HStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "speaker.wave.2")
                    }
                    Text("아이")
                    Spacer()
                }
                Divider()
                HStack {
                    Text("child")
                    Spacer()
                }
                Spacer()
            }
            .font(.title2)
            .bold()
            .padding(.vertical, 32)
            .padding(.horizontal, 24)
            .presentationDetents([.fraction(0.3)])
            .presentationDragIndicator(.visible)
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
//                Section {
//                    Button {
//                        isSheetShowingVocab = true
//                    } label: {
//                        Text("아이")
//                            .bold()
//                            .foregroundStyle(.red)
//                    }
//                    Button {
//                        isSheetShowingVocab = true
//                    } label: {
//                        Text("아이")
//                            .bold()
//                            .foregroundStyle(.green)
//                    }
//                    Button {
//                        isSheetShowingVocab = true
//                    } label: {
//                        Text("아이")
//                            .bold()
//                            .foregroundStyle(.red)
//                    }
//                    Button {
//                        isSheetShowingVocab = true
//                    } label: {
//                        Text("아이")
//                            .bold()
//                            .foregroundStyle(.green)
//                    }
//                    Button {
//                        isSheetShowingVocab = true
//                    } label: {
//                        Text("아이")
//                            .bold()
//                            .foregroundStyle(.red)
//                    }
//                } header: {
//                    Text("Practice History")
//                }
