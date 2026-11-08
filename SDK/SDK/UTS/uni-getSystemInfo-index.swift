import DCloudUTSFoundation
import UIKit
public typealias GetSystemInfo = (_ options: GetSystemInfoOptions) -> Void
public typealias GetSystemInfoSync = () -> GetSystemInfoResult
public typealias GetWindowInfo = () -> GetWindowInfoResult
@objc(UTSSDKModulesDCloudUniGetSystemInfoSafeArea)
@objcMembers
public class SafeArea : NSObject, UTSObject {
    public var left: NSNumber!
    public var right: NSNumber!
    public var top: NSNumber!
    public var bottom: NSNumber!
    public var width: NSNumber!
    public var height: NSNumber!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "left":
                    self.left = try! utsSubscriptCheckValue(newValue)
                case "right":
                    self.right = try! utsSubscriptCheckValue(newValue)
                case "top":
                    self.top = try! utsSubscriptCheckValue(newValue)
                case "bottom":
                    self.bottom = try! utsSubscriptCheckValue(newValue)
                case "width":
                    self.width = try! utsSubscriptCheckValue(newValue)
                case "height":
                    self.height = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.left = obj["left"] as! NSNumber
        self.right = obj["right"] as! NSNumber
        self.top = obj["top"] as! NSNumber
        self.bottom = obj["bottom"] as! NSNumber
        self.width = obj["width"] as! NSNumber
        self.height = obj["height"] as! NSNumber
    }
}
@objc(UTSSDKModulesDCloudUniGetSystemInfoSafeAreaInsets)
@objcMembers
public class SafeAreaInsets : NSObject, UTSObject {
    public var left: NSNumber!
    public var right: NSNumber!
    public var top: NSNumber!
    public var bottom: NSNumber!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "left":
                    self.left = try! utsSubscriptCheckValue(newValue)
                case "right":
                    self.right = try! utsSubscriptCheckValue(newValue)
                case "top":
                    self.top = try! utsSubscriptCheckValue(newValue)
                case "bottom":
                    self.bottom = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.left = obj["left"] as! NSNumber
        self.right = obj["right"] as! NSNumber
        self.top = obj["top"] as! NSNumber
        self.bottom = obj["bottom"] as! NSNumber
    }
}
@objc(UTSSDKModulesDCloudUniGetSystemInfoGetSystemInfoResult)
@objcMembers
public class GetSystemInfoResult : NSObject, UTSObject {
    public var SDKVersion: String!
    public var appId: String!
    public var appLanguage: String!
    public var appName: String!
    public var appVersion: String!
    public var appVersionCode: String!
    public var appWgtVersion: String?
    public var brand: String!
    public var browserName: String!
    public var browserVersion: String!
    public var deviceId: String!
    public var deviceBrand: String!
    public var deviceModel: String!
    public var deviceType: String!
    public var devicePixelRatio: NSNumber!
    public var deviceOrientation: String!
    public var language: String!
    public var model: String?
    public var osName: String!
    public var osVersion: String!
    public var osLanguage: String!
    public var osTheme: String?
    public var pixelRatio: NSNumber!
    public var platform: String!
    public var screenWidth: NSNumber!
    public var screenHeight: NSNumber!
    public var statusBarHeight: NSNumber!
    public var system: String!
    public var safeArea: SafeArea!
    public var safeAreaInsets: SafeAreaInsets!
    public var ua: String!
    public var uniCompileVersion: String!
    public var uniCompilerVersion: String!
    public var uniPlatform: String!
    public var uniRuntimeVersion: String!
    public var uniCompileVersionCode: NSNumber!
    public var uniCompilerVersionCode: NSNumber!
    public var uniRuntimeVersionCode: NSNumber!
    public var version: String!
    public var romName: String!
    public var romVersion: String!
    public var windowWidth: NSNumber!
    public var windowHeight: NSNumber!
    public var windowTop: NSNumber!
    public var windowBottom: NSNumber!
    public var osAndroidAPILevel: NSNumber?
    public var osHarmonySDKAPIVersion: NSNumber?
    public var osHarmonyDisplayVersion: String?
    public var appTheme: String?
    public var hostTheme: String?
    public var hostVersion: String?
    public var hostLanguage: String?
    public var hostName: String?
    public var hostSDKVersion: String?
    public var hostFontSizeSetting: NSNumber?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "SDKVersion":
                    self.SDKVersion = try! utsSubscriptCheckValue(newValue)
                case "appId":
                    self.appId = try! utsSubscriptCheckValue(newValue)
                case "appLanguage":
                    self.appLanguage = try! utsSubscriptCheckValue(newValue)
                case "appName":
                    self.appName = try! utsSubscriptCheckValue(newValue)
                case "appVersion":
                    self.appVersion = try! utsSubscriptCheckValue(newValue)
                case "appVersionCode":
                    self.appVersionCode = try! utsSubscriptCheckValue(newValue)
                case "appWgtVersion":
                    self.appWgtVersion = try! utsSubscriptCheckValueIfPresent(newValue)
                case "brand":
                    self.brand = try! utsSubscriptCheckValue(newValue)
                case "browserName":
                    self.browserName = try! utsSubscriptCheckValue(newValue)
                case "browserVersion":
                    self.browserVersion = try! utsSubscriptCheckValue(newValue)
                case "deviceId":
                    self.deviceId = try! utsSubscriptCheckValue(newValue)
                case "deviceBrand":
                    self.deviceBrand = try! utsSubscriptCheckValue(newValue)
                case "deviceModel":
                    self.deviceModel = try! utsSubscriptCheckValue(newValue)
                case "deviceType":
                    self.deviceType = try! utsSubscriptCheckValue(newValue)
                case "devicePixelRatio":
                    self.devicePixelRatio = try! utsSubscriptCheckValue(newValue)
                case "deviceOrientation":
                    self.deviceOrientation = try! utsSubscriptCheckValue(newValue)
                case "language":
                    self.language = try! utsSubscriptCheckValue(newValue)
                case "model":
                    self.model = try! utsSubscriptCheckValueIfPresent(newValue)
                case "osName":
                    self.osName = try! utsSubscriptCheckValue(newValue)
                case "osVersion":
                    self.osVersion = try! utsSubscriptCheckValue(newValue)
                case "osLanguage":
                    self.osLanguage = try! utsSubscriptCheckValue(newValue)
                case "osTheme":
                    self.osTheme = try! utsSubscriptCheckValueIfPresent(newValue)
                case "pixelRatio":
                    self.pixelRatio = try! utsSubscriptCheckValue(newValue)
                case "platform":
                    self.platform = try! utsSubscriptCheckValue(newValue)
                case "screenWidth":
                    self.screenWidth = try! utsSubscriptCheckValue(newValue)
                case "screenHeight":
                    self.screenHeight = try! utsSubscriptCheckValue(newValue)
                case "statusBarHeight":
                    self.statusBarHeight = try! utsSubscriptCheckValue(newValue)
                case "system":
                    self.system = try! utsSubscriptCheckValue(newValue)
                case "safeArea":
                    self.safeArea = try! utsSubscriptCheckValue(newValue)
                case "safeAreaInsets":
                    self.safeAreaInsets = try! utsSubscriptCheckValue(newValue)
                case "ua":
                    self.ua = try! utsSubscriptCheckValue(newValue)
                case "uniCompileVersion":
                    self.uniCompileVersion = try! utsSubscriptCheckValue(newValue)
                case "uniCompilerVersion":
                    self.uniCompilerVersion = try! utsSubscriptCheckValue(newValue)
                case "uniPlatform":
                    self.uniPlatform = try! utsSubscriptCheckValue(newValue)
                case "uniRuntimeVersion":
                    self.uniRuntimeVersion = try! utsSubscriptCheckValue(newValue)
                case "uniCompileVersionCode":
                    self.uniCompileVersionCode = try! utsSubscriptCheckValue(newValue)
                case "uniCompilerVersionCode":
                    self.uniCompilerVersionCode = try! utsSubscriptCheckValue(newValue)
                case "uniRuntimeVersionCode":
                    self.uniRuntimeVersionCode = try! utsSubscriptCheckValue(newValue)
                case "version":
                    self.version = try! utsSubscriptCheckValue(newValue)
                case "romName":
                    self.romName = try! utsSubscriptCheckValue(newValue)
                case "romVersion":
                    self.romVersion = try! utsSubscriptCheckValue(newValue)
                case "windowWidth":
                    self.windowWidth = try! utsSubscriptCheckValue(newValue)
                case "windowHeight":
                    self.windowHeight = try! utsSubscriptCheckValue(newValue)
                case "windowTop":
                    self.windowTop = try! utsSubscriptCheckValue(newValue)
                case "windowBottom":
                    self.windowBottom = try! utsSubscriptCheckValue(newValue)
                case "osAndroidAPILevel":
                    self.osAndroidAPILevel = try! utsSubscriptCheckValueIfPresent(newValue)
                case "osHarmonySDKAPIVersion":
                    self.osHarmonySDKAPIVersion = try! utsSubscriptCheckValueIfPresent(newValue)
                case "osHarmonyDisplayVersion":
                    self.osHarmonyDisplayVersion = try! utsSubscriptCheckValueIfPresent(newValue)
                case "appTheme":
                    self.appTheme = try! utsSubscriptCheckValueIfPresent(newValue)
                case "hostTheme":
                    self.hostTheme = try! utsSubscriptCheckValueIfPresent(newValue)
                case "hostVersion":
                    self.hostVersion = try! utsSubscriptCheckValueIfPresent(newValue)
                case "hostLanguage":
                    self.hostLanguage = try! utsSubscriptCheckValueIfPresent(newValue)
                case "hostName":
                    self.hostName = try! utsSubscriptCheckValueIfPresent(newValue)
                case "hostSDKVersion":
                    self.hostSDKVersion = try! utsSubscriptCheckValueIfPresent(newValue)
                case "hostFontSizeSetting":
                    self.hostFontSizeSetting = try! utsSubscriptCheckValueIfPresent(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.SDKVersion = obj["SDKVersion"] as! String
        self.appId = obj["appId"] as! String
        self.appLanguage = obj["appLanguage"] as! String
        self.appName = obj["appName"] as! String
        self.appVersion = obj["appVersion"] as! String
        self.appVersionCode = obj["appVersionCode"] as! String
        self.appWgtVersion = obj["appWgtVersion"] as! String?
        self.brand = obj["brand"] as! String
        self.browserName = obj["browserName"] as! String
        self.browserVersion = obj["browserVersion"] as! String
        self.deviceId = obj["deviceId"] as! String
        self.deviceBrand = obj["deviceBrand"] as! String
        self.deviceModel = obj["deviceModel"] as! String
        self.deviceType = obj["deviceType"] as! String
        self.devicePixelRatio = obj["devicePixelRatio"] as! NSNumber
        self.deviceOrientation = obj["deviceOrientation"] as! String
        self.language = obj["language"] as! String
        self.model = obj["model"] as! String?
        self.osName = obj["osName"] as! String
        self.osVersion = obj["osVersion"] as! String
        self.osLanguage = obj["osLanguage"] as! String
        self.osTheme = obj["osTheme"] as! String?
        self.pixelRatio = obj["pixelRatio"] as! NSNumber
        self.platform = obj["platform"] as! String
        self.screenWidth = obj["screenWidth"] as! NSNumber
        self.screenHeight = obj["screenHeight"] as! NSNumber
        self.statusBarHeight = obj["statusBarHeight"] as! NSNumber
        self.system = obj["system"] as! String
        self.safeArea = obj["safeArea"] as! SafeArea
        self.safeAreaInsets = obj["safeAreaInsets"] as! SafeAreaInsets
        self.ua = obj["ua"] as! String
        self.uniCompileVersion = obj["uniCompileVersion"] as! String
        self.uniCompilerVersion = obj["uniCompilerVersion"] as! String
        self.uniPlatform = obj["uniPlatform"] as! String
        self.uniRuntimeVersion = obj["uniRuntimeVersion"] as! String
        self.uniCompileVersionCode = obj["uniCompileVersionCode"] as! NSNumber
        self.uniCompilerVersionCode = obj["uniCompilerVersionCode"] as! NSNumber
        self.uniRuntimeVersionCode = obj["uniRuntimeVersionCode"] as! NSNumber
        self.version = obj["version"] as! String
        self.romName = obj["romName"] as! String
        self.romVersion = obj["romVersion"] as! String
        self.windowWidth = obj["windowWidth"] as! NSNumber
        self.windowHeight = obj["windowHeight"] as! NSNumber
        self.windowTop = obj["windowTop"] as! NSNumber
        self.windowBottom = obj["windowBottom"] as! NSNumber
        self.osAndroidAPILevel = obj["osAndroidAPILevel"] as! NSNumber?
        self.osHarmonySDKAPIVersion = obj["osHarmonySDKAPIVersion"] as! NSNumber?
        self.osHarmonyDisplayVersion = obj["osHarmonyDisplayVersion"] as! String?
        self.appTheme = obj["appTheme"] as! String?
        self.hostTheme = obj["hostTheme"] as! String?
        self.hostVersion = obj["hostVersion"] as! String?
        self.hostLanguage = obj["hostLanguage"] as! String?
        self.hostName = obj["hostName"] as! String?
        self.hostSDKVersion = obj["hostSDKVersion"] as! String?
        self.hostFontSizeSetting = obj["hostFontSizeSetting"] as! NSNumber?
    }
}
public typealias GetSystemInfoSuccessCallback = (_ result: GetSystemInfoResult) -> Void
public typealias GetSystemInfoFail = UniError
public typealias GetSystemInfoFailCallback = (_ result: GetSystemInfoFail) -> Void
public typealias GetSystemInfoComplete = Any
public typealias GetSystemInfoCompleteCallback = (_ result: GetSystemInfoComplete) -> Void
@objc(UTSSDKModulesDCloudUniGetSystemInfoGetSystemInfoOptions)
@objcMembers
public class GetSystemInfoOptions : NSObject, UTSObject {
    public var success: GetSystemInfoSuccessCallback?
    public var fail: GetSystemInfoFailCallback?
    public var complete: GetSystemInfoCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "success":
                    self.success = try! utsSubscriptCheckValueIfPresent(newValue)
                case "fail":
                    self.fail = try! utsSubscriptCheckValueIfPresent(newValue)
                case "complete":
                    self.complete = try! utsSubscriptCheckValueIfPresent(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.success = obj["success"] as! GetSystemInfoSuccessCallback?
        self.fail = obj["fail"] as! GetSystemInfoFailCallback?
        self.complete = obj["complete"] as! GetSystemInfoCompleteCallback?
    }
}
@objc(UTSSDKModulesDCloudUniGetSystemInfoGetWindowInfoResult)
@objcMembers
public class GetWindowInfoResult : NSObject, UTSObject {
    public var pixelRatio: NSNumber!
    public var screenWidth: NSNumber!
    public var screenHeight: NSNumber!
    public var windowWidth: NSNumber!
    public var windowHeight: NSNumber!
    public var statusBarHeight: NSNumber!
    public var windowTop: NSNumber!
    public var windowBottom: NSNumber!
    public var safeArea: SafeArea!
    public var safeAreaInsets: SafeAreaInsets!
    public var screenTop: NSNumber!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "pixelRatio":
                    self.pixelRatio = try! utsSubscriptCheckValue(newValue)
                case "screenWidth":
                    self.screenWidth = try! utsSubscriptCheckValue(newValue)
                case "screenHeight":
                    self.screenHeight = try! utsSubscriptCheckValue(newValue)
                case "windowWidth":
                    self.windowWidth = try! utsSubscriptCheckValue(newValue)
                case "windowHeight":
                    self.windowHeight = try! utsSubscriptCheckValue(newValue)
                case "statusBarHeight":
                    self.statusBarHeight = try! utsSubscriptCheckValue(newValue)
                case "windowTop":
                    self.windowTop = try! utsSubscriptCheckValue(newValue)
                case "windowBottom":
                    self.windowBottom = try! utsSubscriptCheckValue(newValue)
                case "safeArea":
                    self.safeArea = try! utsSubscriptCheckValue(newValue)
                case "safeAreaInsets":
                    self.safeAreaInsets = try! utsSubscriptCheckValue(newValue)
                case "screenTop":
                    self.screenTop = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.pixelRatio = obj["pixelRatio"] as! NSNumber
        self.screenWidth = obj["screenWidth"] as! NSNumber
        self.screenHeight = obj["screenHeight"] as! NSNumber
        self.windowWidth = obj["windowWidth"] as! NSNumber
        self.windowHeight = obj["windowHeight"] as! NSNumber
        self.statusBarHeight = obj["statusBarHeight"] as! NSNumber
        self.windowTop = obj["windowTop"] as! NSNumber
        self.windowBottom = obj["windowBottom"] as! NSNumber
        self.safeArea = obj["safeArea"] as! SafeArea
        self.safeAreaInsets = obj["safeAreaInsets"] as! SafeAreaInsets
        self.screenTop = obj["screenTop"] as! NSNumber
    }
}
public var getSystemInfo: GetSystemInfo = {
(_ options: GetSystemInfoOptions) -> Void in
var result = getSystemInfoSync()
var success = options.success
var complete = options.complete
success?(result)
complete?(result)
}
public var getSystemInfoSync: GetSystemInfoSync = {
() -> GetSystemInfoResult in
var windowInfo: GetWindowInfoResult = getWindowInfoResult()
var deviceType = UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? "pad" : "phone"
var osVersion = UIDevice.current.systemVersion
var deviceOrientation = "portrait"
var orient = UIApplication.shared.statusBarOrientation
if (orient == UIInterfaceOrientation.landscapeLeft || orient == UIInterfaceOrientation.landscapeRight) {
    deviceOrientation = "landscape"
}
var result = GetSystemInfoResult(UTSJSONObject([
    "SDKVersion": "",
    "appId": UTSiOS.getAppId(),
    "appLanguage": UTSiOS.getOsLanguage(),
    "appName": UTSiOS.getAppName(),
    "appVersion": UTSiOS.getAppVersion(),
    "appVersionCode": UTSiOS.getAppVersionCode(),
    "appWgtVersion": UTSiOS.getAppWgtVersion(),
    "brand": "apple",
    "browserName": "wkwebview",
    "browserVersion": osVersion,
    "deviceId": UTSiOS.getDeviceId(),
    "deviceBrand": "apple",
    "deviceModel": UTSiOS.getModel(),
    "deviceType": deviceType,
    "devicePixelRatio": NSNumber.from(UIScreen.main.scale),
    "deviceOrientation": deviceOrientation,
    "language": UTSiOS.getOsLanguage(),
    "model": UTSiOS.getModel(),
    "osName": "ios",
    "osVersion": osVersion,
    "osLanguage": UTSiOS.getOsLanguage(),
    "osTheme": UTSiOS.getOsTheme(),
    "pixelRatio": windowInfo.pixelRatio,
    "platform": "ios",
    "screenWidth": windowInfo.screenWidth,
    "screenHeight": windowInfo.screenHeight,
    "statusBarHeight": windowInfo.statusBarHeight,
    "system": String(format: "iOS %@", osVersion),
    "ua": UTSiOS.getUserAgent(),
    "uniCompileVersion": UTSiOS.getCompileVersion(),
    "uniCompilerVersion": UTSiOS.getCompileVersion(),
    "uniPlatform": "app",
    "uniRuntimeVersion": UTSiOS.getRuntimeVersion(),
    "uniCompileVersionCode": systemInfoConvertVersionCode(UTSiOS.getCompileVersion()),
    "uniCompilerVersionCode": systemInfoConvertVersionCode(UTSiOS.getCompileVersion()),
    "uniRuntimeVersionCode": systemInfoConvertVersionCode(UTSiOS.getRuntimeVersion()),
    "version": UTSiOS.getInnerVersion(),
    "romName": "ios",
    "romVersion": osVersion,
    "windowWidth": windowInfo.windowWidth,
    "windowHeight": windowInfo.windowHeight,
    "windowTop": windowInfo.windowTop,
    "windowBottom": windowInfo.windowBottom,
    "safeAreaInsets": windowInfo.safeAreaInsets,
    "safeArea": windowInfo.safeArea,
    "appTheme": UTSiOS.getAppTheme()
]))
return result
}
public var systemInfoConvertVersionCode = {
(_ version: String) -> NSNumber in
if (version.length > 0) {
    var components = version.components(separatedBy: ".")
    var resultString = ""
    do {
        var i: NSNumber = 0
        while(i < components.length){
            resultString = (i == 0) ? (resultString + components[i] + ".") : (resultString + components[i])
            i++
        }
    }
    return parseFloat(resultString)
}
return 0
}
public func getWindowInfoResult() -> GetWindowInfoResult {
    var insets: Map<String, Any> = UTSiOS.getSafeAreaInsets()
    var window: Map<String, Any> = UTSiOS.getWindowInfo()
    var windowWidth = window.get("windowWidth") as! NSNumber
    var windowHeight = window.get("windowHeight") as! NSNumber
    var windowTop = window.get("windowTop") as! NSNumber
    var windowBottom = window.get("windowBottom") as! NSNumber
    var screenWidth = NSNumber.from(UIScreen.main.bounds.width)
    var screenHeight = NSNumber.from(UIScreen.main.bounds.height)
    var insetLeft = insets.get("left") as! NSNumber
    var insetRight = insets.get("right") as! NSNumber
    var insetTop = insets.get("top") as! NSNumber
    var insetBottom = insets.get("bottom") as! NSNumber
    var safeAreaInsets = SafeAreaInsets(UTSJSONObject([
        "left": insetLeft,
        "top": insetTop,
        "right": insetRight,
        "bottom": insetBottom
    ]))
    var safeAreaLeft = insetLeft
    var safeAreaRight = screenWidth - insetRight
    var safeAreaTop = insetTop
    var safeAreaBottom = screenHeight - insetBottom
    var safeAreaWidth = screenWidth - insetLeft - insetRight
    var safeAreaHeight = screenHeight - insetTop - insetBottom
    var safeArea = SafeArea(UTSJSONObject([
        "left": safeAreaLeft,
        "top": safeAreaTop,
        "right": safeAreaRight,
        "bottom": safeAreaBottom,
        "width": safeAreaWidth,
        "height": safeAreaHeight
    ]))
    var screenTop: NSNumber = 0
    var result = GetWindowInfoResult(UTSJSONObject([
        "pixelRatio": NSNumber.from(UIScreen.main.scale),
        "screenWidth": screenWidth,
        "screenHeight": screenHeight,
        "windowWidth": windowWidth,
        "windowHeight": windowHeight,
        "statusBarHeight": UTSiOS.getStatusBarHeight(),
        "windowTop": windowTop,
        "windowBottom": windowBottom,
        "safeArea": safeArea,
        "safeAreaInsets": safeAreaInsets,
        "screenTop": screenTop
    ]))
    return result
}
public var getWindowInfo: GetWindowInfo = {
() -> GetWindowInfoResult in
return getWindowInfoResult()
}
@objc(UTSSDKModulesDCloudUniGetSystemInfoGetSystemInfoOptionsJSONObject)
@objcMembers
public class GetSystemInfoOptionsJSONObject : NSObject {
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
public func getSystemInfoByJs(_ options: GetSystemInfoOptionsJSONObject) -> Void {
    return getSystemInfo(GetSystemInfoOptions(UTSJSONObject([
        "success": {
        (result: GetSystemInfoResult) -> Void in
        options.success?(result)
        },
        "fail": {
        (result: GetSystemInfoFail) -> Void in
        options.fail?(result)
        },
        "complete": {
        (result: GetSystemInfoComplete) -> Void in
        options.complete?(result)
        }
    ])))
}
public func getSystemInfoSyncByJs() -> GetSystemInfoResult {
    return getSystemInfoSync()
}
public func getWindowInfoByJs() -> GetWindowInfoResult {
    return getWindowInfo()
}
@objc(UTSSDKModulesDCloudUniGetSystemInfoIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniGetSystemInfoIndexSwift : NSObject {
    public static func s_getSystemInfoByJs(_ options: GetSystemInfoOptionsJSONObject) -> Void {
        return getSystemInfoByJs(options)
    }
    public static func s_getSystemInfoSyncByJs() -> GetSystemInfoResult {
        return getSystemInfoSyncByJs()
    }
    public static func s_getWindowInfoByJs() -> GetWindowInfoResult {
        return getWindowInfoByJs()
    }
}
