//
//  MainViewFlowController.swift
//  GitHubAPI-MVVM-FC
//
//  Created by Lê Hoàng Sinh on 9/7/20.
//  Copyright © 2020 Lê Hoàng Sinh. All rights reserved.
//

import UIKit

class MainFlowController {
    
    var navigationController: UINavigationController!
    var dependence: Dependence!
    
    init(navigationController: UINavigationController,dependence: Dependence) {
        self.navigationController = navigationController
        self.dependence = dependence
    }
    
    func showDetail(url: String)  {
        DetailFactory.pushIn(navigationController: navigationController, dependence: dependence,url: url)
    }
    
}
