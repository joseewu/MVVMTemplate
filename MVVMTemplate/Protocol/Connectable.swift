//
//  Connectable.swift
//
//  Created by joseewu
//
//  see:https://www.natashatherobot.com/protocol-oriented-segue-identifiers-swift/ for more details

import UIKit

protocol Connectable {
    associatedtype SegueIdentifier: CodingKey
}
extension Connectable where Self:UIViewController, SegueIdentifier: CodingKey { 
    func connect(_ identifier:SegueIdentifier, with sender:AnyObject?) {
        performSegue(withIdentifier: identifier.stringValue, sender: sender)
    }
    func connection(for segue: UIStoryboardSegue) -> SegueIdentifier {
        guard let identifier = segue.identifier, let segueIdentifier = SegueIdentifier(stringValue: identifier) else {
                fatalError("Invalid segue identifier \(String(describing: segue.identifier)).") }

        return segueIdentifier
    }
}
