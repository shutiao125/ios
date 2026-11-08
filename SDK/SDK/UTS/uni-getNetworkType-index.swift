import CoreTelephony
import DCloudUTSFoundation
import SystemConfiguration
public typealias GetNetworkType = (_ options: GetNetworkTypeOptions) -> Void
@objc(UTSSDKModulesDCloudUniGetNetworkTypeGetNetworkTypeSuccess)
@objcMembers
public class GetNetworkTypeSuccess : NSObject, UTSObject {
    public var networkType: String!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "networkType":
                    self.networkType = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.networkType = obj["networkType"] as! String
    }
}
public typealias GetNetworkTypeSuccessCallback = (_ result: GetNetworkTypeSuccess) -> Void
public typealias GetNetworkTypeFail = UniError
public typealias GetNetworkTypeFailCallback = (_ result: GetNetworkTypeFail) -> Void
public typealias GetNetworkTypeComplete = Any
public typealias GetNetworkTypeCompleteCallback = (_ result: GetNetworkTypeComplete) -> Void
@objc(UTSSDKModulesDCloudUniGetNetworkTypeGetNetworkTypeOptions)
@objcMembers
public class GetNetworkTypeOptions : NSObject, UTSObject {
    public var success: GetNetworkTypeSuccessCallback?
    public var fail: GetNetworkTypeFailCallback?
    public var complete: GetNetworkTypeCompleteCallback?
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
        self.success = obj["success"] as! GetNetworkTypeSuccessCallback?
        self.fail = obj["fail"] as! GetNetworkTypeFailCallback?
        self.complete = obj["complete"] as! GetNetworkTypeCompleteCallback?
    }
}
@objc(UTSSDKModulesDCloudUniGetNetworkTypeOnNetworkStatusChangeCallbackResult)
@objcMembers
public class OnNetworkStatusChangeCallbackResult : NSObject, UTSObject {
    public var isConnected: Bool = false
    public var networkType: String!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "isConnected":
                    self.isConnected = try! utsSubscriptCheckValue(newValue)
                case "networkType":
                    self.networkType = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.isConnected = obj["isConnected"] as! Bool
        self.networkType = obj["networkType"] as! String
    }
}
public typealias OnNetworkStatusChangeCallback = (_ result: OnNetworkStatusChangeCallbackResult) -> Void
public typealias OnNetworkStatusChange = (_ listener: @escaping OnNetworkStatusChangeCallback) -> NSNumber
public typealias OffNetworkStatusChange = (_ listener: Any?) -> Void
public var getNetworkType: GetNetworkType = {
(_ options: GetNetworkTypeOptions) -> Void in
var networkType = getInternalNetworkType()
var result = GetNetworkTypeSuccess(UTSJSONObject([
    "networkType": networkType
]))
options.success?(result)
options.complete?(result)
}
public var onNetworkStatusChangeCallbacks: Map<NSNumber, OnNetworkStatusChangeCallback> = Map()
public var semaphore = DispatchSemaphore(value: 1)
public var onNetworkStatusChangeIndex: NSNumber = 0
public var onNetworkStatusChange: OnNetworkStatusChange = {
(_ listener: @escaping OnNetworkStatusChangeCallback) -> NSNumber in
semaphore.wait()
onNetworkStatusChangeIndex++
semaphore.signal()
onNetworkStatusChangeCallbacks[onNetworkStatusChangeIndex] = listener
getNetworkType(GetNetworkTypeOptions(UTSJSONObject([
    "success": {
    (_ res: GetNetworkTypeSuccess) -> Void in
    var result = OnNetworkStatusChangeCallbackResult(UTSJSONObject([
        "isConnected": res.networkType != "none",
        "networkType": res.networkType
    ]))
    onNetworkStatusChangeCallbacks.forEach({
    (_ value: @escaping OnNetworkStatusChangeCallback, _ key: NSNumber) -> Void in
    value(result)
    })
    },
    "fail": {
    (_ err: UniError) -> Void in
    var result = OnNetworkStatusChangeCallbackResult(UTSJSONObject([
        "isConnected": false,
        "networkType": "unknown"
    ]))
    onNetworkStatusChangeCallbacks.forEach({
    (_ value: @escaping OnNetworkStatusChangeCallback, _ key: NSNumber) -> Void in
    value(result)
    })
    }
])))
UniNetWorkManager.shared.startNetworkTypeMonitoring()
UniNetWorkManager.shared.startNetworkPermissionMonitoring()
UniNetWorkManager.shared.onNetworkPermissionChange({
(_ permission: Bool) -> Void in
var res = OnNetworkStatusChangeCallbackResult(UTSJSONObject([
    "isConnected": permission && UniNetWorkManager.shared.isNetworkAvailable,
    "networkType": permission ? UniNetWorkManager.shared.currentNetworkType.description() : UniNetConnectionType.unknown.description()
]))
onNetworkStatusChangeCallbacks.forEach({
(_ value: @escaping OnNetworkStatusChangeCallback, _ key: NSNumber) -> Void in
value(res)
})
})
UniNetWorkManager.shared.onNetworkTypeChanged = {
(_ oldType: UniNetConnectionType, _ newType: UniNetConnectionType) -> Void in
var res = OnNetworkStatusChangeCallbackResult(UTSJSONObject([
    "isConnected": UniNetWorkManager.shared.isNetworkAvailable,
    "networkType": newType.description()
]))
onNetworkStatusChangeCallbacks.forEach({
(_ value: @escaping OnNetworkStatusChangeCallback, _ key: NSNumber) -> Void in
value(res)
})
}
return onNetworkStatusChangeIndex
}
public var offNetworkStatusChange: OffNetworkStatusChange = {
(_ listener: Any?) -> Void in
if (listener != nil && UTSiOS.typeof(listener!) == "number") {
    var id = listener as! NSNumber
    onNetworkStatusChangeCallbacks.delete(id)
} else {
    onNetworkStatusChangeCallbacks.clear()
}
UniNetWorkManager.shared.stopNetworkTypeMonitoring()
UniNetWorkManager.shared.stopNetworkPermissionMonitoring()
UniNetWorkManager.shared.clearNetworkHistory()
UniNetWorkManager.shared.clearAllCallbacks()
}
public func getInternalNetworkType() -> String {
    var zeroAddress = sockaddr_in()
    zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
    zeroAddress.sin_family = sa_family_t(AF_INET)
    var defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
    (_ body) -> SCNetworkReachability? in
    return body.withMemoryRebound(to: sockaddr.self, capacity: 1 as! Int, {
    (_ body) -> SCNetworkReachability? in
    return SCNetworkReachabilityCreateWithAddress(nil, body)
    })
    })
    if (defaultRouteReachability == nil) {
        return "unknown"
    }
    var flags: SCNetworkReachabilityFlags = []
    if (!SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags)) {
        return "unknown"
    }
    var isReachable = flags.contains(SCNetworkReachabilityFlags.reachable)
    var needsConnection = flags.contains(SCNetworkReachabilityFlags.connectionRequired)
    var canConnectionAutomatically = (flags.contains(SCNetworkReachabilityFlags.connectionOnDemand) || flags.contains(SCNetworkReachabilityFlags.connectionOnTraffic))
    var canConnectWithoutUserInteraction = (canConnectionAutomatically && !flags.contains(SCNetworkReachabilityFlags.interventionRequired))
    var isNetworkReachable = (isReachable && (!needsConnection || canConnectWithoutUserInteraction))
    var status = "unknown"
    if (!isNetworkReachable) {
        status = "none"
    } else if (flags.contains(SCNetworkReachabilityFlags.isWWAN)) {
        var networkInfo = CTTelephonyNetworkInfo()
        var carrierType = networkInfo.serviceCurrentRadioAccessTechnology
        var carrierTypeName = carrierType?.first?.value
        if (carrierTypeName == nil) {
            status = "unknown"
        } else {
            var typeStrings2G = [
                CTRadioAccessTechnologyEdge,
                CTRadioAccessTechnologyGPRS,
                CTRadioAccessTechnologyCDMA1x
            ]
            var typeStrings3G = [
                CTRadioAccessTechnologyHSDPA,
                CTRadioAccessTechnologyWCDMA,
                CTRadioAccessTechnologyHSUPA,
                CTRadioAccessTechnologyCDMAEVDORev0,
                CTRadioAccessTechnologyCDMAEVDORevA,
                CTRadioAccessTechnologyCDMAEVDORevB,
                CTRadioAccessTechnologyeHRPD
            ]
            var typeStrings4G = [
                CTRadioAccessTechnologyLTE
            ]
            if (typeStrings2G.indexOf(carrierTypeName!) != -1) {
                status = "2g"
            } else if (typeStrings3G.indexOf(carrierTypeName!) != -1) {
                status = "3g"
            } else if (typeStrings4G.indexOf(carrierTypeName!) != -1) {
                status = "4g"
            } else {
                if #available(iOS 14.1, *) {
                    if (carrierTypeName != CTRadioAccessTechnologyNRNSA || carrierTypeName != CTRadioAccessTechnologyNR) {
                        status = "5g"
                    }
                }
            }
        }
    } else {
        status = "wifi"
    }
    return status
}
@objc(UTSSDKModulesDCloudUniGetNetworkTypeGetNetworkTypeOptionsJSONObject)
@objcMembers
public class GetNetworkTypeOptionsJSONObject : NSObject {
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
public func getNetworkTypeByJs(_ options: GetNetworkTypeOptionsJSONObject) -> Void {
    return getNetworkType(GetNetworkTypeOptions(UTSJSONObject([
        "success": {
        (result: GetNetworkTypeSuccess) -> Void in
        options.success?(result)
        },
        "fail": {
        (result: GetNetworkTypeFail) -> Void in
        options.fail?(result)
        },
        "complete": {
        (result: GetNetworkTypeComplete) -> Void in
        options.complete?(result)
        }
    ])))
}
public func onNetworkStatusChangeByJs(_ listener: UTSCallback) -> NSNumber {
    return onNetworkStatusChange({
    (result: OnNetworkStatusChangeCallbackResult) -> Void in
    listener(result)
    })
}
public func offNetworkStatusChangeByJs(_ listener: Any?) -> Void {
    return offNetworkStatusChange(listener)
}
@objc(UTSSDKModulesDCloudUniGetNetworkTypeIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniGetNetworkTypeIndexSwift : NSObject {
    public static func s_getNetworkTypeByJs(_ options: GetNetworkTypeOptionsJSONObject) -> Void {
        return getNetworkTypeByJs(options)
    }
    public static func s_onNetworkStatusChangeByJs(_ listener: UTSCallback) -> NSNumber {
        return onNetworkStatusChangeByJs(listener)
    }
    public static func s_offNetworkStatusChangeByJs(_ listener: Any?) -> Void {
        return offNetworkStatusChangeByJs(listener)
    }
}
