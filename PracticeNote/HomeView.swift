//
//  HomeView.swift
//  PracticeNote
//
//  Created by Asror Aliqulov on 06/10/23.
//

import SwiftUI
import SwiftData
struct HomeView: View {
    @Environment(\.modelContext) var context
    @Query var subjects:[SubjectDataModel]
    @State var isAddSubjectViewShowing = false
    @State var isShowingInSubjectView = false
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(subjects) { subject in
                    //                VStack(spacing: 24) {
                    //                    SubjectView(subject: subject)
                    //                }
                    NavigationLink {
                        InSubjectView(subject: subject)
                    } label: {
                        HStack {
                            Text(subject.emoji)
                                .font(.title2)
                            Text(subject.subjectName)
                                .font(.title2)
                            Spacer()
                            NavigationLink {
                                
                            } label: {
                                Image(systemName: "camera")
                            }
                            
                        }
                        .tint(Color.white)
                        .padding()
                        .frame(height: 60)
                        .background(.orange)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .padding()
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .navigationTitle("Subjects")
            .toolbar {
                Button {
                    isAddSubjectViewShowing = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $isAddSubjectViewShowing) {
                SubjectFormView(isShoiwngSubjectFormView: $isAddSubjectViewShowing)
                    .presentationDetents([.medium])
                    .presentationDragIndicator(.visible)
            }
        }
    }
}

#Preview {
    HomeView()
}
