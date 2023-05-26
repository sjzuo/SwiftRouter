//
//  Router.swift
//  RouteDemo
//
//  Created by S JZ on 2023/5/25.
//

import UIKit

public class Router: NSObject {
    // 单例对象
    public static var shared: Router = Router()
    private override init() {}
    
    
    @discardableResult
    /// 初始化控制器
    /// - Parameters:
    ///   - controllerName: 控制器名称
    ///   - moduleName: 控制器所在Bundle名称，为nil时，直接使用Bundle.main的CFBundleExecutable
    ///   - params: 初始化控制器所需参数
    /// - Returns: 控制器对象
    public func createController(_ controllerName: String,
                                 moduleName: String? = nil,
                                 params: [String : Any]? = nil) -> UIViewController? {
        guard let controller = createObject(controllerName, moduleName: moduleName, params: params) as? UIViewController else { return nil }
        return controller
    }
    
    @discardableResult
    /// 初始化对象
    /// - Parameters:
    ///   - objectName: 对象类名称
    ///   - moduleName: 对象所在Bundle名称，为nil时，直接使用Bundle.main的CFBundleExecutable
    ///   - params: 初始化对象所需参数
    /// - Returns: 初始化后的对象
    public func createObject(_ objectName: String,
                             moduleName: String? = nil,
                             params: [String : Any]? = nil) -> RouterProtocol? {
        var nameSpace = Bundle.main.infoDictionary?["CFBundleExecutable"] as? String
        if let moduleName { nameSpace = moduleName }
        guard let nameSpace, !nameSpace.isEmpty else { return nil }
        
        let className = "\(nameSpace).\(objectName)"
        let cls: AnyClass? = NSClassFromString(className)
        guard let objectCls = cls as? RouterProtocol.Type else { return nil }
       
        let object = objectCls.createInstance(params: params)
        return object
    }
}

