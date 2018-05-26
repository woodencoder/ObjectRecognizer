//
//  ObjectDetectionViewController.swift
//  ObjectRecognizer
//
//  Created by vladislav klimenko on 26/05/2018.
//  Copyright © 2018 Wooden Co. All rights reserved.
//

import Foundation
import EasyDi
import UIKit

class ObjectDetectionViewController: UIViewController {
    
    var presenter: ObjectDetectionPresenter!
    var mediaAccessor: MediaAccessor!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ObjectDetectionModuleAssembly.instance().inject(into: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewIsReady()
        
        mediaAccessor.delegate = self
    }
    
    @IBAction func didPressOpenCamera(_ sender: Any) {
        mediaAccessor.openCamera(from: self)
    }
    
    @IBAction func didPressOpenLibrary(_ sender: Any) {
        mediaAccessor.openImageGallery(from: self)
    }
    
}

extension ObjectDetectionViewController: ObjectDetectionView {
    
}

extension ObjectDetectionViewController: MediaAccessorDelegate {
    
    func mediaAccessor(_ mediaAccessor: MediaAccessor, didFinishPickingData data: ClassificationData) {
        presenter.didObtainClassificationData(data)
    }
    
}
