//
//  CardsView.swift
//  PracticeNote
//
//  Created by Davron Abdukhakimov on 13/10/23.
//

import SwiftUI

struct CardView: View {
    @State var isBack = false
    var card:CardDataModel
    var body: some View {
        Button {
            isBack.toggle()
        } label: {
            
            Text(isBack ? card.back : card.face)
                .foregroundStyle(Color(.label))
                .frame(width: 300,height: 200)
                .background(Color(.purple))
                .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        
            
    }
}


