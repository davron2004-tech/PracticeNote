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
    @Attribute(.unique) var subjectName:String
    var emoji:String
    var words:[String] = []
    var date:Date
    @Relationship(deleteRule:.cascade) var lessons:[LessonDataModel] = []
    init(subjectName: String, emoji: String,date:Date) {
        self.subjectName = subjectName
        self.emoji = emoji
        self.date = date
    }
}
@Model
class LessonDataModel: Identifiable {
    var lessonName:String
    var text:String?
    @Relationship(deleteRule:.cascade) var cards:[CardDataModel] = []
    var date:Date
    var images: [Data] = []
    init(lessonName: String,date:Date) {
        self.lessonName = lessonName
        self.date = date
    }
}

@Model
class CardDataModel:Identifiable{
    var face:String
    var back:String
    var date:Date
    init(face: String, back: String,date:Date) {
        self.face = face
        self.back = back
        self.date = date
    }
}
