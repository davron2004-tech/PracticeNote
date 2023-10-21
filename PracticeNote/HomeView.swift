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
    var subjects:[SubjectDataModel]
    @State var isAddSubjectView = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(subjects) { subject in
                    
                    NavigationLink {
                        SubjectView(subject: subject)
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
                    isAddSubjectView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $isAddSubjectView) {
                SubjectFormView(isShoiwngSubjectFormView: $isAddSubjectView)
                    .presentationDetents([.medium])
                    .presentationDragIndicator(.visible)
            }
        }
    }
}


