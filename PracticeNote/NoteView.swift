//
//  NoteView.swift
//  PracticeNote
//
//  Created by Asror Aliqulov on 08/10/23.
//

import SwiftUI

struct NoteView: View {
    @State var temporaryText: String = ""
    var body: some View {
        NavigationStack {
            TextEditor(text: $temporaryText)
        }
    }
}

#Preview {
    NoteView()
}
