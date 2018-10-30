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

class MainViewModel:Bindings {
    var output: MainViewModel.Output!

    struct Input {
        let tap:Observable<Void>
        let testAction:Action<UIButton>
    }
    struct Output {
        let showTrigger:Observable<Void>
        let showTrigger2:Action<UIButton>
    }
    func bind(with input: MainViewModel.Input) {
        output = MainViewModel.Output(showTrigger: input.tap, showTrigger2: input.testAction)

    }
    private let disposeBag:DisposeBag = DisposeBag()

}
