//
//  ViewModelType.swift
//
//  Created by joseewu
//

import Foundation

protocol ViewModelType {
    associatedtype Dependency
    associatedtype Bindings
    init(dependency: Dependency, bindings: Bindings)
}
