//
//  ClassifyImageUseCase.swift
//  ObjectRecognizer
//
//  Created by vladislav klimenko on 26/05/2018.
//  Copyright © 2018 Wooden Co. All rights reserved.
//

import Foundation

typealias ClassifyDataUseCaseCompletionHandler = (_ result: Result<ClassificationResult>) -> Void

protocol ClassifyDataUseCase {
    func classifyData(_ data: ClassificationData,
                      completionHandler: @escaping ClassifyDataUseCaseCompletionHandler)
}

final class ClassifyDataUseCaseImpl: ClassifyDataUseCase {
    
    let imagesGateway: ImagesGateway
    
    init(imagesGateway: ImagesGateway) {
        self.imagesGateway = imagesGateway
    }
    
    func classifyData(_ data: ClassificationData,
                      completionHandler: @escaping (Result<ClassificationResult>) -> Void) {
        imagesGateway.classifyData(data) { (result) in
            completionHandler(result)
        }
    }
    
}
