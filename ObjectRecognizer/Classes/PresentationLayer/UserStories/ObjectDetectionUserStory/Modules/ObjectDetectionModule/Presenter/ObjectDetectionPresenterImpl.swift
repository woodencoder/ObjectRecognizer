//
//  ObjectDetectionPresenterImpl.swift
//  ObjectRecognizer
//
//  Created by vladislav klimenko on 26/05/2018.
//  Copyright © 2018 Wooden Co. All rights reserved.
//

import Foundation

class ObjectDetectionPresenterImpl {
    
    private weak var view: ObjectDetectionView?
    
    init(view: ObjectDetectionView) {
        self.view = view
    }
    
}

extension ObjectDetectionPresenterImpl: ObjectDetectionPresenter {
    
    func viewIsReady() {
        
    }
    
    func didObtainClassificationData(_ data: ClassificationData) {
        
    }
    
    
}
