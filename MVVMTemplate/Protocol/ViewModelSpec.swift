//
//  ViewModelSpec.swift
//  Smile
//
//  Created by joseewu on 2018/12/1.
//  Copyright © 2018 com.smile. All rights reserved.
//

import Foundation
protocol ViewModelInputsSpec {
    associatedtype Inputs
    associatedtype InputType:ViewModelInputsSpec
    var inputParas:Inputs {get}
    var inputs:InputType {get}
}
protocol ViewModelOutputsSpec {
    associatedtype Outputs
    associatedtype OutputType:ViewModelOutputsSpec
    var outputParas:Outputs {get}
    var outputs:OutputType {get}
}
