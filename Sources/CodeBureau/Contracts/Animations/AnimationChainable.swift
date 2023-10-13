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
    func animate(withDuration duration: TimeInterval, delay: TimeInterval, options: UIView.AnimationOptions, animations: @escaping () -> Void) -> Self
    
    func then(duration: TimeInterval, delay: TimeInterval, options: UIView.AnimationOptions, animations: @escaping () -> Void) -> Self
}

public extension AnimationChainable {
    
    @discardableResult
    func animate(withDuration duration: TimeInterval, delay: TimeInterval, options: UIView.AnimationOptions, animations: @escaping () -> Void) -> Self {
        
        UIView.animate(withDuration: duration, delay: delay, options: options, animations: animations, completion: nil)
        
        return self
    }
    
    @discardableResult
    func then(duration: TimeInterval = .zero, delay: TimeInterval, options: UIView.AnimationOptions = [], animations: @escaping () -> Void) -> Self {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration + delay) {
            self.animate(withDuration: duration, delay: delay, options: options, animations: animations)
        }
        
        return self
    }
}
