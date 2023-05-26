//
//  SJZViewController.swift
//  RouteDemo
//
//  Created by S JZ on 2023/5/25.
//

import UIKit

class SJZViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.title = "第二个页面"
    }
    
    func getTitleStr() -> String {
        return "我是第二个页面对象方法"
    }
    
    static func staticFunc() -> String {
        return "我是第二个页面的static方法"
    }
}

extension SJZViewController: RouterProtocol {
    static func createInstance(params: [String : Any]?) -> RouterProtocol {
        return SJZViewController()
    }

    static func staticAction(type: Any?, params: [String : Any]?) -> Any? {
        return staticFunc()
    }

    func objectAction(type: Any?, params: [String : Any]?) -> Any? {
        return getTitleStr()
    }
}
