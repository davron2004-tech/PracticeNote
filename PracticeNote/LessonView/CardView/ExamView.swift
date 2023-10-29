//
//  ExamView.swift
//  PracticeNote
//
//  Created by Davron Abdukhakimov on 26/10/23.
//

import SwiftUI

struct ExamView: View {
    @State private var score = 0
    @State private var questionOrder = 0
    @State private var isBack = false
    @State var optionToCompare:String
    @State var isResultView = false
    @Environment(\.dismiss) var dismiss
    var practiceMethod:PracticeMethod
    var cards:[CardDataModel]
    func generateOption(){
        optionToCompare = cards.randomElement()!.back
    }
    var body: some View {
        NavigationStack{
            GeometryReader{geo in
                ZStack{
                    Color("BackgroundColor")
                        .ignoresSafeArea()
                    VStack(spacing: 20){
                        Text("\(score) / \(cards.count)")
                            .padding(.top)
                        HStack{
                            Spacer()
                            Text(isBack ? cards[questionOrder].back : cards[questionOrder].face)
                                .rotation3DEffect(.degrees(isBack ? 180 : 0), axis: (x: 1, y: 0, z: 0))
                                .fontWeight(.bold)
                                .font(.system(size: 25))
                                .frame(width: practiceMethod == .know_dontKnow ? geo.size.width * 0.9 : geo.size.width * 0.45,height: geo.size.height * 0.3)
                                .background(Color("ListRow"))
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                                .rotation3DEffect(.degrees(isBack ? 180 : 0), axis: (x: 1, y: 0, z: 0),anchor: .center)
                                            .animation(.default, value: isBack)
                            if(practiceMethod == .true_false){
                                Text(optionToCompare)
                                    .fontWeight(.bold)
                                    .font(.system(size: 25))
                                    .frame(width:geo.size.width * 0.45,height: geo.size.height * 0.3)
                                    .background(Color("ListRow"))
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                            }
                            
                            Spacer()
                        }
                        
                        
                        HStack(spacing: 10){
                            Spacer()
                            Button{
                                if(practiceMethod == .know_dontKnow){
                                    isBack = true
                                }
                                if(practiceMethod == .true_false){
                                    if optionToCompare != cards[questionOrder].back{
                                        score += 1
                                    }
                                    if(questionOrder < cards.count - 1){
                                        questionOrder += 1
                                    }
                                    else{
                                        isResultView = true
                                    }
                                    generateOption()
                                }
                            }label: {
                                Text(practiceMethod == .know_dontKnow ? "Don't know" : "False")
                                    .fontWeight(.bold)
                                    .font(.system(size: 25))
                                    .frame(width:geo.size.width * 0.45,height: geo.size.height * 0.1)
                                    .background(Color("ListRow"))
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                                    .padding(.bottom)
                            }
                            
                            Button{
                                if(practiceMethod == .know_dontKnow){
                                    isBack = false
                                    if(questionOrder < cards.count - 1){
                                        questionOrder += 1
                                    }
                                    else{
                                        isResultView = true
                                    }
                                    
                                    score += 1
                                }
                                if(practiceMethod == .true_false){
                                    if optionToCompare == cards[questionOrder].back{
                                        score += 1
                                    }
                                    if(questionOrder < cards.count - 1){
                                        questionOrder += 1
                                    }
                                    else{
                                        
                                    }
                                    generateOption()
                                }
                            }label: {
                                Text(practiceMethod == .know_dontKnow ? "Know" : "True")
                                    .fontWeight(.bold)
                                    .font(.system(size: 25))
                                    .frame(width:geo.size.width * 0.45,height: geo.size.height * 0.1)
                                    .background(Color("ListRow"))
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                                    .padding(.bottom)
                            }
                            Spacer()
                        }
                        if practiceMethod == .know_dontKnow{
                            
                            
                            Button{
                                isBack = false
                                if questionOrder < cards.count - 1{
                                    questionOrder += 1
                                }
                                else{
                                    isResultView = true
                                }
                                
                                
                            }label: {
                                Image(systemName: "arrow.right")
                                    .font(.system(size: 25))
                                    .padding()
                                    .overlay(Circle()
                                        .stroke(.black, lineWidth: 3)
                                    )
                            }
                            
                            
                        }
                        
                    }
                }
                
            }
        }
        .fullScreenCover(isPresented: $isResultView){
            ResultView(total: cards.count, result: score, practiceMethod: practiceMethod, isResultView: $isResultView, dismiss: dismiss)
                
        }
        .onAppear{
            generateOption()
        }
    }
}


