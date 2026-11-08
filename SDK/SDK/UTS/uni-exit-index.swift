import DCloudUTSFoundation
@objc(UTSSDKModulesDCloudUniExitExitSuccess)
@objcMembers
public class ExitSuccess : NSObject, UTSObject {
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
public typealias ExitErrorCode = NSNumber
public protocol IExitError : IUniError {
    var errCode: ExitErrorCode { get set }
}
public typealias ExitFail = IExitError
public typealias ExitSuccessCallback = (_ res: ExitSuccess) -> Void
public typealias ExitFailCallback = (_ res: ExitFail) -> Void
public typealias ExitCompleteCallback = (_ res: Any) -> Void
@objc(UTSSDKModulesDCloudUniExitExitOptions)
@objcMembers
public class ExitOptions : NSObject, UTSObject {
    public var success: ExitSuccessCallback?
    public var fail: ExitFailCallback?
    public var complete: ExitCompleteCallback?
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
        self.success = obj["success"] as! ExitSuccessCallback?
        self.fail = obj["fail"] as! ExitFailCallback?
        self.complete = obj["complete"] as! ExitCompleteCallback?
    }
}
public typealias Exit = (_ options: ExitOptions?) -> Void
public var ExitUniErrorSubject = "uni-exit"
public var ExitUniErrors: Map<NSNumber, String> = Map([
    [
        12001,
        "system not support"
    ],
    [
        12002,
        "unknown error"
    ],
    [
        12003,
        "app exit is supported only in uni-app x SDK mode"
    ]
])
@objc(UTSSDKModulesDCloudUniExitExitFailImpl)
@objcMembers
public class ExitFailImpl : UniError, IExitError {
    public init(_ errCode: ExitErrorCode){
        super.init()
        self.errSubject = ExitUniErrorSubject
        self.errCode = errCode
        self.errMsg = ExitUniErrors[errCode] ?? ""
    }
}
public var exit: Exit = {
(_ options: ExitOptions?) -> Void in
var result = UTSiOS.exit()
if (result) {
    var ret = ExitSuccess(UTSJSONObject([
        "errMsg": "exit:ok"
    ]))
    options?.success?(ret)
    options?.complete?(ret)
} else {
    var error = ExitFailImpl(12003)
    options?.fail?(error)
    options?.complete?(error)
}
}
@objc(UTSSDKModulesDCloudUniExitExitOptionsJSONObject)
@objcMembers
public class ExitOptionsJSONObject : NSObject {
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
public func exitByJs(_ options: ExitOptionsJSONObject?) -> Void {
    return exit(options != nil ? ExitOptions(UTSJSONObject([
        "success": {
        (res: ExitSuccess) -> Void in
        options!.success?(res)
        },
        "fail": {
        (res: ExitFail) -> Void in
        options!.fail?(res)
        },
        "complete": {
        (res: Any) -> Void in
        options!.complete?(res)
        }
    ])) : nil)
}
@objc(UTSSDKModulesDCloudUniExitIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniExitIndexSwift : NSObject {
    public static func s_exitByJs(_ options: ExitOptionsJSONObject?) -> Void {
        return exitByJs(options)
    }
}
