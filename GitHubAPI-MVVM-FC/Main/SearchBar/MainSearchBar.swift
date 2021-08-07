//
//  MainSearchBar.swift
//  GitHubAPI-MVVM-FC
//
//  Created by Lê Hoàng Sinh on 9/7/20.
//  Copyright © 2020 Lê Hoàng Sinh. All rights reserved.
//

import UIKit

class MainSearchBar: UISearchBar, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var viewModel = SearchBarViewModel()
    
}


