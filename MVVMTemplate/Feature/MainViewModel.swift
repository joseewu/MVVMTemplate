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

class MainViewModel:ViewModelInputsSpec {
    var inputParas: MainViewModel.Inputs {
        return Inputs(testAction: Action<UIButton>(UIButton(), events: .allTouchEvents))
    }

    var inputs: MainViewModel {
        return self
    }


    typealias InputType = MainViewModel

    var output: MainViewModel.Output!

    struct Inputs {
        let testAction:Action<UIButton>
    }
    struct Output {
        let showTrigger:Observable<Void>
        let showTrigger2:Action<UIButton>
    }
    private let disposeBag:DisposeBag = DisposeBag()

}
