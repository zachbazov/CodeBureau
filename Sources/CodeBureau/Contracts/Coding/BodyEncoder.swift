//
//  BodyEncoder.swift
//  clean-mvvmc-master
//
//  Created by Developer on 21/09/2023.
//

import Foundation

protocol BodyEncoder: AnyObject {
    /// Encode an `Encodable` type to a `Data`, using this `BodyEncoder`.
    func encode<T: Encodable>(_ value: T) throws -> Data
}

extension JSONEncoder: BodyEncoder {}
