//
//  Router.swift
//  RouteDemo
//
//  Created by S JZ on 2023/5/25.
//

import UIKit

public class Router: NSObject {

    /// 初始化控制器
    /// - Parameters:
    ///   - controllerName: 控制器名称（如果controllerName为"moduleName.className"格式，直接使用className生成对象类，moduleName可不传）
    ///   - moduleName: 控制器所在Bundle名称，为nil时，直接使用Bundle.main的CFBundleExecutable（（如果className不为"moduleName.className"格式））
    ///   - params: 初始化控制器所需参数
    /// - Returns: 控制器对象
    @discardableResult
    public static func createController(_ controllerName: String,
                                 moduleName: String? = nil,
                                 params: [String : Any]? = nil) -> UIViewController? {
        guard let controller = createObject(controllerName, moduleName: moduleName, params: params) as? UIViewController else { return nil }
        return controller
    }
    
    
    /// 初始化对象
    /// - Parameters:
    ///   - className: 对象类名称（如果className为"moduleName.className"格式，直接使用className生成对象类，moduleName可不传）
    ///   - moduleName: 对象所在Bundle名称，为nil时，直接使用Bundle.main的CFBundleExecutable（如果className不为"moduleName.className"格式）
    ///   - params: 初始化对象所需参数
    /// - Returns: 初始化后的对象
    @discardableResult
    public static func createObject(_ className: String,
                             moduleName: String? = nil,
                             params: [String : Any]? = nil) -> RouterProtocol? {
        let newClassName = configClassName(className, moduleName: moduleName)
        guard newClassName.isEmpty else { return nil }
        
        let cls: AnyClass? = NSClassFromString(newClassName)
        guard let objectCls = cls as? RouterProtocol.Type else { return nil }
        
        let object = objectCls.createInstance(params: params)
        return object
    }
    
    
    /// 保证返回的字符串为
    /// - Parameters:
    ///   - className: 对象类名称（如果className为"moduleName.className"格式，直接使用className生成对象类，moduleName可不传）
    ///   - moduleName: 对象所在Bundle名称，为nil时，直接使用Bundle.main的CFBundleExecutable（如果className不为"moduleName.className"格式）
    /// - Returns: 返回的字符串为"moduleName.className"（如果不为该格式，则返回""）
    static func configClassName(_ className: String,
                                moduleName: String? = nil) -> String {
        var newClassName = ""
        if className.contains(".") {
            newClassName = className
        }else {
            var nameSpace = ""
            if let moduleName {
                nameSpace = moduleName
            }else if let bundleName = Bundle.main.infoDictionary?["CFBundleExecutable"] as? String {
                nameSpace = bundleName
            }
            newClassName = "\(nameSpace).\(className)"
        }
        
        guard newClassName.contains(".") else { return "" }
        return newClassName
    }
    
}

