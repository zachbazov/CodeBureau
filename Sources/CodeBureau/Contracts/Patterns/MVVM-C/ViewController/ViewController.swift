//
//  ViewController.swift
//  clean-mvvmc-master
//
//  Created by Developer on 15/09/2023.
//

import Foundation

// MARK: - Coordinator Type

public protocol ViewController {
    
    associatedtype ViewModelType: ControllerViewModel
    
    var viewModel: ViewModelType? { get }
}
