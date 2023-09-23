//
//  URLRequestErrorResolvable.swift
//  clean-mvvmc-master
//
//  Created by Developer on 23/09/2023.
//

import Foundation

protocol URLRequestErrorResolvable {
    
    associatedtype RequestErrorType: Error
    
    func resolve(error: Error) -> RequestErrorType
    func resolve(requestError: Error, response: URLResponse?, with data: Data?) -> RequestErrorType
}
