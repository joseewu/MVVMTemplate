//
//  Button+Extension.swift
//  MVVMTemplate
//
//  Created by joseewu on 2018/9/9.
//  Copyright © 2018年 com.js. All rights reserved.
//

import UIKit
protocol Action: class { }
extension UIControl: Action { }
extension UIBarButtonItem: Action { }

private struct Keys {
    static var EventHandlers = "_EventHandlers"
}
extension Action where Self: UIControl {
    private var eventHandlers: [ControlEventHandler<Self>] {
        get {
            return (objc_getAssociatedObject(self, &Keys.EventHandlers) as? [ControlEventHandler<Self>]) ?? []

        }
        set {
            objc_setAssociatedObject(self, &Keys.EventHandlers, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)

        }
    }
    /// Listen for `UIControlEvents` executing the provided closure when triggered
    func on(_ events: UIControlEvents, call closure: @escaping (Self) -> Void) {
        let handler = ControlEventHandler<Self>(sender: self, events: events, closure: closure)
        self.eventHandlers.append(handler)
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
