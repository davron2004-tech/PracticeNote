//
//  VacabulariesView.swift
//  PracticeNote
//
//  Created by Asror Aliqulov on 08/10/23.
//

import SwiftUI
let languages = ["English","Russian","Uzbek","Korean"]
struct TranslatorView: View {
    @Bindable var lesson:LessonDataModel
    
    @State var frontText = ""
    @State var backText = ""
    @State var frontLanguage = "English"
    @State var backLanguage = "Russian"
    
    var body: some View {
        
        NavigationStack{
            ZStack{
                Color(.gray)
                    .ignoresSafeArea()
                VStack{
                    TranslatorView(text: $frontText, language: $frontLanguage)
                        .padding(.bottom)
                    TranslatorView(text: $backText, language: $backLanguage)
                        .padding(.bottom)
                    Button {
                        let card = CardDataModel(face: frontText, back: backText)
                        lesson.cards.append(card)
                    } label: {
                        Text("Save the card")
                    }
                    .buttonStyle(.borderedProminent)

                }
                .padding()
            }
            .task(id: frontText) {
                if (!frontText.isEmpty){
                    @ObservedObject var translator = Translator(text: frontText, from: frontLanguage, to: backLanguage)
                    do{
                        try await translator.fetchData()
                        backText = translator.result!
                    }
                    catch{
                        
                    }
                }
                
            }
            .task(id: frontLanguage) {
                if (!frontText.isEmpty){
                    @ObservedObject var translator = Translator(text: frontText, from: frontLanguage, to: backLanguage)
                    do{
                        try await translator.fetchData()
                        backText = translator.result!
                    }
                    catch{
                        
                    }
                }
                
            }
            .task(id: backLanguage) {
                if (!frontText.isEmpty){
                    @ObservedObject var translator = Translator(text: frontText, from: frontLanguage, to: backLanguage)
                    do{
                        try await translator.fetchData()
                        backText = translator.result!
                    }
                    catch{
                        
                    }
                }
                
            }
            
            
        }
        
        
    }
}
struct TranslatorView:View {
    @Binding var text:String
    @Binding var language:String
    var body: some View {
        VStack{
            HStack{
                TextEditor(text: $text)
                VStack {
                    Picker("Language", selection: $language) {
                        ForEach(languages,id: \.self){languageText in
                            Text(languageText)
                        }
                    }
                    Spacer()
                }
            }
        }
        .background(Color(.white))
        .clipShape(RoundedRectangle(cornerRadius: 16))
            
            
    }
}


