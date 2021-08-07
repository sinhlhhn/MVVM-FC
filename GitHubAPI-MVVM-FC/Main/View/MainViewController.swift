//
//  ViewController.swift
//  GitHubAPI-MVVM-FC
//
//  Created by Lê Hoàng Sinh on 9/7/20.
//  Copyright © 2020 Lê Hoàng Sinh. All rights reserved.
//

import UIKit
import JGProgressHUD

class MainViewController: UIViewController {

    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var tableView : UITableView!

    var viewModel : MainViewModelType!
    
    init() {
        super.init(nibName: "Main", bundle: nil)
    }
    
    init(viewModel: MainViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: "Main", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var t = false
//    var viewModel: MainViewModelType!
    let spinner = JGProgressHUD()
    
    var searchBar = MainSearchBar(frame: CGRect.init(x: 0, y: 0, width: 414, height: 56))
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        searchBar.becomeFirstResponder()
        
        setupTable()
        
        viewModel.requestClosure = { [weak self] istrue in
            self?.t = true
//            self?.tableView.reloadData()
            self?.spinner.dismiss()
        }   
    }

    func setupTable() {
        let nib = UINib(nibName: "Cell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.tableHeaderView = searchBar
        tableView.keyboardDismissMode = .onDrag
        
        
        lblResult.text = "Not found"
        lblResult.isHidden = true
//        searchBarView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
//        searchBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
//        searchBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
    }
}

extension MainViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.itemResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MainCell
        
        let items = viewModel.itemResults[indexPath.row]
        let name = items.name
        let fullName = items.full_name
        let star = items.stargazers_count
        
        cell.viewModel.setData(name: name!, fullName: fullName!, star: star!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = viewModel.itemResults[indexPath.row]
        viewModel.selected(url: item.url!)
        searchBar .resignFirstResponder()
    }
    
}

extension MainViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text?.lowercased(), !text.replacingOccurrences(of: " ", with: "").isEmpty else {
            return
        }
        spinner.show(in: view)
        
        viewModel.getDatas(key: text)
    }

}

