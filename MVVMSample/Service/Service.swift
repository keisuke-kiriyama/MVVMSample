//
//  Service.swift
//  MVVMSample
//
//  Created by 桐山圭祐 on 2017/11/18.
//  Copyright © 2017年 桐山圭祐. All rights reserved.
//

import Foundation
import RxSwift
import SWXMLHash

class Service {
    
    class func reloadData() -> Observable<[Model]> {
        return Observable.create{ observer -> Disposable in
            guard let url = URL(string: "https://thecatapi.com/api/images/get?format=xml&results_per_page=51&size=big") else {
                return Disposables.create()
            }
            let session = URLSession(configuration: .default)
            session.dataTask(with: url) { data, _, error in
                if let error = error {
                    observer.onError(error as Error)
                } else if let data = data {
                    let xml = SWXMLHash.parse(data)
                    let modelData = xml["response"]["data"]["images"]["image"].all
                        .flatMap { (id: $0["id"].element?.text ?? "", url: $0["url"].element?.text ?? "") }
                        .map { Model(id: $0.id, url: $0.url) }
                    observer.onNext(modelData)
                }
                observer.onCompleted()
            }.resume()
            return Disposables.create()
        }
    }
    
}
