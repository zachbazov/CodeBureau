//
//  ViewController.swift
//  clean-mvvmc-master
//
//  Created by Developer on 15/09/2023.
//

import Foundation

// MARK: - ViewControllerObservingBehavior Type

@objc
public protocol ViewControllerObservingBehavior {
    
    @objc optional func viewDidBindObservers()
    @objc optional func viewDidUnbindObservers()
}

// MARK: - ViewControllerLifecycleBehavior Type

@objc
public protocol ViewControllerLifecycleBehavior: ViewControllerObservingBehavior {
    
    @objc optional func viewDidDeploySubviews()
    @objc optional func viewHierarchyDidConfigure()
    @objc optional func viewDidConfigure()
}

// MARK: - ViewController Type

public protocol ViewController: ViewControllerLifecycleBehavior {
    
    associatedtype ViewModelType: ControllerViewModel
    
    var viewModel: ViewModelType? { get }
}
