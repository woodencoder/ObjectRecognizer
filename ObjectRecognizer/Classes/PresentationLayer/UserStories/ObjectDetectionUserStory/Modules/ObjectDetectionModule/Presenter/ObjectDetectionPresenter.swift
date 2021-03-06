//
//  ObjectDetectionPresenter.swift
//  ObjectRecognizer
//
//  Created by vladislav klimenko on 26/05/2018.
//  Copyright © 2018 Wooden Co. All rights reserved.
//

import Foundation

protocol ObjectDetectionPresenter {
    func viewIsReady()
    func didObtainClassificationData(_ data: ClassificationData)
}
