//
//  URLResponseDecodable.swift
//
//
//  Created by Developer on 23/09/2023.
//

import Foundation

public protocol URLResponseDecodable {
    func decode<T>(_ data: Data) throws -> T where T: Decodable
}
