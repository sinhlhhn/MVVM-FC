//
//  DetailViewModel.swift
//  GitHubAPI-MVVM-FC
//
//  Created by Lê Hoàng Sinh on 9/7/20.
//  Copyright © 2020 Lê Hoàng Sinh. All rights reserved.
//

import Foundation

class DetailViewModel {
    
    var flowController: DetailFlowController!
    var swapi: ResponseAPI!
    
    var imageClosure: ((Data)->Void)?
    
    var url: String!
    var id: String!
    
    var requestClosure : ((Bool) -> Void)?
    
    var itemResults = Item()
    var ownerResults = Owner()
    
    var count = 0
    
    init(flowController: DetailFlowController,swapi: ResponseAPI) {
        self.flowController = flowController
        self.swapi = swapi
    }

    func getDatas() {
        swapi.getDatas(url: self.url) {[weak self] (items, owners) in
            self?.itemResults = items
            self?.ownerResults = owners
            guard let requestClosure = self?.requestClosure else { return }
            self?.count = 3
            requestClosure(true)
            
        }
    }
    
    func getImage(indexPath: Int) {
        let str = ownerResults.avatar_url
        guard let url = str else { return }
        swapi.getResponse(url: url) {[weak self] (data) in
            guard let imageClosure = self?.imageClosure else { return }
            imageClosure(data)
        }
    }
    
}
