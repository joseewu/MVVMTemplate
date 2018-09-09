//
//  MainViewModel.swift
//  MVVMTemplate
//
//  Created by joseewu on 2018/8/27.
//  Copyright © 2018年 com.js. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class MainViewModel:ViewModelType {
    private let disposeBag:DisposeBag = DisposeBag()
    struct Dependency {

    }
    struct Bindings {
        let tap:Observable<Void>
        let testAction:Action<UIButton>
    }
    let showTrigger:Observable<Void>
    let showTrigger2:Action<UIButton>
    required init(dependency: MainViewModel.Dependency, bindings: MainViewModel.Bindings) {
        showTrigger = bindings.tap
        showTrigger2 = bindings.testAction
        showTrigger2.subscribe { (nut) in
            print("jdifjsidfjis")
        }
    }
}
