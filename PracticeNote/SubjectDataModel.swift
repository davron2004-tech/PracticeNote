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
    var words:[String]?
    var lessons:[String]?
    init(subjectName: String, emoji: String) {
        self.subjectName = subjectName
        self.emoji = emoji
       
    }
}
