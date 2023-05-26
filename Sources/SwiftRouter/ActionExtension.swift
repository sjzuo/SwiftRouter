//
//  ActionExtension.swift
//  RouteDemo
//
//  Created by S JZ on 2023/5/25.
//

import Foundation

extension Router {
    
    /// 调用RouterProtocol的objectAction方法（可以直接跳过该方法，直接调用RouterProtocol的objectAction方法）
    /// - Parameters:
    ///   - object: RouterProtocol对象
    ///   - type: 可以感觉type来判断需要调用RouterProtocol对象的哪个对象方法
    ///   - params: 调用对象方法所需参数
    /// - Returns: 对象方法返回值
    @discardableResult
    public func objectAction(object: RouterProtocol,
                      _ type: Any? = nil,
                      params: [String : Any]? = nil) -> Any? {
        return object.objectAction(type: type, params: params)
    }
    
    /// 调用RouterProtocol的静态staticAction方法
    /// - Parameters:
    ///   - objectName: 对象名称
    ///   - moduleName: 对象所在Bundle名称，为nil时，直接使用Bundle.main的CFBundleExecutable
    ///   - type: 可以感觉type来判断需要调用RouterProtocol对象的哪个static方法
    ///   - params: 调用对象static方法所需参数
    /// - Returns: static方法返回值
    @discardableResult
    public func staticAction(_ objectName: String,
                      moduleName: String? = nil,
                      _ type: Any? = nil,
                      params: [String : Any]? = nil) -> Any? {
        var nameSpace = Bundle.main.infoDictionary?["CFBundleExecutable"] as? String
        if let moduleName { nameSpace = moduleName }
        guard let nameSpace, !nameSpace.isEmpty else { return nil }
        
        let className = "\(nameSpace).\(objectName)"
        let cls: AnyClass? = NSClassFromString(className)
        guard let objectCls = cls as? RouterProtocol.Type else { return nil }
        
        return objectCls.staticAction(type: type, params: params)
    }
}
