//
//  ResponseDecodable.swift
//
//
//  Created by Developer on 23/09/2023.
//

import Foundation

protocol ResponseDecodable {
    var responseDecoder: ResponseDecodable? { get }
    
    func decode<T>(_ data: Data) throws -> T where T: Decodable
}
