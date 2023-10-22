//
//  ContentView.swift
//  PracticeNote
//
//  Created by Asror Aliqulov on 06/10/23.
//

import SwiftUI
struct ContentView: View {
    enum SelectedView{
        case home
        case account
    }
    @State var isAddSubjectView = false
    @State var selectedView:SelectedView = .home
    var body: some View {
        NavigationStack{
            TabView (selection:$selectedView){
                HomeView()
                    .tabItem { Label("Home", systemImage: "house") }
                    .tag(SelectedView.home)
                AccountView()
                    .tabItem { Label("Account", systemImage: "person") }
                    .tag(SelectedView.account)
                
            }
            .toolbar{
                if selectedView == .home{
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            isAddSubjectView = true
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
                
            }
            .navigationTitle(selectedView == .home ? "Subjects" : "Account")
            
        }
        .sheet(isPresented: $isAddSubjectView) {
            SubjectFormView(isShoiwngSubjectFormView: $isAddSubjectView)
                .presentationDetents([.medium])
                .presentationDragIndicator(.visible)
        }
    }
}
#Preview {
    ContentView()
}

