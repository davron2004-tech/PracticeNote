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
    var body: some View {
        NavigationStack {
            List{
                ForEach(subjects) { subject in
                    Section("") {
                        ZStack{
                            NavigationLink{
                                SubjectView(subject: subject)
                            }label: {
                                EmptyView()
                            }
                            .opacity(0.0)
                            HStack (){
                                Text(subject.emoji)
                                    .font(.title2)
                                Text(subject.subjectName)
                                    .font(.title2)
                                Spacer()
                            }
                            .tint(Color.white)
                            .frame(height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                        }
                        .listRowBackground(Color.orange)
                    }
                }
                .onDelete{ indexSet in
                    indexSet.forEach { i in
                        context.delete(subjects[i])
                    }
                }
                .listRowSeparator(.hidden)
            }
            .listSectionSpacing(0)
            .scrollContentBackground(.hidden)
            .navigationTitle("Subjects")
            
        }
    }
}


