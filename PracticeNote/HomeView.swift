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
    var body: some View {
        NavigationStack {
            List(subjects) {subject in
                VStack(spacing: 24) {
                    SubjectView(subject: subject)
                }
                .listRowSeparator(.hidden)
                
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
