//
//  ObjectDetectionModuleAssembly.swift
//  ObjectRecognizer
//
//  Created by vladislav klimenko on 26/05/2018.
//  Copyright © 2018 Wooden Co. All rights reserved.
//

import Foundation
import EasyDi

class ObjectDetectionModuleAssembly: Assembly {
    
    var view: ObjectDetectionView {
        return definePlaceholder()
    }
    
    var presenter: ObjectDetectionPresenter {
        return define(scope: .prototype,
                      init: ObjectDetectionPresenterImpl(
                        view: self.view)
        )
    }
    
    func inject(into viewController: ObjectDetectionViewController) {
        return defineInjection(key: "view", into: viewController) {
            $0.presenter = self.presenter
            return $0
        }
    }
    
}
