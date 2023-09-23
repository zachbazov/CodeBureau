//
//  ResponseDecodable.swift
//
//
//  Created by Developer on 23/09/2023.
//

import Foundation

public protocol ResponseDecodable {
    var responseDecoder: ResponseDecodable? { get }
}
