//
//  CameraView.swift
//  PracticeNote
//
//  Created by Davron Abdukhakimov on 21/10/23.
//

import SwiftUI
import UIKit
struct CameraView: UIViewControllerRepresentable {
    var lesson:LessonDataModel
    @Environment(\.presentationMode) var presentation
    func makeCoordinator() -> Coordinator {
        return Coordinator(cameraView: self)
    }
    func makeUIViewController(context: Context) -> some UIViewController {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = context.coordinator
        imagePicker.sourceType = .camera
        return imagePicker
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    
}
class Coordinator:NSObject, UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    let cameraView:CameraView
    init(cameraView: CameraView) {
        self.cameraView = cameraView
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else {
            return
        }
        let imageToSave = image.jpeg(.low)
        cameraView.lesson.images.append(imageToSave!)
        cameraView.presentation.wrappedValue.dismiss()
        
    }
}
extension UIImage {
    enum JPEGQuality: CGFloat {
        case lowest  = 0
        case low     = 0.25
        case medium  = 0.5
        case high    = 0.75
        case highest = 1
    }

    /// Returns the data for the specified image in JPEG format.
    /// If the image object’s underlying image data has been purged, calling this function forces that data to be reloaded into memory.
    /// - returns: A data object containing the JPEG data, or nil if there was a problem generating the data. This function may return nil if the image has no data or if the underlying CGImageRef contains data in an unsupported bitmap format.
    func jpeg(_ jpegQuality: JPEGQuality) -> Data? {
        return jpegData(compressionQuality: jpegQuality.rawValue)
    }
}
