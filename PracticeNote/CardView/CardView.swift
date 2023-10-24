//
//  CardsView.swift
//  PracticeNote
//
//  Created by Davron Abdukhakimov on 13/10/23.
//

import SwiftUI

struct CardView: View {
    @State var isBack = false
    @Bindable var lesson:LessonDataModel
    @Environment(\.modelContext) var context
    var card:CardDataModel
    var body: some View {
        Button {
            isBack.toggle()
        } label: {
            VStack{
                HStack{
                    Spacer()
                    Button{
                        var order = 0
                        for cardIn in lesson.cards{
                            if card == cardIn{
                                break
                            }
                            else{
                                order += 1
                            }
                        }
                        lesson.cards.remove(at: order)
                        do{
                            try context.save()
                        }
                        catch{
                            
                        }
                        
                    }label:{
                        Image(systemName: "trash")
                    }
                }
                Text(isBack ? card.back : card.face)
                    .foregroundStyle(Color(.label))
                    .frame(width: 300,height: 200)
                    .background(Color(.purple))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }
            
        }
        
            
    }
}


