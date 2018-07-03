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
    
    @IBOutlet weak var predictionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
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
    
    func update(with classificationResult: ClassificationResult) {
        predictionLabel.text = "Predict \(classificationResult.identifier) with \(classificationResult.confidence) confidence"
    }
    
}

extension ObjectDetectionViewController: MediaAccessorDelegate {
    
    func mediaAccessor(_ mediaAccessor: MediaAccessor, didFinishPickingData data: ClassificationData) {
        imageView.image = UIImage(ciImage: data.image)
        presenter.didObtainClassificationData(data)
    }
    
}
