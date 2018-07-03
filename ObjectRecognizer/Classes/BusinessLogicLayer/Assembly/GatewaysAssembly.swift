//
//  GatewaysAssembly.swift
//  ObjectRecognizer
//
//  Created by vladislav klimenko on 26/05/2018.
//  Copyright © 2018 Wooden Co. All rights reserved.
//

import Foundation
import EasyDi

final class GatewaysAssembly: Assembly {
    
    var imagesGateway: ImagesGateway {
        return define(
            scope: .prototype,
            init: ImagesGatewayImpl()
        )
    }
}
