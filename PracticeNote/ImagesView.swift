//
//  ImagesView.swift
//  PracticeNote
//
//  Created by Asror Aliqulov on 08/10/23.
//

import SwiftUI

struct ImagesView: View {
    var body: some View {
        NavigationStack {
            Text("No Images yet!")
                .toolbar {
                    Button {
                        
                    } label: {
                        Image(systemName: "camera")
                    }
                }
        }
    }
}

#Preview {
    ImagesView()
}
