//
//  BodyDecoder.swift
//  clean-mvvmc-master
//
//  Created by Developer on 21/09/2023.
//

import Foundation

public protocol BodyDecoder: AnyObject {
    /// Decode a `Decodable` type from a `Data`, using this `BodyDecoder`.
    func decode<T: Decodable>(_ type: T.Type, from data: Data) throws -> T
}

extension JSONDecoder: BodyDecoder {}
