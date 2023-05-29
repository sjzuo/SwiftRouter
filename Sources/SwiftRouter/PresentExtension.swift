//
//  PresentExtension.swift
//  RouteDemo
//
//  Created by S JZ on 2023/5/29.
//

import UIKit

extension Router {
    
    /// 控制器初始化后，直接导航Present模态
    /// - Parameters:
    ///   - controllerName: 控制器名称
    ///   - moduleName: 控制器所在Bundle名称
    ///   - fromController: 从哪个控制器跳转过来，为nil时，获取App顶层控制器的导航栏
    ///   - params: 初始化控制器所需参数
    ///   - isNavigation: 是否需要添加导航栏
    ///   - animation: 模态是否需要动画
    ///   - completion: 模态完成后，是否需要
    public func present(_ controllerName: String,
                        moduleName: String? = nil,
                        from fromController: UIViewController? = nil,
                        params: [String : Any]? = nil,
                        isNavigation: Bool = false,
                        animation: Bool = true,
                        completion: (() -> Void)?) {
        guard let controller = createController(controllerName, moduleName: moduleName, params: params) else { return }
        
        // 是否添加导航栏
        var presentController = controller
        if isNavigation { presentController = UINavigationController(rootViewController: controller) }

        if let fromController {
            fromController.present(presentController, animated: animation) { completion?() }
        }else {
            RouterTools.currentController().present(presentController, animated: animation) { completion?() }
        }
    }
}
