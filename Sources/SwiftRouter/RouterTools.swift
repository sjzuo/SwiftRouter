//
//  RouterTools.swift
//  RouteDemo
//
//  Created by S JZ on 2023/5/25.
//

import UIKit

struct RouterTools {
    // 获取KeyWindow
    static func getKeyWindow() -> UIWindow? {
        // iOS13.0 之前获取方式
        // UIApplication.shared.keyWindow
        let windowScreen = UIApplication.shared.connectedScenes.first as? UIWindowScene
        return windowScreen?.windows.first { key in
            key.isKeyWindow
        }
    }
    
    static func currentController() -> UIViewController {
        if let current = getKeyWindow()?.rootViewController {
            return getCurrent(controller: current)
        }else {
            return UIViewController()
        }
    }
    
    /// 当前的导航控制器
    static func currentNavigationController() -> UINavigationController? {
        return currentController().navigationController
    }
    
    /// 获取可用的导航控制器
    static func getNavigationController(navRootVC: UIViewController? = nil) -> UINavigationController? {
        if let rootVC = navRootVC as? UINavigationController {
            return rootVC
        } else if let rootVC = navRootVC?.navigationController {
            return rootVC
        } else {
            return currentNavigationController()
        }
    }
    
    static func getCurrent(controller: UIViewController) -> UIViewController {
        if controller is UINavigationController {
            let naviController = controller as! UINavigationController
            return getCurrent(controller: naviController.viewControllers.last!)
        } else if controller is UITabBarController {
            let tabbarController = controller as! UITabBarController
            return getCurrent(controller: tabbarController.selectedViewController!)
        } else if controller.presentedViewController != nil {
            return getCurrent(controller: controller.presentedViewController!)
        } else {
            return controller
        }
    }
    
}
