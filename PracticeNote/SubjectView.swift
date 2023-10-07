//
//  SubjectView.swift
//  PracticeNote
//
//  Created by Asror Aliqulov on 06/10/23.
//

import SwiftUI

struct SubjectView: View {
    var emoji:String
    var subjectName:String
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(emoji)
                Text(subjectName)
                    .bold()
            }
            .font(.title2)
            .padding(.vertical, 12)
            HStack {
                Button {
                    
                } label: {
                    Text("12 lessons")
                        .bold()
                }
                .buttonStyle(.borderedProminent)
                Button {
                    
                } label: {
                    Text("120 words")
                        .bold()
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .padding()
        .padding(.horizontal, 24)
        .background(Color(.white))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 2, x: 0, y: 2)
        
    }
}


