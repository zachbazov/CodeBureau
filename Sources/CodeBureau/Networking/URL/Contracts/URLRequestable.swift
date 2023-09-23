//
//  URLRequestable.swift
//  clean-mvvmc-master
//
//  Created by Developer on 23/09/2023.
//

import Foundation

public protocol URLRequestable {
    
    associatedtype RequestMongoErrorType: Decodable
    associatedtype RequestErrorType: Error
    
    func request(endpoint: Requestable,
                 error: ((RequestMongoErrorType) -> Void)?,
                 completion: @escaping (Result<Data?, RequestErrorType>) -> Void) -> URLSessionTaskCancellable?
    
    func request(request: URLRequest,
                 error: ((RequestMongoErrorType) -> Void)?,
                 completion: @escaping (Result<Data?, RequestErrorType>) -> Void) -> URLSessionTaskCancellable
}
