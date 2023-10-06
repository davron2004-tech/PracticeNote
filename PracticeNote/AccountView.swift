//
//  AccountView.swift
//  PracticeNote
//
//  Created by Asror Aliqulov on 06/10/23.
//

import SwiftUI

struct AccountView: View {
    @State var isSheetShowingVocab = false
    var body: some View {
        NavigationStack {
            List {
                Section {
                    HStack {
                        Text("Subjects:").bold()
                        Spacer()
                        Text("1")
                    }
                    HStack {
                        Text("Lessons:").bold()
                        Spacer()
                        Text("12")
                    }
                    HStack {
                        Text("Subjects:").bold()
                        Spacer()
                        Text("120")
                    }
                } header: {
                    Text("Stats")
                }
                Section {
                    Button {
                        isSheetShowingVocab = true
                    } label: {
                        Text("아이")
                            .bold()
                            .foregroundStyle(.red)
                    }
                    Button {
                        isSheetShowingVocab = true
                    } label: {
                        Text("아이")
                            .bold()
                            .foregroundStyle(.green)
                    }
                    Button {
                        isSheetShowingVocab = true
                    } label: {
                        Text("아이")
                            .bold()
                            .foregroundStyle(.red)
                    }
                    Button {
                        isSheetShowingVocab = true
                    } label: {
                        Text("아이")
                            .bold()
                            .foregroundStyle(.green)
                    }
                    Button {
                        isSheetShowingVocab = true
                    } label: {
                        Text("아이")
                            .bold()
                            .foregroundStyle(.red)
                    }
                } header: {
                    Text("Practice History")
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
    }
}

#Preview {
    AccountView()
}
