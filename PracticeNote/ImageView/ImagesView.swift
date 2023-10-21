//
//  ImagesView.swift
//  PracticeNote
//
//  Created by Asror Aliqulov on 08/10/23.
//

import SwiftUI

struct ImagesView: View {
    @Bindable var lesson:LessonDataModel
    var columns = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, alignment: .leading) {
                    VStack {
                        NavigationLink {
                            EmptyView()
                        } label: {
                            VStack {
                                Image(systemName: "camera")
                                Text("Camera").font(.caption)
                            }
                            .frame(width: 150, height: 100)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 25.0))
                            .shadow(radius: 4, x: 0, y: 0)
                            .padding()
                        }
                    }
                    
                    
                    ForEach(lesson.images, id: \.self) { imageData in
                        var image = UIImage(data: imageData)
                        if let uiImage = image {
                            ImageCellView(uiImage: uiImage)
                        }
                    }
                }
            }
        }.padding()
    }
}

struct ImageCellView: View {
    var uiImage: UIImage
    var body: some View {
        VStack {
            Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
        }
        .frame(width: 150, height: 100)
    }
}

