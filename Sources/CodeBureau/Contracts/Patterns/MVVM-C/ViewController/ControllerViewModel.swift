//
//  ControllerViewModel.swift
//  clean-mvvmc-master
//
//  Created by Developer on 15/09/2023.
//

import Foundation

// MARK: - ControllerViewModel Type

public protocol ControllerViewModel {
    
    associatedtype CoordinatorType: Coordinator
    
    var coordinator: CoordinatorType? { get }
}
