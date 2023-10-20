//
//  TextToSpeech.swift
//  PracticeNote
//
//  Created by Davron Abdukhakimov on 15/10/23.
//

import Foundation
import AVFoundation
import NaturalLanguage
let synthesizer = AVSpeechSynthesizer()
struct TextToSpeech{
    let text:String
    func speak(){
        let naturalLanguage = NLLanguageRecognizer()
        naturalLanguage.processString(text)
        if let dominantLanguage = naturalLanguage.dominantLanguage{
            let utterance = AVSpeechUtterance(string: text)
            utterance.rate = 0.1
            utterance.voice = AVSpeechSynthesisVoice(language: dominantLanguage.rawValue)
            synthesizer.speak(utterance)
        }
    }
}
