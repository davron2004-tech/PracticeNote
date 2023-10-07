//
//  SubjectView.swift
//  PracticeNote
//
//  Created by Asror Aliqulov on 06/10/23.
//

import SwiftUI

struct SubjectView: View {
    var subject: SubjectDataModel
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(subject.emoji)
                Text(subject.subjectName)
                    .bold()
            }
            .font(.title2)
            .padding(.vertical, 12)
            HStack {
                NavigationLink {
                    InSubjectView(subject: subject)
                } label: {
                    Text("12 lessons")
                        .bold()
                }
                .buttonStyle(.borderedProminent)
                NavigationLink {
                    InSubjectView(subject: subject)
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


