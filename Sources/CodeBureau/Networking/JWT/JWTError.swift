//
//  JWTError.swift
//  clean-mvvmc-master
//
//  Created by Developer on 22/09/2023.
//

import Foundation

enum JWTError: Error {
    
    case verification(String)
    case signing(String)
    case serialization(String)
    case invalidJWTString
    case invalidKeyID
    case failedVerification
    case invalidUTF8Data
    case osVersionToLow
    case invalidSecretKey
}
