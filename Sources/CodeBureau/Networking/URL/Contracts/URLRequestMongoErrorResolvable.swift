//
//  URLRequestMongoErrorResolvable.swift
//  clean-mvvmc-master
//
//  Created by Developer on 23/09/2023.
//

import Foundation

public protocol URLRequestMongoErrorResolvable {
    
    associatedtype ResponseType: Decodable
    
    func resolve(statusCode: URLResponseCode, data: Data?) -> ResponseType?
}
