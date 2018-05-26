//
//  MediaAccessor.swift
//  ObjectRecognizer
//
//  Created by vladislav klimenko on 26/05/2018.
//  Copyright © 2018 Wooden Co. All rights reserved.
//

import Foundation
import UIKit

protocol MediaAccessor: class {
    
    var delegate: MediaAccessorDelegate? { get set }
    
    func openCamera(from viewController: UIViewController)
    func openImageGallery(from viewController: UIViewController)
}

protocol MediaAccessorDelegate: class {
    func mediaAccessor(_ mediaAccessor: MediaAccessor, didFinishPickingData data: ClassificationData)
}
