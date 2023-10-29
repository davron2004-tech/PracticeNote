//
//  PhotoView.swift
//  PracticeNote
//
//  Created by Davron Abdukhakimov on 22/10/23.
//

import SwiftUI

struct PhotoView: View {
    var image:Data
    var lesson:LessonDataModel
    @Environment(\.dismiss) var dismiss
    @State var order = 0
    @GestureState private var zoom = 1.0
    var body: some View {
        
        NavigationStack{
            GeometryReader{geo in
                ZStack{
                    Color("BackgroundColor")
                        .ignoresSafeArea()
                    Image(uiImage: UIImage(data: image)!)
                        .resizable()
                        .padding(0)
                        .aspectRatio(contentMode: .fill)
                        .modifier(ImageModifier(contentSize: CGSize(width: geo.size.width, height: geo.size.height)))
                }
            }
            
            
        }
        .toolbar{
            ToolbarItem(placement: .topBarTrailing) {
                Button{
                    for imageIn in lesson.images{
                        if imageIn == image{
                            dismiss()
                            lesson.images.remove(at: order)
                        }
                        order += 1
                    }
                }label: {
                    Image(systemName: "trash")
                }
            }
        }
    }
}


