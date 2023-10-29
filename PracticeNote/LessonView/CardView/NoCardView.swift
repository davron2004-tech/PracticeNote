//
//  NoCardView.swift
//  PracticeNote
//
//  Created by Davron Abdukhakimov on 27/10/23.
//

import SwiftUI

struct NoCardView: View {
    @State var isShowingAlert = true
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack{
            Color("BackgroundColor")
                .ignoresSafeArea()
        }
        .alert("You have no cards to practice!", isPresented: $isShowingAlert) {
                    Button("OK", role: .cancel) { 
                        dismiss()
                    }
        }
        
    }
}

#Preview {
    NoCardView()
}
