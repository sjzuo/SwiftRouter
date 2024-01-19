//
//  RouterProtocol.swift
//  RouteDemo
//
//  Created by S JZ on 2023/5/25.
//

import UIKit

// 想要解耦的对象，都需要实现该协议
public protocol RouterProtocol where Self: NSObject {
    
    /// 创建对象，为使用Router做准备
    /// - Parameter params: 初始化时，需要用到的参数
    /// - Returns: 返回创建的RouterProtocol对象
    @discardableResult
    static func createInstance(params: [String : Any]?) -> RouterProtocol
    
    /// RouterProtocol调用static方法
    /// - Parameters:
    ///   - type: 可以根据type判断需要跳转哪一个static方法
    ///   - params: static方法所需参数
    /// - Returns: 静态方法返回的参数
    @discardableResult
    static func staticAction<T>(type: T?, params: [String : Any]?) -> Any? where T: Equatable
    
    /// RouterProtocol调用对象方法
    /// - Parameters:
    ///   - type: 可以根据type判断需要调用的哪一个对象方法
    ///   - params: 对象方法所需参数
    /// - Returns: 对象方法返回的参数
    @discardableResult
    func objectAction<T>(type: T?, params: [String : Any]?) -> Any? where T: Equatable
}

// 将不必须实现的方法，给一个默认值
extension RouterProtocol {
    @discardableResult
    static func staticAction<T>(type: T?, params: [String : Any]?) -> Any? where T: Equatable {
        return nil
    }
    
    @discardableResult
    func objectAction<T>(type: T?, params: [String : Any]?) -> Any? where T: Equatable {
        return nil
    }
}
