//
//  ViewModel.swift
//  clean-mvvmc-master
//
//  Created by Developer on 15/09/2023.
//

import UIKit

// MARK: - Coordinator Type

public protocol ViewModel {
    
    associatedtype ModelType
    
    
    init(with model: ModelType)
}
