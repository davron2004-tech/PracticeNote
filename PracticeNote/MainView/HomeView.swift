//
//  HomeView.swift
//  PracticeNote
//
//  Created by Asror Aliqulov on 06/10/23.
//

import SwiftUI
import SwiftData
struct HomeView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \SubjectDataModel.date, order: .reverse) private var subjects:[SubjectDataModel]
    var body: some View {
        NavigationStack {
            ZStack{
                Color("BackgroundColor")
                    .ignoresSafeArea()
                GeometryReader{geo in
                    if(subjects.count == 0){
                        VStack{
                            Spacer()
                            HStack{
                                Spacer()
                                Text("No subjects")
                                    .foregroundStyle(.secondary)
                                    .font(.system(size:25))
                                    .multilineTextAlignment(.center)
                                Spacer()
                            }
                            
                            Spacer()
                        }
                        
                    }
                    else{
                        List{
                            ForEach(subjects) { subject in
                                Section("") {
                                    HStack(){
                                        ZStack{
                                            NavigationLink{
                                                SubjectView(subject:subject)
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
                                            
                                        }
                                    }
                                }
                                .listRowBackground(Color("ListRow"))
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
            
        }
        
    }
}
#Preview {
    HomeView()
}

