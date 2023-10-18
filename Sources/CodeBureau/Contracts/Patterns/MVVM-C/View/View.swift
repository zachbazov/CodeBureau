//
//  View.swift
//  clean-mvvmc-master
//
//  Created by Developer on 15/09/2023.
//

import UIKit

// MARK: - View Type

public protocol View: UIView {
    
    associatedtype ViewModelType: ViewModel
    
    var viewModel: ViewModelType? { get }
    
    
    init(on parent: UIView, with viewModel: ViewModelType)
    
    
    func updateView(with viewModel: ViewModelType?)
}
