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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ObjectDetectionModuleAssembly.instance().inject(into: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewIsReady()
    }

}

extension ObjectDetectionViewController: ObjectDetectionView {
    
}
