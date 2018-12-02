//
//  ObservableCodableExtension.swift
//
//  Copyright © 2018 com.js. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire
import RxAlamofire
import Reachability


enum ResponseError:Error {
    case noData
    case noResponse
    case serverError
}
enum RequestError:Error {
    case noConnection
    case noRequest
    case wrongRequestDomain
}
extension ObservableType where E == DataResponse<Any> {
    func mapResponse<T>(_ type: T.Type) -> Observable<T> where T: Codable {
        return self.flatMapLatest({ (response) -> Observable<T> in
            guard let data = response.data else {
                throw ResponseError.noData
            }
            let josnDecoder = JSONDecoder()
            do {
                let object = try josnDecoder.decode(T.self, from:data)
                return Observable.just(object)
            } catch {
                throw ResponseError.noData
            }
        })
    }
}
extension ObservableType where E == DataRequest {
    func checkNetWorkStatus() -> Observable<Bool> {
        return self.flatMapLatest({ (request) -> Observable<Bool> in
            guard let reachability = Reachability() else {
                throw RequestError.noConnection
            }
            switch reachability.connection {
            case .cellular:
                return Observable.just(true)
            case .none:
                return Observable.just(false)
            case .wifi:
                return Observable.just(true)
            }
        })
    }
}
