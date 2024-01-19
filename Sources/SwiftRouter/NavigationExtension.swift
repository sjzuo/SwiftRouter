//
//  NavigationExtension.swift
//  RouteDemo
//
//  Created by S JZ on 2023/5/25.
//

import Foundation
import UIKit

extension Router {
    
    /// 控制器初始化后，直接导航Push
    /// - Parameters:
    ///   - controllerName: 控制器名称
    ///   - moduleName: 控制器所在Bundle名称
    ///   - fromController: 从哪个控制器跳转过来，为nil时，获取App顶层控制器的导航栏
    ///   - params: 初始化控制器所需参数
    ///   - animation: 跳转是否需要动画
    public static func push(_ controllerName: String,
                     moduleName: String? = nil,
                     from fromController: UIViewController? = nil,
                     params: [String : Any]? = nil,
                     animation: Bool = true) {
        
        guard let controller = Router.createController(controllerName, moduleName: moduleName, params: params) else { return }
        pushController(controller, from: fromController, animation: animation)
    }
    
    /// 导航Push
    /// - Parameters:
    ///   - controller: 需要跳转的控制器
    ///   - fromController: 从哪个控制器跳转
    ///   - animation: 跳转是否需要动画
    public static func push(_ controller: UIViewController?,
                     from fromController: UIViewController? = nil,
                     animation: Bool = true) {
        guard let controller else { return }
        pushController(controller, from: fromController, animation: animation)
    }
    
    private static func pushController(_ controller: UIViewController,
                                from fromController: UIViewController? = nil,
                                animation: Bool = true) {
        controller.hidesBottomBarWhenPushed = true
        if let fromController {
            fromController.navigationController?.pushViewController(controller, animated: animation)
        }else {
            RouterTools.currentNavigationController()?.pushViewController(controller, animated: animation)
        }
    }
}
