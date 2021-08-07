//
//  MainViewModel.swift
//  GitHubAPI-MVVM-FC
//
//  Created by Lê Hoàng Sinh on 9/7/20.
//  Copyright © 2020 Lê Hoàng Sinh. All rights reserved.
//

import Foundation
import Alamofire

protocol MainViewModelType {
    var flowController: MainFlowController! { get set }
    var swapi: ResponseAPI! {get set}
    
    var  requestClosure : ((Bool) -> Void)? { get set }
    var itemResults : [Item] {get set }
    var ownerResults : [Owner]{ get set}
    func getDatas(key: String)
    func selected(url: String)
    
}


class MainViewModel: MainViewModelType {
        
    var flowController: MainFlowController!
    var swapi: ResponseAPI!
    
    var requestClosure : ((Bool) -> Void)?
    
    var itemResults = [Item]()
    var ownerResults = [Owner]()
    
    
    init(flowController: MainFlowController,swapi: ResponseAPI) {
        self.flowController = flowController
        self.swapi = swapi
    }
    
    func getDatas(key: String) {
        swapi.getDatas(key: key) {[weak self] (items, owners) in
            self?.itemResults = items
            self?.ownerResults = owners
            guard let requestClosure = self?.requestClosure else { return }
            requestClosure(true)
        }
    }
    
    func selected(url: String) {
        flowController.showDetail(url: url)
    }
    
    
}
