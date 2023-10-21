//
//  SubjectDataModel.swift
//  PracticeNote
//
//  Created by Davron Abdukhakimov on 07/10/23.
//

import Foundation
import SwiftData


@Model
class SubjectDataModel:Identifiable{
    var id = UUID()
    var subjectName:String
    var emoji:String
    var words:[String] = []
    var lessons:[LessonDataModel] = []
    init(subjectName: String, emoji: String) {
        self.subjectName = subjectName
        self.emoji = emoji
    }
}

@Model
class LessonDataModel: Identifiable {
    var id = UUID()
    var lessonName:String
    var text:String?
    var cards:[CardDataModel] = []
    var images: [Data] = []
    init(lessonName: String) {
        self.lessonName = lessonName
    }
}

@Model
class CardDataModel:Identifiable{
    var id = UUID()
    var face:String
    var back:String
    init(face: String, back: String) {
        self.face = face
        self.back = back
    }
}
