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
private struct Keys {
    static var EventHandlers = "_EventHandlers"
}
class Action<T:UIControl> {
    typealias Subscripion = ((T) -> Void)
    private var subscripion:Subscripion?
    var _value:T
    var _events:UIControlEvents {
        didSet {
            subscripion?(_value)
        }
    }

    private var eventHandlers: [ControlEventHandler<T>] {
        get {
            return (objc_getAssociatedObject(self, &Keys.EventHandlers) as? [ControlEventHandler<T>]) ?? []
        }
        set {
            objc_setAssociatedObject(self, &Keys.EventHandlers, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
    func bind(_ subscripion: Subscripion?) {
        self.subscripion = subscripion
    }
    func subscribe(_ sub: @escaping Subscripion) {
        self.subscripion = sub
        let handler = ControlEventHandler<T>(sender: _value, events: _events, closure: subscripion!)
        self.eventHandlers.append(handler)
    }
    init(_ value: T, events: UIControlEvents) {
        self._value = value
        self._events = events
    }
}

private final class ControlEventHandler<Sender: UIControl>: NSObject {
    let closure: (Sender) -> Void
    init(sender: Sender, events: UIControlEvents, closure: @escaping (Sender) -> Void) {
        self.closure = closure
        super.init()
        sender.addTarget(self, action: #selector(self.action), for: events)
    }
    @objc private func action(sender: UIControl) {
        guard let sender = sender as? Sender else { return }
        self.closure(sender)
    }
}
