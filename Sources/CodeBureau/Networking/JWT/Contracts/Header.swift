//
//  Header.swift
//  clean-mvvmc-master
//
//  Created by Developer on 21/09/2023.
//

import Foundation

struct Header: Codable {
    
    /// Type Header Parameter
    var typ: String?
    /// Algorithm Header Parameter
    var alg: String?
    /// JSON Web Token Set URL Header Parameter
    var jku : String?
    /// JSON Web Key Header Parameter
    var jwk: String?
    /// Key ID Header Parameter
    var kid: String?
    /// Content Type Header Parameter
    var cty: String?
    /// Critical Header Parameter
    var crit: [String]?
    
    /// Initialize a `Header` instance.
    ///
    /// - Parameter typ: The Type Header Parameter
    /// - Parameter jku: The JSON Web Token Set URL Header Parameter
    /// - Parameter jwk: The JSON Web Key Header Parameter
    /// - Parameter kid: The Key ID Header Parameter
    /// - Parameter cty: The Content Type Header Parameter
    /// - Parameter crit: The Critical Header Parameter
    /// - Returns: A new instance of `Header`.
    init(
        typ: String? = "JWT",
        jku: String? = nil,
        jwk: String? = nil,
        kid: String? = nil,
        cty: String? = nil,
        crit: [String]? = nil
    ) {
        self.typ = typ
        self.alg = nil
        self.jku = jku
        self.jwk = jwk
        self.kid = kid
        self.cty = cty
        self.crit = crit
    }
    
    func encode() throws -> String  {
        let jsonEncoder = JSONEncoder()
        jsonEncoder.dateEncodingStrategy = .secondsSince1970
        
        let data = try jsonEncoder.encode(self)
        
        return JWTEncoder.base64urlEncodedString(data: data)
    }
}
