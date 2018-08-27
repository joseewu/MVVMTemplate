//
//  ViewModelType.swift
//  DramaTV
//
//  Created by joseewu on 2018/3/2.
//  Copyright © 2018年 com.chocolabs.dramacrazy. All rights reserved.
//

import Foundation

protocol ViewModelType {
    associatedtype Dependency
    associatedtype Bindings
    init(dependency: Dependency, bindings: Bindings)
}

enum Attachable<VM: ViewModelType> {
    case detached(VM.Dependency)
    //case attached(VM.Dependency, VM)
    mutating func bind(_ bindings: VM.Bindings) -> VM {
        switch self {
        case let .detached(dependency):
            let vm = VM(dependency: dependency, bindings: bindings)
            return vm
        }
    }
}
