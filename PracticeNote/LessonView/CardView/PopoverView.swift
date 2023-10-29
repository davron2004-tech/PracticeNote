//
//  PopoverView.swift
//  PracticeNote
//
//  Created by Davron Abdukhakimov on 26/10/23.
//

import SwiftUI
struct PopOverView:View {
    @Binding var practiceMethod:PracticeMethod?
    @Binding var isShowingPopOver:Bool
    @Binding var isShowingMenu:Bool
    
    var lesson:LessonDataModel
    var body: some View {
        NavigationStack{
            GeometryReader{geo in
                VStack(alignment:.center,spacing: 10){
                    Spacer()
                    VStack(spacing:0){
                        Text("Choose practice method")
                            .foregroundStyle(.secondary)
                            .padding()
                            
                        
                        Divider()
                        NavigationLink{
                            if lesson.cards.count != 0{
                                ExamView(optionToCompare: lesson.cards.randomElement()!.back, practiceMethod: .true_false, cards: lesson.cards.shuffled())
                                    .onAppear{
                                        isShowingMenu = false
                                    }
                            }
                            else{
                                NoCardView()
                                    .onAppear{
                                            isShowingMenu = false
                                    }
                            }
                        }label: {
                            Text("True / False")
                                .padding()
                        }
                        
                        Divider()
                        NavigationLink{
                            if lesson.cards.count != 0{
                                ExamView(optionToCompare: lesson.cards.randomElement()!.back, practiceMethod: .know_dontKnow, cards:lesson.cards.shuffled())
                                    .onAppear{
                                            isShowingMenu = false
                                    }
                            }
                            else{
                                NoCardView()
                                    .onAppear{
                                            isShowingMenu = false
                                    }
                            }
                        }label: {
                            Text("I know / I don't know")
                                .padding()
                        }
                        
                    }
                    
                    .background(Color("CancelBackground"))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    Button{
                        withAnimation {
                            isShowingPopOver.toggle()
                        }
                    }label: {
                        Text("Cancel")
                            .fontWeight(.heavy)
                            .padding()
                            .frame(width:geo.size.width)
                            .background(Color("CancelBackground"))
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                    }
                }
                
            }
        }
        
        
    }
}


