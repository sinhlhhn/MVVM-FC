//
//  DeepLink.swift
//  GitHubAPI-MVVM-FC
//
//  Created by Lê Hoàng Sinh on 9/14/20.
//  Copyright © 2020 Lê Hoàng Sinh. All rights reserved.
//

import Foundation

class DeepLink {
    static func handleDeepLink(url: URL,completion: @escaping (String)->Void) {
        
        if let urlComponent = URLComponents(url: url, resolvingAgainstBaseURL: true) {
            let path = urlComponent.path
            var url = "https://api.github.com" + path
            if let queryItem = urlComponent.queryItems {
                for i in queryItem {
                    if let value = i.value {
                        url += "/\(value)"
                    }
                }
            }
            print(url)
            completion(url)
        }else {
            completion("invalid")
            print("invalid user")
        }
    }
}
