//
//  ViewModel.swift
//  MVVMSample
//
//  Created by 桐山圭祐 on 2017/11/18.
//  Copyright © 2017年 桐山圭祐. All rights reserved.
//

import Foundation
import RxSwift

class ViewModel {
    
    var models: Variable<[Model]>
    let disposeBag = DisposeBag()
    
    var count: Int {
        return models.value.count
    }
    
    var urls: [URL?] {
        return models.value.map({ URL(string: $0.url) ?? nil })
    }
    
    
    init() {
        models = Variable<[Model]>([])
    }
    
    func reloadData() {
        Service.reloadData().subscribe(onNext: { models in
            self.models.value = models
        }, onError: { error in
            print(error)
        }).disposed(by: disposeBag)
    }
}
