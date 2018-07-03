//
//  ImagesGatewayImpl.swift
//  ObjectRecognizer
//
//  Created by vladislav klimenko on 26/05/2018.
//  Copyright © 2018 Wooden Co. All rights reserved.
//

import Foundation
import CoreML
import Vision

class ImagesGatewayImpl: ImagesGateway {
    
    private var model: VNCoreMLModel = try! VNCoreMLModel(for: Cifar10().model)
    
    
    func classifyData(_ data: ClassificationData,
                      completionHandler: @escaping ClassifyDataEntityCompletionHandler) {
        
        let request = VNCoreMLRequest(model: model) { (request, error) in
            guard let classifications = request.results as? [VNClassificationObservation] else {
                return
            }
            
            if classifications.isEmpty {
                // Handle empty
            } else {
                let topPrediction = classifications[0]
                let result = ClassificationResult(identifier: topPrediction.identifier,
                                                  confidence: topPrediction.confidence)
                completionHandler(.success(result))
            }
        
        }
        
        
        let handler = VNImageRequestHandler(ciImage: data.image,
                                            orientation: data.orientation)
        
        do {
            try handler.perform([request])
        } catch {
            print(error.localizedDescription)
        }
        
        
    }
    
}
