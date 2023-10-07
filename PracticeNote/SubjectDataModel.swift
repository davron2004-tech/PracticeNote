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
    var folders:[FolderDataModel] = []
    init(subjectName: String, emoji: String) {
        self.subjectName = subjectName
        self.emoji = emoji
    }
}

@Model
class FolderDataModel:Identifiable{
    var id = UUID()
    var folderName:String
    var lessons:[LessonDataModel] = []
    init(folderName: String) {
        self.folderName = folderName
    }
}

@Model
class LessonDataModel: Identifiable {
    var id = UUID()
    var lessonName:String
    var notes:[NoteDataModel] = []
    init(lessonName: String) {
        self.lessonName = lessonName
    }
}
@Model
class NoteDataModel:Identifiable{
    var id = UUID()
    var text:String
    var imageData:Data
    var cards:[CardDataModel] = []
    init(text: String, imageData: Data) {
        self.text = text
        self.imageData = imageData
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
