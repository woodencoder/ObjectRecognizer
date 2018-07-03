//
//  UseCasesAssembly.swift
//  ObjectRecognizer
//
//  Created by vladislav klimenko on 26/05/2018.
//  Copyright © 2018 Wooden Co. All rights reserved.
//

import Foundation
import EasyDi

final class UseCasesAssembly: Assembly {
    
    lazy var gatewaysAssembly: GatewaysAssembly = self.context.assembly()
    
    
    var classifyDataUseCase: ClassifyDataUseCase {
        return define(
            scope: .prototype,
            init: ClassifyDataUseCaseImpl(imagesGateway: self.gatewaysAssembly.imagesGateway)
        )
    }
    
}
