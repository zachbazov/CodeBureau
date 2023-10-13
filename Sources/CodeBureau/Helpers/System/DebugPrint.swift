//
//  DebugPrint.swift
//
//
//  Created by Developer on 23/09/2023.
//

import Foundation

// MARK: - DebugPrint Type

public enum DebugPrint {
    case none
    case linebreak
    case debug
    case success
    case error
    case warning
    case action
    case url
    case network
    case cancelled
}

/// Type-Organized Printer
/// - Parameters:
///   - type: Print's type.
///   - message: Output's message.
public func debugPrint(_ type: DebugPrint, _ message: String) {
    #if DEBUG
    switch type {
    case .none:
        print(message)
    case .linebreak:
        print("\n\(message)")
    case .debug:
        print("\n🐛 \(message)")
    case .success:
        print("\n✅ \(message)")
    case .error:
        print("\n🚨 \(message)")
    case .warning:
        print("\n⚠️ \(message)")
    case .action:
        print("\n⚡️ \(message)")
    case .url:
        print("\n🔗 \(message)")
    case .network:
        print("🌐 \(message)")
    case .cancelled:
        print("\n💥 \(message)")
    }
    #endif
}

