//
//  ViewModelType.swift
//
//  Created by joseewu
//

import Foundation

protocol Dependency {
    associatedtype Dependency
    init(with Dependency:Dependency)
}

protocol ServerConnection:Dependency {
//ServerConnection that need to be confirm
}
protocol InjectParameter:Dependency {
//InjectParameter that need to
}
