//
//  ValidatePayloadResult.swift
//  clean-mvvmc-master
//
//  Created by Developer on 22/09/2023.
//

import Foundation

struct ValidatePayloadResult: CustomStringConvertible, Equatable {
    
    /// The human readable description of the ValidateClaimsResult
    let description: String
    
    /// Successful validation.
    static let success = ValidatePayloadResult(description: "Success")

    /// Invalid Expiration claim.
    static let invalidExpiration = ValidatePayloadResult(description: "Invalid Expiration claim")
    
    /// Expired token: expiration time claim is in the past.
    static let expired = ValidatePayloadResult(description: "Expired token")
    
    /// Invalid Not Before claim.
    static let invalidNotBefore = ValidatePayloadResult(description: "Invalid Not Before claim")
    
    /// Not Before claim is in the future.
    static let notBefore = ValidatePayloadResult(description: "Token is not valid yet, Not Before claim is greater than the current time")
    
    /// Invalid Issued At claim.
    static let invalidIssuedAt = ValidatePayloadResult(description: "Invalid Issued At claim")
    
    /// Issued At claim is in the future.
    static let issuedAt = ValidatePayloadResult(description: "Issued At claim is greater than the current time")
 
    /// Check if two ValidateClaimsResults are equal. Required for the Equatable protocol
    static func == (lhs: ValidatePayloadResult, rhs: ValidatePayloadResult) -> Bool {
        return lhs.description == rhs.description
    }
}
