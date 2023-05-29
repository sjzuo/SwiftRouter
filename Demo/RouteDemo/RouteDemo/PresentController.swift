//
//  PresentController.swift
//  RouteDemo
//
//  Created by S JZ on 2023/5/29.
//

import UIKit

class PresentController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "模态试图"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "取消", style: .done, target: self, action: #selector(cancelController))
    }

    @objc func cancelController() {
        dismiss(animated: true)
    }
}

extension PresentController: RouterProtocol {
    // 初始化方法
    static func createInstance(params: [String : Any]?) -> RouterProtocol {
        let second = PresentController()
        return second
    }

    // 静态方法、类方法
    static func staticAction(type: Any?, params: [String : Any]?) -> Any? {
        return nil
    }

    // 对象方法
    func objectAction(type: Any?, params: [String : Any]?) -> Any? {
        return nil
    }
}

