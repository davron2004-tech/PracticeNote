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
    var folders: [String]?
    var words:[String]?
    var lessons:[String]?
    init(subjectName: String, emoji: String, folders: [String]? = nil, words: [String]? = nil, lessons: [String]? = nil) {
        self.subjectName = subjectName
        self.emoji = emoji
        self.folders = folders
        self.words = words
        self.lessons = lessons
    }
}
