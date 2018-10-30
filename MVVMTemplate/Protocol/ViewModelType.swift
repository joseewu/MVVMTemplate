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
protocol Bindings {
    associatedtype Input
    associatedtype Output
    var output:Output! {get set}
    func bind(with input:Input)
}
