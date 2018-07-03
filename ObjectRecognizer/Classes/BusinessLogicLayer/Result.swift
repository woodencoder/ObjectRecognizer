//
//  Result.swift
//  ObjectRecognizer
//
//  Created by vladislav klimenko on 26/05/2018.
//  Copyright © 2018 Wooden Co. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(Error)
    
    public func dematerialize() throws -> T {
        switch self {
        case let .success(value):
            return value
        case let .failure(error):
            throw error
        }
    }
}
