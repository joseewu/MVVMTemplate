//
//  ViewModelAttachable.swift
//
//  Created by joseewu
//

import UIKit
import RxSwift

//protocol ViewModelAttaching: class {
//    associatedtype ViewModel: ViewModelType
//    var disposeBag:DisposeBag!{ get set }
//    var viewModel: ViewModel! { get set }
//    var bindings: ViewModel.Bindings { get }
//    func attach(wrapper: ViewModel.Type,dependency:ViewModel.Dependency) -> ViewModel
//    func bind(viewModel: ViewModel) -> ViewModel
//}

//extension ViewModelAttaching where Self: UIViewController {
//    @discardableResult
//    func attach(wrapper: ViewModel.Type,dependency:ViewModel.Dependency) -> ViewModel {
//        loadViewIfNeeded()
//        let vm = wrapper.init(dependency: dependency, bindings: bindings)
//        self.disposeBag = DisposeBag()
//        self.viewModel = vm
//        return bind(viewModel: vm)
//    }
//}
