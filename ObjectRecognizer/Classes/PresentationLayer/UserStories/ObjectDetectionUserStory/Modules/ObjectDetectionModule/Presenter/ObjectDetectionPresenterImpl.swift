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
    private var classifyDataUseCase: ClassifyDataUseCase
    
    init(view: ObjectDetectionView, classifyDataUseCase: ClassifyDataUseCase) {
        self.view = view
        self.classifyDataUseCase = classifyDataUseCase
    }
    
}

extension ObjectDetectionPresenterImpl: ObjectDetectionPresenter {
    
    func viewIsReady() {
        
    }
    
    func didObtainClassificationData(_ data: ClassificationData) {
        classifyDataUseCase.classifyData(data) { (result) in
            switch result {
            case let .success(classificationResult):
                self.view?.update(with: classificationResult)
            case .failure:
                break
            }
        }
    }
    
    
}
