# SwiftRouter


Swift 路由和模块通信解耦工具

采用target-action与Protocol结合的方式来实现的组件化路由中间件

- 支持使用字符串类名创建对象
- 支持使用字符串类名创建控制器并实现跳转
- 通过Protocol来规范对象的初始化方法和调用方法
- 组件间无耦合的调用服务，只需知道目标VC的类名和module名称

## 安装

### cocoapods

1. 在Podfile中添加 `pod 'SJZSwiftRouter'`

2. 执行 `pod install` 或 `pod update`

3. 导入 `import SJZSwiftRouter`

### Swift Package Manager

在 Xcode 的菜单栏中选择 `File > Swift Packages > Add Pacakage Dependency`，然后在搜索栏输入

`https://github.com/jackiehu/SwiftMediator`，即可完成集成


## 使用

### 实现协议
1. 必须为NSObject的子类，纯Swift类不支持

2. 想用此路由实现解耦的类，必须实现RouterProtocol协议

```swift
public protocol RouterProtocol: AnyObject {
    
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
    static func staticAction(type: Any?, params: [String : Any]?) -> Any?
    
    /// RouterProtocol调用对象方法
    /// - Parameters:
    ///   - type: 可以根据type判断需要调用的哪一个对象方法
    ///   - params: 对象方法所需参数
    /// - Returns: 对象方法返回的参数
    @discardableResult
    func objectAction(type: Any?, params: [String : Any]?) -> Any?
}

```

### 初始化
初始化对象
```swift
Router.shared.createObject("SecondViewController", moduleName: "RouteDemo", params: ["bgColor" : UIColor.red])
```

初始化控制器
```swift
    // 判断对象是否为控制器，是的话就返回
Router.shared.createController("SecondViewController", moduleName: "RouteDemo", params: ["bgColor" : UIColor.red])
```

### 原生跳转
```swift
Router.shared.push("SecondViewController", moduleName: "RouteDemo", from: self, params: ["bgColor" : UIColor.red], animation: true)
```

### 模态跳转
```swift
Router.shared.present("PresentController", moduleName: "RouteDemo", from: self, params: nil, isNavigation: true, animation: true) {}
```

### 调用方法
调用对象方法
```swift
if let viewController = Router.shared.createObject("SecondViewController") {

    // 已经知道对象，可以不用Router，直接调用objectAction方法
    // 例如：viewController.objectAction(type: nil, params: nil)
    
    // 使用Router调用对象方法
    if let titleStr = Router.shared.objectAction(object: viewController) as? String {
        debugPrint(titleStr)
    }
}
```

调用静态方法
```swift
Router.shared.staticAction("SecondViewController", moduleName: nil, type: nil, params: nil)
```


