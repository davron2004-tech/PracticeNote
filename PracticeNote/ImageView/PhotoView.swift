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
    var body: some View {
        NavigationStack{
            ZStack{
                Color("BackgroundColor")
                    .ignoresSafeArea()
                Image(uiImage: UIImage(data: image)!)
                    .resizable()
                    .padding(.top,0)
                    .padding(.leading,0)
                    .padding(.trailing,0)
                    .padding(.bottom,0)
                    .aspectRatio(contentMode: .fill)
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


