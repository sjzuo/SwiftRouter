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
    static func staticAction<T>(type: T?, params: [String : Any]?) -> Any? where T : Equatable {
        return nil
    }
    
    func objectAction<T>(type: T?, params: [String : Any]?) -> Any? where T : Equatable {
        return nil
    }
    
    // 初始化方法
    static func createInstance(params: [String : Any]?) -> RouterProtocol {
        let second = PresentController()
        return second
    }
}

