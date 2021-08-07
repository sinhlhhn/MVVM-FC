//
//  Result.swift
//  GitHubAPI-MVVM-FC
//
//  Created by Lê Hoàng Sinh on 9/7/20.
//  Copyright © 2020 Lê Hoàng Sinh. All rights reserved.
//

import Foundation

struct Result:Codable {
    var total_count: Int = 0
    var items:[Item]?
}
