//
//  DataTransferErrorResolvable.swift
//
//
//  Created by Developer on 23/09/2023.
//

import Foundation

public protocol DataTransferErrorResolvable {
    func resolve(urlRequestError error: URLRequestError) -> DataTransferError
}
