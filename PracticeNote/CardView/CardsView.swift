//
//  CardsView.swift
//  PracticeNote
//
//  Created by Davron Abdukhakimov on 13/10/23.
//

import SwiftUI
struct CardsView: View {
    
    
    @Bindable var lesson:LessonDataModel
    
    var body: some View {
        NavigationStack{
            ScrollView(.horizontal) {
                HStack{
                    ForEach(lesson.cards,id:\.self){card in
                        CardView(card:card)
                    }
                }
                .frame(minHeight: 0, maxHeight: .greatestFiniteMagnitude)
            }
            VStack{
                NavigationLink{
                    TranslatorView(lesson: lesson)
                } label: {
                    Text("Create New Card")
                }
                .buttonStyle(.borderedProminent)
            }
        }
    }
}

