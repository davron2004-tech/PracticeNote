//
//  CardsView.swift
//  PracticeNote
//
//  Created by Davron Abdukhakimov on 13/10/23.
//

import SwiftUI
struct CardsView: View {
    
    
    @Bindable var lesson:LessonDataModel
    var sortedCards:[CardDataModel]{
        lesson.cards.sorted(by: { card1, card2 in
            card1.date > card2.date
        })
    }
    var body: some View {
        NavigationStack{
            ZStack{
                Color("BackgroundColor")
                    .ignoresSafeArea()
                VStack{
                    ScrollView(.horizontal) {
                        HStack(spacing: 10){
                            ForEach(sortedCards,id:\.self){card in
                                CardView(lesson: lesson, card:card)
                            }
                        }
                        .frame(minHeight: 0, maxHeight: .greatestFiniteMagnitude)
                    }
                }
            }
            
        }
    }
}

