//
//  ViewController.swift
//  MVVMTemplate
//
//  Created by joseewu on 2018/8/27.
//  Copyright © 2018年 com.js. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController,ViewModelAttaching,Connectable {
    var disposeBag: DisposeBag!

    typealias SegueIdentifier = connectionId

    var viewModel: MainViewModel!

    func bind(viewModel: MainViewModel) -> MainViewModel {
        return viewModel
    }
    enum connectionId: CodingKey {
        case showImage
    }
    typealias ViewModel = MainViewModel

    @IBOutlet weak var refreshButton: UIButton!
    var bindings: MainViewModel.Bindings {
        let tap = refreshButton.rx.tap.asObservable()
        let action = Action(refreshButton, events: .touchUpInside)

        return MainViewModel.Bindings(tap: tap, testAction: action)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.lightGray
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

