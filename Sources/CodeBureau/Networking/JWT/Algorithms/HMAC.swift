//
//  HMAC.swift
//  clean-mvvmc-master
//
//  Created by Developer on 22/09/2023.
//

import Foundation
import CommonCrypto

class HMAC: Updatable {
    
    enum Algorithm {
        case sha256
        
        static let fromNative: [CCHmacAlgorithm: Algorithm] = [
            CCHmacAlgorithm(kCCHmacAlgSHA256): .sha256
        ]
        
        static func fromNativeValue(nativeAlg: CCHmacAlgorithm) -> Algorithm? {
            return fromNative[nativeAlg]
        }
        
        func nativeValue() -> CCHmacAlgorithm {
            switch self {
            case .sha256:
                return CCHmacAlgorithm(kCCHmacAlgSHA256)
            }
        }
        
        func digestLength() -> Int {
            switch self {
            case .sha256:
                return Int(CC_SHA256_DIGEST_LENGTH)
            }
        }
    }
    
    // MARK: Context
    
    typealias Context = UnsafeMutablePointer<CCHmacContext>
    
    
    private let context = Context.allocate(capacity: 1)
    
    var status: Status = .success
    
    private var algorithm: Algorithm
    
    // MARK: Lifecycle Methods
    
    init(using algorithm: Algorithm, key: Data) {
        self.algorithm = algorithm
        
        key.withUnsafeBytes() {
            CCHmacInit(context, algorithm.nativeValue(), $0.baseAddress, size_t(key.count))
        }
    }
    
    init(using algorithm: Algorithm, key: NSData) {
        self.algorithm = algorithm
        
        CCHmacInit(context, algorithm.nativeValue(), key.bytes, size_t(key.length))
    }
    
    init(using algorithm: Algorithm, key: [UInt8]) {
        self.algorithm = algorithm
        
        CCHmacInit(context, algorithm.nativeValue(), key, size_t(key.count))
    }
    
    init(using algorithm: Algorithm, key: String) {
        self.algorithm = algorithm
        
        CCHmacInit(context, algorithm.nativeValue(), key, size_t(key.lengthOfBytes(using: String.Encoding.utf8)))
    }
    
    deinit {
        #if swift(>=4.1)
        context.deallocate()
        #else
        context.deallocate(capacity: 1)
        #endif
    }
    
    // MARK: Public Methods
    
    func update(from buffer: UnsafeRawPointer, byteCount: size_t) -> Self? {
        
        CCHmacUpdate(context, buffer, byteCount)
        
        return self
    }
    
    func final() -> [UInt8] {
        var hmac = Array<UInt8>(repeating: .zero, count: algorithm.digestLength())
        
        CCHmacFinal(context, &hmac)
        
        return hmac
    }
}
