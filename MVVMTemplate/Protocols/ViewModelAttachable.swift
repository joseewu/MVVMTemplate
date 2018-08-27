//
//  ViewModelAttachable.swift
//  DramaTV
//
//  Created by joseewu on 2018/3/2.
//  Copyright © 2018年 com.chocolabs.dramacrazy. All rights reserved.
//

import UIKit
import RxSwift

protocol ViewModelAttaching: class {
    associatedtype ViewModel: ViewModelType
    var viewModel: ViewModel! { get set }
    var bindings: ViewModel.Bindings { get }
    func attach(wrapper: ViewModel.Type,dependency:ViewModel.Dependency) -> ViewModel
    func bind(viewModel: ViewModel) -> ViewModel
}

extension ViewModelAttaching where Self: UIViewController {
    @discardableResult
    func attach(wrapper: ViewModel.Type,dependency:ViewModel.Dependency) -> ViewModel {
        loadViewIfNeeded()
        let vm = wrapper.init(dependency: dependency, bindings: bindings)
        self.viewModel = vm
        return bind(viewModel: vm)
    }
}
