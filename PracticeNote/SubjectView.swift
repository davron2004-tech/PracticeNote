//
//  SubjectView.swift
//  PracticeNote
//
//  Created by Asror Aliqulov on 06/10/23.
//

import SwiftUI

struct SubjectView: View {
    var subject: SubjectDataModel
    @State var isShowingInSubjectView = false
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
                Button {
                    isShowingInSubjectView = true
                } label: {
                    Text("\(subject.lessons.count) lessons")
                        .bold()
                }
                .buttonStyle(.borderedProminent)
                Button {
                    isShowingInSubjectView = true
                    
                } label: {
                    Text("\(subject.words.count) words")
                        .bold()
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .fullScreenCover(isPresented: $isShowingInSubjectView){
            InSubjectView(subject: subject,isShowingInSubjectView: $isShowingInSubjectView)
        }
        .padding()
        .padding(.horizontal, 24)
        .background(Color(.white))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 2, x: 0, y: 2)
        
    }
}


