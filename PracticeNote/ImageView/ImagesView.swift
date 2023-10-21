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

//                    NavigationLink {
//                        CameraView(lesson: lesson)
//                            .navigationBarBackButtonHidden(true)
//                    } label: {
//                        VStack {
//                            Image(systemName: "camera")
//                            Text("Camera").font(.caption)
//                        }
//                        .frame(width: 150, height: 100)
//                        .background(.white)
//                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
//                        .shadow(radius: 4, x: 0, y: 0)
//                        .padding()
//                    }
                    ForEach(lesson.images, id: \.self) { imageData in
                        if let image = UIImage(data: imageData) {
                            ImageCellView(uiImage: image)
                        }
                    }
                }
            }
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink{
                        CameraView(lesson: lesson)
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        Image(systemName: "camera")
                    }
                }
            }
        }
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
        .padding(.trailing,20)
        .padding(.leading,2)
    }
}

