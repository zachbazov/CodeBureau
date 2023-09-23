//
//  DataTransferRequestable.swift
//
//
//  Created by Developer on 23/09/2023.
//

import Foundation

public protocol DataTransferRequestable {
    
    associatedtype RequestMongoErrorType: Decodable
    
    func request<T, E>(endpoint: E,
                       error: ((RequestMongoErrorType) -> Void)?,
                       completion: @escaping (Result<T, DataTransferError>) -> Void) -> URLSessionTaskCancellable?
    where T: Decodable,
          E: ResponseRequestable
    
    func request<E>(endpoint: E,
                    completion: @escaping (Result<Void, DataTransferError>) -> Void) -> URLSessionTaskCancellable?
    where E: ResponseRequestable
}
