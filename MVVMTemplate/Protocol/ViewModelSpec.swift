//
//  ViewModelSpec.swift
//
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
