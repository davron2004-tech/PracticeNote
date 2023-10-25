//
//  VacabulariesView.swift
//  PracticeNote
//
//  Created by Asror Aliqulov on 08/10/23.
//

import SwiftUI
let languages = ["English","Russian","Uzbek","Korean"]
struct TranslatorView: View {
    @Environment(\.presentationMode) var presentation
    @Bindable var lesson:LessonDataModel
    
    @State var frontText = ""
    @State var backText = ""
    @State var frontLanguage = "English"
    @State var backLanguage = "Russian"
    
    var body: some View {
        
        NavigationStack{
            ZStack{
                Color("BackgroundColor")
                    .ignoresSafeArea()
                VStack{
                    TranslatorSideView(text: $frontText, language: $frontLanguage)
                        .padding(.bottom)
                    TranslatorSideView(text: $backText, language: $backLanguage)
                        .padding(.bottom)

                }
                .padding()
            }
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        let card = CardDataModel(face: frontText, back: backText, date: Date())
                        lesson.cards.append(card)
                        presentation.wrappedValue.dismiss()
                    } label: {
                        Text("Save")
                    }
                }
            }
            .task(id: frontText) {
                if (!frontText.isEmpty ){
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
struct TranslatorSideView:View {
    @Binding var text:String
    @Binding var language:String
    @State var isShowingPopup = false
    var body: some View {
        
            HStack{
                Button {
                    if (language == "Uzbek"){
                        isShowingPopup = true
                    }
                    else{
                        let textToSpeech = TextToSpeech(text: text)
                        textToSpeech.speak()
                    }
                } label: {
                    Image(systemName: "speaker.wave.2")
                }

                TextEditor(text: $text)
                    .foregroundStyle(Color(.label))
                    .scrollContentBackground(.hidden)
                    
                VStack {
                    Picker("Language", selection: $language) {
                        ForEach(languages,id: \.self){languageText in
                            Text(languageText)
                        }
                    }
                    Spacer()
                }
            }
            .background(Color("ListRow"))
        .alert(isPresented: $isShowingPopup){
            Alert(title: Text("Error occured"),
                  message: Text("Speech is not available in Uzbek language!"),
                  dismissButton: .default(Text("Ok")))
        }
        .clipShape(RoundedRectangle(cornerRadius: 16))
            
            
    }
}


