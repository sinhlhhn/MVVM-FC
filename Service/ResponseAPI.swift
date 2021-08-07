//
//  RequsetAPI.swift
//  GitHubAPI-MVVM-FC
//
//  Created by Lê Hoàng Sinh on 9/9/20.
//  Copyright © 2020 Lê Hoàng Sinh. All rights reserved.
//

import Foundation
import Alamofire

class ResponseAPI {
    
    
    public func getResponse(url: String, completion: @escaping (Data)->Void) {
        URLSession.shared.dataTask(with: URL(string: url)!) { (data, res, err) in
            guard let data = data, err == nil  else { return }
            completion(data)
        }.resume()
    }
    
    public func getDatas(key: String,completion: @escaping ([Item],[Owner])->Void) {
        AF.request("https://api.github.com/search/repositories?q=\(key)").responseJSON { (data) in
            guard let data = data.data else { return }
            let decoder = JSONDecoder()
            do {
                let result = try decoder.decode(Result.self, from: data)
                guard let items = result.items else {
                    return
                }
                var owners = [Owner]()
                for i in 0..<items.count {
                    guard let owner = items[i].owner else {
                        return
                    }
                    owners.append(owner)
                }
                completion(items,owners)

            }catch {
                print("Failed to get data")
            }
        }
    }
     public func getDatas(url: String,completion: @escaping (Item,Owner)->Void) {
            AF.request(url).responseJSON { (data) in
                guard let data = data.data else { return }
                let decoder = JSONDecoder()
                do {
                    let items = try decoder.decode(Item.self, from: data)
                    guard let owners = items.owner else { return }
                    completion(items,owners)
                }catch {
                    print("Failed to get data")
                }
            }
        }
}
