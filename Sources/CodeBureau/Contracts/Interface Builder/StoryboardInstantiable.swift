//
//  StoryboardInstantiable.swift
//
//
//  Created by Developer on 13/10/2023.
//

import UIKit

// MARK: - StoryboardInstantiable Type

public protocol StoryboardInstantiable {
    static var xib: UIViewController? { get }
}
