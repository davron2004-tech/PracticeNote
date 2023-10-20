//
//  CardsView.swift
//  PracticeNote
//
//  Created by Davron Abdukhakimov on 13/10/23.
//

import SwiftUI

struct CardView: View {
    var text:String
    var body: some View {
        Text(text)
            .foregroundStyle(Color(.label))
            .frame(width: 300,height: 200)
            .background(Color(.purple))
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
    }
}

#Preview {
    CardView(text: "Hello")
}
