//
//  Reusable.swift
//  MVVMTemplate
//
//  Created by joseewu on 2018/8/28.
//  Copyright © 2018年 com.js. All rights reserved.
//

import UIKit

protocol Reusable {
    static var reuseID: String {get}
}

extension Reusable {
    static var reuseID: String {
        return String(describing: self)
    }
}

extension UIStoryboardSegue:Reusable {}
extension UIViewController:Reusable {
    class func convenienceInit(_ storyboardName:String = "Main") -> Self {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateViewController()
    }
}
extension UIStoryboard {
    func instantiateViewController<T: UIViewController>() -> T {
        guard let viewController = self.instantiateViewController(withIdentifier: T.reuseID) as? T else {
            fatalError("can't find controller : \(T.self)")
        }
        return viewController
    }
}
