//
//  ViewAnimator.swift
//  
//
//  Created by Developer on 13/10/2023.
//

import UIKit

// MARK: - ViewAnimator Type

public struct ViewAnimator: ViewAnimatable, ViewAnimationExecutable, AnimationChainable {
    
    public var preparations: (() -> Void)?
    public var operations: (() -> Void)?
    
    
    internal func prepare() {
        preparations?()
    }
    
    internal func operate() {
        operations?()
    }
    
    public func execute() {
        prepare()
        operate()
    }
}
