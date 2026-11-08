import DCloudUTSFoundation
import UIKit
public typealias OpenAppAuthorizeSetting = (_ options: OpenAppAuthorizeSettingOptions) -> Void
@objc(UTSSDKModulesDCloudUniOpenAppAuthorizeSettingOpenAppAuthorizeSettingSuccess)
@objcMembers
public class OpenAppAuthorizeSettingSuccess : NSObject, UTSObject {
    public var errMsg: String!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "errMsg":
                    self.errMsg = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.errMsg = obj["errMsg"] as! String
    }
}
public typealias OpenAppAuthorizeSettingSuccessCallback = (_ result: OpenAppAuthorizeSettingSuccess) -> Void
@objc(UTSSDKModulesDCloudUniOpenAppAuthorizeSettingOpenAppAuthorizeSettingFail)
@objcMembers
public class OpenAppAuthorizeSettingFail : NSObject, UTSObject {
    public var errMsg: String!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "errMsg":
                    self.errMsg = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.errMsg = obj["errMsg"] as! String
    }
}
public typealias OpenAppAuthorizeSettingFailCallback = (_ result: OpenAppAuthorizeSettingFail) -> Void
@objc(UTSSDKModulesDCloudUniOpenAppAuthorizeSettingOpenAppAuthorizeSettingComplete)
@objcMembers
public class OpenAppAuthorizeSettingComplete : NSObject, UTSObject {
    public var errMsg: String!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "errMsg":
                    self.errMsg = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.errMsg = obj["errMsg"] as! String
    }
}
public typealias OpenAppAuthorizeSettingCompleteCallback = (_ result: OpenAppAuthorizeSettingComplete) -> Void
@objc(UTSSDKModulesDCloudUniOpenAppAuthorizeSettingOpenAppAuthorizeSettingOptions)
@objcMembers
public class OpenAppAuthorizeSettingOptions : NSObject, UTSObject {
    public var success: OpenAppAuthorizeSettingSuccessCallback?
    public var fail: OpenAppAuthorizeSettingFailCallback?
    public var complete: OpenAppAuthorizeSettingCompleteCallback?
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
        self.success = obj["success"] as! OpenAppAuthorizeSettingSuccessCallback?
        self.fail = obj["fail"] as! OpenAppAuthorizeSettingFailCallback?
        self.complete = obj["complete"] as! OpenAppAuthorizeSettingCompleteCallback?
    }
}
public var openAppAuthorizeSetting: OpenAppAuthorizeSetting = {
(_ settingOptions: OpenAppAuthorizeSettingOptions) -> Void in
var url = URL(string: UIApplication.openSettingsURLString)!
if (UIApplication.shared.canOpenURL(url)) {
    var op = Map<UIApplication.OpenExternalURLOptionsKey, Any>()
    if #available(iOS 10, *) {
        UIApplication.shared.open(url, options: op, completionHandler: {
        (_ result: Bool) -> Void in
        if (result) {
            var success = OpenAppAuthorizeSettingSuccess(UTSJSONObject([
                "errMsg": ""
            ]))
            var complete = OpenAppAuthorizeSettingComplete(UTSJSONObject([
                "errMsg": ""
            ]))
            settingOptions.success?(success)
            settingOptions.complete?(complete)
        } else {
            var fail = OpenAppAuthorizeSettingFail(UTSJSONObject([
                "errMsg": "unknown error"
            ]))
            var complete = OpenAppAuthorizeSettingComplete(UTSJSONObject([
                "errMsg": "unknown error"
            ]))
            settingOptions.fail?(fail)
            settingOptions.complete?(complete)
        }
        })
    }
} else {
    var fail = OpenAppAuthorizeSettingFail(UTSJSONObject([
        "errMsg": "unknown error"
    ]))
    var complete = OpenAppAuthorizeSettingComplete(UTSJSONObject([
        "errMsg": "unknown error"
    ]))
    settingOptions.fail?(fail)
    settingOptions.complete?(complete)
}
}
@objc(UTSSDKModulesDCloudUniOpenAppAuthorizeSettingOpenAppAuthorizeSettingOptionsJSONObject)
@objcMembers
public class OpenAppAuthorizeSettingOptionsJSONObject : NSObject {
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
public func openAppAuthorizeSettingByJs(_ options: OpenAppAuthorizeSettingOptionsJSONObject) -> Void {
    return openAppAuthorizeSetting(OpenAppAuthorizeSettingOptions(UTSJSONObject([
        "success": {
        (result: OpenAppAuthorizeSettingSuccess) -> Void in
        options.success?(result)
        },
        "fail": {
        (result: OpenAppAuthorizeSettingFail) -> Void in
        options.fail?(result)
        },
        "complete": {
        (result: OpenAppAuthorizeSettingComplete) -> Void in
        options.complete?(result)
        }
    ])))
}
@objc(UTSSDKModulesDCloudUniOpenAppAuthorizeSettingIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniOpenAppAuthorizeSettingIndexSwift : NSObject {
    public static func s_openAppAuthorizeSettingByJs(_ options: OpenAppAuthorizeSettingOptionsJSONObject) -> Void {
        return openAppAuthorizeSettingByJs(options)
    }
}
