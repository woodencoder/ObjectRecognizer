//
//  MediaAccessorImpl.swift
//  ObjectRecognizer
//
//  Created by vladislav klimenko on 26/05/2018.
//  Copyright © 2018 Wooden Co. All rights reserved.
//

import Foundation
import UIKit

final class MediaAccessorImpl: NSObject, MediaAccessor {
    
    weak var delegate: MediaAccessorDelegate?
    
    func openCamera(from viewController: UIViewController) {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            return
        }
        
        let imagePicker  = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = self

        viewController.present(imagePicker, animated: true)
    }
    
    func openImageGallery(from viewController: UIViewController) {
        let imagePicker  = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        viewController.present(imagePicker, animated: true)
    }
    
}

extension MediaAccessorImpl: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        guard
            let image = info[UIImagePickerControllerEditedImage] as? UIImage,
            let ciImage = image.ciImage else {
            return
        }
        let data = ClassificationData(image: ciImage)
        delegate?.mediaAccessor(self, didFinishPickingData: data)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
}
