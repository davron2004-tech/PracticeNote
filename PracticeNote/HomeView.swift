//
//  HomeView.swift
//  PracticeNote
//
//  Created by Asror Aliqulov on 06/10/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            List {
                VStack(spacing: 24) {
                    SubjectView()
                    SubjectView()
                    SubjectView()
                    SubjectView()
                    SubjectView()
                    SubjectView()
                }
                .listRowSeparator(.hidden)
            }
            .scrollContentBackground(.hidden)
            .navigationTitle("Subjects")
            .toolbar {
                Button {
                    
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
