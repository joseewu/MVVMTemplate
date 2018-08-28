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
    }
    required init(dependency: MainViewModel.Dependency, bindings: MainViewModel.Bindings) {
        bindings.tap.subscribe(onNext: { _ in
            print("tap!!!")
        }).disposed(by: disposeBag)
    }
}
