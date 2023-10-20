//
//  FolderFormView.swift
//  PracticeNote
//
//  Created by Davron Abdukhakimov on 07/10/23.
//

import SwiftUI

struct FolderFormView: View {
    @State var folderName = ""
    @Binding var isShowingFolderForm:Bool
    var subject:SubjectDataModel
    var body: some View {
        NavigationStack{
            Form{
                TextField("Folder name", text: $folderName)
                    .presentationDetents([.medium])
                    .presentationDragIndicator(.visible)
            }
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button{
                        isShowingFolderForm = false
                    } label: {
                        Text("Cancel")
                            .foregroundStyle(.red)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button{
                        subject.folders.append(FolderDataModel(folderName: folderName))
                        isShowingFolderForm = false
                    } label: {
                        Text("Save")
                            .foregroundStyle(.blue)
                    }
                }
            }
        }
        
        
    }
}


