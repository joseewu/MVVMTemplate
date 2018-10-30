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

class ViewController: UIViewController,Connectable {
    var disposeBag: DisposeBag!

    typealias SegueIdentifier = connectionId

    var viewModel: MainViewModel = MainViewModel()
    enum connectionId: CodingKey {
        case showImage
    }
    typealias ViewModel = MainViewModel

    @IBOutlet weak var refreshButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.lightGray
        let viewDidAppear:Observable<Void> = rx.methodInvoked(#selector(ViewController.viewDidAppear(_:))).flatMapLatest { _ -> Observable<Void> in
            return Observable.just(())
        }
        let buttonAction:Action<UIButton> = Action.init(refreshButton, events: .touchUpInside)
        let input = MainViewModel.Input.init(tap: viewDidAppear, testAction: buttonAction)
        viewModel.bind(with: input)
        viewModel.output.showTrigger2.subscribe { (btn) in
            print("didTap didTap")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

