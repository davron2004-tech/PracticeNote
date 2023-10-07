//
//  ContentView.swift
//  PracticeNote
//
//  Created by Asror Aliqulov on 06/10/23.
//

import SwiftUI
import SwiftData
struct ContentView: View {
    @Query var subjects:[SubjectDataModel]
    @State var lessonCount = 0
    var body: some View {
        TabView {
            HomeView()
                .tabItem { Label("Home", systemImage: "house") }
            AccountView(subjects:subjects)
                .tabItem { Label("Account", systemImage: "person") }
        }
        
    }
}

#Preview {
    ContentView()
}
