//
//  ImagesGateway.swift
//  ObjectRecognizer
//
//  Created by vladislav klimenko on 26/05/2018.
//  Copyright © 2018 Wooden Co. All rights reserved.
//

import Foundation
import CoreImage

typealias ClassifyDataEntityCompletionHandler = ((Result<ClassificationResult>) -> Void)

protocol ImagesGateway {
    func classifyData(_ data: ClassificationData, completionHandler: @escaping ClassifyDataEntityCompletionHandler)
}
