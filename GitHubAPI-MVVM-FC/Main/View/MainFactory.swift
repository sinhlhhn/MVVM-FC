//
//  MainViewFactory.swift
//  GitHubAPI-MVVM-FC
//
//  Created by Lê Hoàng Sinh on 9/7/20.
//  Copyright © 2020 Lê Hoàng Sinh. All rights reserved.
//

import UIKit

class MainFactory {
    
    static func RootIn(navigationController: UINavigationController, dependence: Dependence) {
       
        let viewController = MainViewController.init()
        let flowController = MainFlowController(navigationController: navigationController,dependence: dependence)
        
//        let viewModel = MainViewModel(flowController: flowController,swapi: dependence.swapi)
        let viewModel: MainViewModelType = MainViewModel(flowController: flowController, swapi: dependence.swapi)
        viewController.viewModel = viewModel
         
        navigationController.viewControllers = [viewController]
    }
    
}
