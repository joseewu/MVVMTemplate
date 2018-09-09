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

    var bindings: MainViewModel.Bindings {
        let tap = refreshButton.rx.tap.asObservable()
        let hhh = Bindable<Action>(refreshButton)

        return MainViewModel.Bindings(tap: tap)
    }

    func bind(viewModel: MainViewModel) -> MainViewModel {
        viewModel.showTrigger.observeOn(MainScheduler.instance).subscribe({ [weak self] _ in
            self?.connect(.showImage, with: nil)
        }).disposed(by: disposeBag)
        return viewModel
    }
    enum connectionId: CodingKey {
        case showImage
    }
    typealias ViewModel = MainViewModel

    @IBOutlet weak var refreshButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor("xccc")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

