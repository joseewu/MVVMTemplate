//
//  User.swift
//  MVVMTemplate
//
//  Created by joseewu on 2018/12/2.
//  Copyright © 2018 com.js. All rights reserved.
//

import Foundation

private enum CodingKeys:String, CodingKey {
    case userId = "id"
    case userName = "userName"
}
struct User:Codable {
    let userId:String?
    let userName:String?
}
extension User {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        userId = try? container.decode(String.self, forKey: .userId)
        userName = try? container.decode(String.self, forKey: .userId)
    }
}
extension User {
    func encode(to encoder: Encoder) throws {

    }
}
