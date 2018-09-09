//
//  Bindable.swift
//  MVVMTemplate
//
//  Created by joseewu on 2018/9/9.
//  Copyright © 2018年 com.js. All rights reserved.
//

import UIKit
import Foundation

class Bindable<T> {
    typealias Subscripion = ((T) -> Void)
    private var subscripion:Subscripion?
    var _value:T {
        didSet {
            subscripion?(_value)
        }
    }
    //just binding
    func bind(_ subscripion: Subscripion?) {
        self.subscripion = subscripion
    }
    //bind and start emmit the value
    func subscribe(_ subscripion: Subscripion?) {
        self.subscripion = subscripion
        subscripion?(_value)
    }
    init(_ value:T) {
        self._value = value
    }
}
