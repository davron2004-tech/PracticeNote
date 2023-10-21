//
//  Translator.swift
//  PracticeNote
//
//  Created by Davron Abdukhakimov on 12/10/23.
//

import Foundation
class Translator:ObservableObject{
    @Published var result:String?
    var text:String
    var from:String
    var to:String
    init(text: String, from: String, to: String) {
        self.text = text
        self.from = from
        self.to = to
    }
    var fromCode:String{
        if(from == "English"){
            return "en"
        }
        else if(from == "Russian"){
            return "ru"
        }
        else if(from == "Uzbek"){
            return "uz"
        }
        else if(from == "Korean"){
            return "ko"
        }
        else{
            return "en"
        }
    }
    var toCode:String{
        if(to == "English"){
            return "en"
        }
        else if(to == "Russian"){
            return "ru"
        }
        else if(to == "Uzbek"){
            return "uz"
        }
        else if(to == "Korean"){
            return "ko"
        }
        else{
            return "en"
        }
    }
    func fetchData()async throws{
        guard let url = URL(string: "https://api.mymemory.translated.net/get?q=\(text)&langpair=\(fromCode)|\(toCode)")
        else {
            return
        }
        let request = URLRequest(url: url)
        let (data,response) = try await URLSession.shared.data(for: request)
        guard let response = response as? HTTPURLResponse,response.statusCode == 200 else{
            return
        }
        
        let fetchedData = try JSONDecoder().decode(ResponseData.self,from: data)
        result = fetchedData.responseData.translatedText
            
        
    }
}
struct ResponseData:Codable{
    var responseData:FetchModel
}
struct FetchModel:Codable{
    var translatedText:String
}
