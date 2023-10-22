//
//  ImagesView.swift
//  PracticeNote
//
//  Created by Asror Aliqulov on 08/10/23.
//

import SwiftUI

struct ImagesView: View {
    @Bindable var lesson:LessonDataModel
    var slicedImages:[[Data]]{
        let images = lesson.images
        var row:[Data] = []
        var table:[[Data]] = []
        var isFirstRow = true
        for image in images{
            if (row.count == 2 && isFirstRow){
                table.append(row)
                row = []
                row.append(image)
                isFirstRow = false
            }
            else if(row.count == 3){
                table.append(row)
                row = []
                row.append(image)
            }
            else{
                row.append(image)
            }
        }
        table.append(row)
        row = []
        return table
    }
    var body: some View {
        NavigationStack {
            ScrollView {
                GeometryReader{
                    geo in
                    VStack(alignment: .leading,spacing:7){
                    ForEach(slicedImages, id: \.self) { imageRow in
                        HStack(spacing: 7){
                            if slicedImages[0] == imageRow{
                                
                                NavigationLink {
                                    CameraView(lesson: lesson)
                                        .navigationBarBackButtonHidden(true)
                                } label: {
                                    
                                    VStack {
                                        Image(systemName: "camera")
                                        Text("Camera").font(.caption)
                                    }
                                    .frame(width: geo.size.width * 0.32, height: 100)
                                    .background(.white)
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(RoundedRectangle(cornerRadius: 16.0))
                                    .shadow(radius: 4, x: 0, y: 0)
                                    
                                }
                            }
                            
                            ForEach(imageRow , id:\.self){
                                imageData in
                                
                                Image(uiImage: UIImage(data: imageData)!)
                                    .resizable()
                                    .frame(width: geo.size.width * 0.32 ,height: 100)
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(RoundedRectangle(cornerRadius: 16.0))
                            }
                        }
                        
                        
                        
                    }
                }
            }
                
            }
            .padding(.horizontal)
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
extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}
