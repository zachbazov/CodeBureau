//
//  AnimationChainable.swift
//  
//
//  Created by Developer on 13/10/2023.
//

import UIKit

// MARK: - AnimationChainable Type

public protocol AnimationChainable {
    
    @discardableResult
    func animate(withDuration duration: TimeInterval,
                 delay: TimeInterval,
                 options: UIView.AnimationOptions,
                 animations: (() -> Void)?,
                 completion: (() -> Void)?) -> Self
    
    func then(duration: TimeInterval,
              delay: TimeInterval,
              options: UIView.AnimationOptions,
              animations: (() -> Void)?,
              completion: (() -> Void)?) -> Self
}

// MARK: - AnimationChainable Implementation

public extension AnimationChainable {
    
    @discardableResult
    func animate(withDuration duration: TimeInterval,
                 delay: TimeInterval,
                 options: UIView.AnimationOptions,
                 animations: (() -> Void)? = nil,
                 completion: (() -> Void)? = nil) -> Self {
        
        UIView.animate(withDuration: duration,
                       delay: .zero,
                       options: options,
                       animations: {
            animations?()
        },
                       completion: { _ in
            completion?()
        })
        
        return self
    }
    
    @discardableResult
    func then(duration: TimeInterval = .zero,
              delay: TimeInterval,
              options: UIView.AnimationOptions = [],
              animations: (() -> Void)? = nil,
              completion: (() -> Void)? = nil) -> Self {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            self.animate(withDuration: duration,
                         delay: .zero,
                         options: options,
                         animations: animations,
                         completion: completion)
        }
        
        return self
    }
}
