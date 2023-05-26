//
//  SecondViewController.swift
//  RouteDemo
//
//  Created by S JZ on 2023/5/25.
//

import UIKit

class SecondViewController: UIViewController {

    var bgColor: UIColor = .clear
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = bgColor
        
        self.title = "第二个页面"
    }
    
    func getTitleStr() -> String {
        return "我是第二个页面对象方法"
    }
    
    static func staticFunc() -> String {
        return "我是第二个页面的static方法"
    }
}

extension SecondViewController: RouterProtocol {
    // 初始化方法
    static func createInstance(params: [String : Any]?) -> RouterProtocol {
        let second = SecondViewController()
        if let params {
            second.bgColor = (params["bgColor"] as? UIColor) ?? .white
        }
        return second
    }

    // 静态方法、类方法
    static func staticAction(type: Any?, params: [String : Any]?) -> Any? {
        return staticFunc()
    }

    // 对象方法
    func objectAction(type: Any?, params: [String : Any]?) -> Any? {
        return getTitleStr()
    }
}
