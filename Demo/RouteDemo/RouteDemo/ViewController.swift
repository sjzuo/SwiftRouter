//
//  ViewController.swift
//  RouteDemo
//
//  Created by S JZ on 2023/5/25.
//

import UIKit

class ViewController: UIViewController {

    var dataSource = ["跳转第二个页面", "调用第二个页面对象方法", "调用第二个页面类方法"]
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.backgroundColor = UIColor.lightGray
        
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.title = "第一个页面"
        
        tableView.frame = view.bounds
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "UITableViewCell")
        tableView.register(TableViewCell.classForCoder(), forCellReuseIdentifier: "TableViewCell")
        
        view.addSubview(tableView)
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else {
            return UITableViewCell(style: .default, reuseIdentifier: "UITableViewCell")
        }
        
        cell.titleStr = dataSource[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            Router.shared.push("SJZViewController")
        }else if indexPath.row == 1 {
            if let viewController = Router.shared.createObject("SJZViewController") {
                // 已经知道对象，可以不用Router，直接调用objectAction方法
                // 例如：viewController.objectAction(type: nil, params: nil)
                if let titleStr = Router.shared.objectAction(object: viewController) as? String {
                    debugPrint(titleStr)
                }
            }
        }else if indexPath.row == 2 {
            if let titleStr = Router.shared.staticAction("SJZViewController") as? String {
                debugPrint(titleStr)
            }
        }
    }
}

