//
//  Wrapper.swift
//  MVVMTemplate
//
//  Created by joseewu on 2018/12/2.
//  Copyright © 2018 com.js. All rights reserved.
//

import Foundation


struct Wrapper<T:Collection&Codable>: Codable {

    private enum WrapperKeys:CodingKey {
        case data(info:String)
        var stringValue: String {
            switch self {
            case .data(let info):
                return info
            }
        }

        var intValue: Int? {
            switch self {
            case .data:
                return 0
            }
        }

        init?(stringValue: String) {
            self = .data(info: stringValue)
        }

        init?(intValue: Int) {
            self = .data(info: "")
        }

    }
    let data:T?
}
extension Wrapper {
    init(from decoder: Decoder,_ dataKey:String) throws {
        let container = try decoder.container(keyedBy: WrapperKeys.self)
        do {
            data = try container.decode(T.self, forKey: WrapperKeys.data(info: dataKey))
        } catch let error {
            print(error)
            data = nil
        }
    }
}
