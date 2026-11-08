import DCloudUTSFoundation
public typealias OnPrivacyAuthorizationChange = (_ callback: @escaping OnPrivacyAuthorizationChangeCallback) -> NSNumber
public typealias OffPrivacyAuthorizationChange = (_ id: NSNumber) -> Void
public typealias OnPrivacyAuthorizationChangeCallback = (_ res: PrivacyChangeResult) -> Void
@objc(UTSSDKModulesDCloudUniPrivacyPrivacyChangeResult)
@objcMembers
public class PrivacyChangeResult : NSObject, UTSObject {
    public var needAuthorization: Bool = false
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "needAuthorization":
                    self.needAuthorization = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.needAuthorization = obj["needAuthorization"] as! Bool
    }
}
public typealias GetPrivacySetting = (_ options: GetPrivacySettingOptions) -> Void
public typealias GetPrivacySettingSuccessCallback = (_ result: GetPrivacySettingSuccessResult) -> Void
public typealias GetPrivacySettingFailCallback = (_ result: Any) -> Void
public typealias GetPrivacySettingCompleteCallback = (_ result: Any) -> Void
public typealias ResetPrivacyAuthorization = () -> Void
public typealias AgreePrivacyAuthorization = () -> Void
@objc(UTSSDKModulesDCloudUniPrivacyGetPrivacySettingSuccessResult)
@objcMembers
public class GetPrivacySettingSuccessResult : NSObject, UTSObject {
    public var needAuthorization: Bool = false
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "needAuthorization":
                    self.needAuthorization = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.needAuthorization = obj["needAuthorization"] as! Bool
    }
}
@objc(UTSSDKModulesDCloudUniPrivacyGetPrivacySettingOptions)
@objcMembers
public class GetPrivacySettingOptions : NSObject, UTSObject {
    public var success: GetPrivacySettingSuccessCallback?
    public var fail: GetPrivacySettingFailCallback?
    public var complete: GetPrivacySettingCompleteCallback?
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
        self.success = obj["success"] as! GetPrivacySettingSuccessCallback?
        self.fail = obj["fail"] as! GetPrivacySettingFailCallback?
        self.complete = obj["complete"] as! GetPrivacySettingCompleteCallback?
    }
}
public var getPrivacySetting: GetPrivacySetting = {
(_ options: GetPrivacySettingOptions) -> Void in
var isAgree: Bool = UTSiOS.isPrivacyAgree()
var result = GetPrivacySettingSuccessResult(UTSJSONObject([
    "needAuthorization": !isAgree
]))
options.success?(result)
options.complete?(result)
}
public var resetPrivacyAuthorization: ResetPrivacyAuthorization = {
() -> Void in
UTSiOS.setPrivacyAgree(false)
}
public var onPrivacyAuthorizationChange: OnPrivacyAuthorizationChange = {
(_ callback: @escaping OnPrivacyAuthorizationChangeCallback) -> NSNumber in
return UTSiOS.onPrivacyAgreeChange({
(_ isAgree: Bool) -> Void in
var result = PrivacyChangeResult(UTSJSONObject([
    "needAuthorization": !isAgree
]))
callback(result)
})
}
public var offPrivacyAuthorizationChange: OffPrivacyAuthorizationChange = {
(_ id: NSNumber) -> Void in
UTSiOS.offPrivacyAgreeChange(id)
}
public var agreePrivacyAuthorization: AgreePrivacyAuthorization = {
() -> Void in
UTSiOS.setPrivacyAgree(true)
}
@objc(UTSSDKModulesDCloudUniPrivacyGetPrivacySettingOptionsJSONObject)
@objcMembers
public class GetPrivacySettingOptionsJSONObject : NSObject {
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
public func getPrivacySettingByJs(_ options: GetPrivacySettingOptionsJSONObject) -> Void {
    return getPrivacySetting(GetPrivacySettingOptions(UTSJSONObject([
        "success": {
        (result: GetPrivacySettingSuccessResult) -> Void in
        options.success?(result)
        },
        "fail": {
        (result: Any) -> Void in
        options.fail?(result)
        },
        "complete": {
        (result: Any) -> Void in
        options.complete?(result)
        }
    ])))
}
public func resetPrivacyAuthorizationByJs() -> Void {
    return resetPrivacyAuthorization()
}
public func onPrivacyAuthorizationChangeByJs(_ callback: UTSCallback) -> NSNumber {
    return onPrivacyAuthorizationChange({
    (res: PrivacyChangeResult) -> Void in
    callback(res)
    })
}
public func offPrivacyAuthorizationChangeByJs(_ id: NSNumber) -> Void {
    return offPrivacyAuthorizationChange(id)
}
public func agreePrivacyAuthorizationByJs() -> Void {
    return agreePrivacyAuthorization()
}
@objc(UTSSDKModulesDCloudUniPrivacyIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniPrivacyIndexSwift : NSObject {
    public static func s_getPrivacySettingByJs(_ options: GetPrivacySettingOptionsJSONObject) -> Void {
        return getPrivacySettingByJs(options)
    }
    public static func s_resetPrivacyAuthorizationByJs() -> Void {
        return resetPrivacyAuthorizationByJs()
    }
    public static func s_onPrivacyAuthorizationChangeByJs(_ callback: UTSCallback) -> NSNumber {
        return onPrivacyAuthorizationChangeByJs(callback)
    }
    public static func s_offPrivacyAuthorizationChangeByJs(_ id: NSNumber) -> Void {
        return offPrivacyAuthorizationChangeByJs(id)
    }
    public static func s_agreePrivacyAuthorizationByJs() -> Void {
        return agreePrivacyAuthorizationByJs()
    }
}
