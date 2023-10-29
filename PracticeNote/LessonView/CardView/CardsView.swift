//
//  CardsView.swift
//  PracticeNote
//
//  Created by Davron Abdukhakimov on 13/10/23.
//

import SwiftUI
enum PracticeMethod{
    case true_false
    case know_dontKnow
}
struct CardsView: View {
    @Bindable var lesson:LessonDataModel
    @State private var practiceMethod:PracticeMethod? = nil
    @State private var isShowingMenu = false
    @Environment(\.verticalSizeClass) var verticalSize
    var opacity: Double{
        return isShowingMenu ? 0.5 : 1.0
    }
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
                    .opacity(opacity)
                if(practiceMethod == nil){
                    ZStack{
                        VStack{
                            if(sortedCards.count == 0){
                                VStack{
                                    Spacer()
                                    HStack{
                                        Spacer()
                                        Text("No cards")
                                            .foregroundStyle(.secondary)
                                            .font(.system(size:25))
                                            .multilineTextAlignment(.center)
                                        Spacer()
                                    }
                                    
                                    Spacer()
                                }
                            }
                            else{
                                ScrollView(.horizontal) {
                                    HStack(){
                                        ForEach(sortedCards,id:\.self){card in
                                            CardView(lesson: lesson, card:card)
                                                .containerRelativeFrame(.horizontal, count: verticalSize == .regular ? 1 : 2, spacing: 10.0)
                                                .scrollTransition { content, phase in
                                                    content
                                                        .opacity(phase.isIdentity ? 1.0 : 0.0)
                                                        .scaleEffect(x: phase.isIdentity ? 1.0 : 0.3,
                                                                     y:phase.isIdentity ? 1.0 : 0.3)
                                                        .offset(y:phase.isIdentity ? 0 : 50)
                                                }
                                        }
                                    }
                                    .scrollTargetLayout()
                                }
                                .contentMargins(16, for: .scrollContent)
                                .scrollTargetBehavior(.viewAligned)
                            }
                            
                            Button{
                                withAnimation {
                                    isShowingMenu.toggle()
                                }
                            }label: {
                                Text("Practice")
                                    .padding()
                                    .background(Color("ListRow"))
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                                    
                            }
                            .padding(.bottom)
                        }
                        .opacity(opacity)
                        if(isShowingMenu){
                            PopOverView(practiceMethod: $practiceMethod, isShowingPopOver: $isShowingMenu, isShowingMenu: $isShowingMenu, lesson: lesson)
                                .transition(.move(edge: .bottom))
                        }
                    }
                    
                    
                }
                
            }
            
        }
        
    }
}

