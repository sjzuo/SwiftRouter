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
    ///   - type: 可以感觉type来判断需要调用RouterProtocol对象的哪个对象方法，默认为空字符串
    ///   - params: 调用对象方法所需参数
    /// - Returns: 对象方法返回值
    @discardableResult
    public static func objectAction<T>(object: RouterProtocol,
                      type: T? = "",
                    params: [String : Any]? = nil) -> Any? where T: Equatable {
        return object.objectAction(type: type, params: params)
    }
    
    /// 调用RouterProtocol的静态staticAction方法
    /// - Parameters:
    ///   - objectName: 对象类名称，如果className为"moduleName.className"格式，直接使用className生成对象类，moduleName可不传
    ///   - moduleName: 对象所在Bundle名称，为nil时，直接使用Bundle.main的CFBundleExecutable（如果className不为"moduleName.className"格式）
    ///   - type: 可以感觉type来判断需要调用RouterProtocol对象的哪个static方法，默认为空字符串
    ///   - params: 调用对象static方法所需参数
    /// - Returns: static方法返回值
    @discardableResult
    public static func staticAction<T>(_ className: String,
                      moduleName: String? = nil,
                      type: T? = "",
                      params: [String : Any]? = nil) -> Any? where T: Equatable {
        
        let newClassName = configClassName(className, moduleName: moduleName)
        guard newClassName.isEmpty else { return nil }
        
        let cls: AnyClass? = NSClassFromString(newClassName)
        guard let objectCls = cls as? RouterProtocol.Type else { return nil }
        
        return objectCls.staticAction(type: type, params: params)
    }
}
