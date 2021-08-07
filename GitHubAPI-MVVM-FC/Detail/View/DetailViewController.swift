//
//  DetailViewController.swift
//  GitHubAPI-MVVM-FC
//
//  Created by Lê Hoàng Sinh on 9/7/20.
//  Copyright © 2020 Lê Hoàng Sinh. All rights reserved.
//

import UIKit
import JGProgressHUD

class DetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: DetailViewModel!
    
    
    var spinner = JGProgressHUD()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib.init(nibName: "DetailCell", bundle: nil)
        let nib2 = UINib.init(nibName: "DetailCell2", bundle: nil)
        let nib3 = UINib.init(nibName: "DetailCell3", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell1")
        tableView.register(nib2, forCellReuseIdentifier: "cell2")
        tableView.register(nib3, forCellReuseIdentifier: "cell3")
        tableView.delegate = self
        tableView.dataSource = self
        viewModel.getDatas()
       spinner.show(in: view)
        
        viewModel.requestClosure = { [weak self] istrue in
            self?.tableView.reloadData()
            self?.spinner.dismiss()
        }
    }

}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let item = viewModel.itemResults
        let owner = viewModel.ownerResults
        
        if indexPath.row == 0 {
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "cell1") as! DetailCell1
            cell1.viewModel.getData(item: item, owner: owner)
            viewModel.getImage(indexPath: indexPath.row)
            viewModel.imageClosure = { data in
                cell1.viewModel.getImage(data: data)
            }
            
            return cell1
        }
        if indexPath.row == 1 {
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "cell2") as! DetailCell2
            cell1.viewModel.getData(item: item, owner: owner)
            return cell1
        }
        if indexPath.row == 2 {
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "cell3") as! DetailCell3
            cell1.viewModel.getData(item: item, owner: owner)
            return cell1
        }
        
        return cell
    }
    
    
}
