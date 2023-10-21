//
//  ContentView.swift
//  PracticeNote
//
//  Created by Asror Aliqulov on 06/10/23.
//

import SwiftUI
import SwiftData
struct ContentView: View {
    enum SelectedView{
        case home
        case account
    }
    @Query var subjects:[SubjectDataModel]
    @State var selectedView:SelectedView = .home
    var body: some View {
        NavigationStack{
            TabView (selection:$selectedView){
                HomeView(subjects: subjects)
                    .tabItem { Label("Home", systemImage: "house") }
                    .tag(SelectedView.home)
                AccountView(subjects:subjects)
                    .tabItem { Label("Account", systemImage: "person") }
                    .tag(SelectedView.account)
            }
            
            .navigationTitle(selectedView == .home ? "Subjects" : "Account")
            
            
                
            

        }
    }
}

#Preview {
    ContentView()
}
