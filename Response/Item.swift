//
//  Item.swift
//  GitHubAPI-MVVM-FC
//
//  Created by Lê Hoàng Sinh on 9/7/20.
//  Copyright © 2020 Lê Hoàng Sinh. All rights reserved.
//

import Foundation

struct Item:Codable {
    var name: String?
    var full_name: String?
    var owner:Owner?
    var description:String?
    var stargazers_count:Int?
    var watchers_count:Int?
    var forks_count:Int?
    var languages_url:String?
    var url: String?
}
