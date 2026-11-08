import DCloudUTSFoundation
import Dispatch
import Foundation
import UIKit
@objc(UTSSDKModulesDCloudUniGetDeviceInfoDeviceUtil)
@objcMembers
public class DeviceUtil : NSObject {
    public static func isPad() -> Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad
    }
    public static func getOSVersion() -> String {
        return UIDevice.current.systemVersion
    }
    public static func getLan() -> String {
        var currentLanguage = NSLocale.preferredLanguages[0]
        return currentLanguage == nil ? "" : currentLanguage
    }
    public static func getOrientation() -> String {
        var orientation = "portrait"
        var orient = UIApplication.shared.statusBarOrientation
        if (orient == UIInterfaceOrientation.landscapeLeft || orient == UIInterfaceOrientation.landscapeRight) {
            orientation = "landscape"
        }
        return orientation
    }
    public static func hasRootPrivilege() -> Bool {
        return UTSiOS.isRoot()
    }
}
@objc(UTSSDKModulesDCloudUniGetDeviceInfoGetDeviceInfoOptions)
@objcMembers
public class GetDeviceInfoOptions : NSObject, UTSObject {
    public var filter: Array<String>!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "filter":
                    self.filter = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.filter = obj["filter"] as! Array<String>
    }
}
@objc(UTSSDKModulesDCloudUniGetDeviceInfoGetDeviceInfoResult)
@objcMembers
public class GetDeviceInfoResult : NSObject, UTSObject {
    public var brand: String?
    public var deviceBrand: String?
    public var deviceId: String?
    public var model: String?
    public var deviceModel: String?
    public var deviceType: String?
    public var deviceOrientation: String?
    public var devicePixelRatio: NSNumber?
    public var system: String?
    public var platform: String?
    public var isRoot: Bool = false
    public var isSimulator: Bool = false
    public var isUSBDebugging: Bool = false
    public var osName: String?
    public var osVersion: String?
    public var osLanguage: String?
    public var osTheme: String?
    public var osAndroidAPILevel: NSNumber?
    public var osHarmonySDKAPIVersion: NSNumber?
    public var osHarmonyDisplayVersion: String?
    public var romName: String?
    public var romVersion: String?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "brand":
                    self.brand = try! utsSubscriptCheckValueIfPresent(newValue)
                case "deviceBrand":
                    self.deviceBrand = try! utsSubscriptCheckValueIfPresent(newValue)
                case "deviceId":
                    self.deviceId = try! utsSubscriptCheckValueIfPresent(newValue)
                case "model":
                    self.model = try! utsSubscriptCheckValueIfPresent(newValue)
                case "deviceModel":
                    self.deviceModel = try! utsSubscriptCheckValueIfPresent(newValue)
                case "deviceType":
                    self.deviceType = try! utsSubscriptCheckValueIfPresent(newValue)
                case "deviceOrientation":
                    self.deviceOrientation = try! utsSubscriptCheckValueIfPresent(newValue)
                case "devicePixelRatio":
                    self.devicePixelRatio = try! utsSubscriptCheckValueIfPresent(newValue)
                case "system":
                    self.system = try! utsSubscriptCheckValueIfPresent(newValue)
                case "platform":
                    self.platform = try! utsSubscriptCheckValueIfPresent(newValue)
                case "isRoot":
                    self.isRoot = try! utsSubscriptCheckValue(newValue)
                case "isSimulator":
                    self.isSimulator = try! utsSubscriptCheckValue(newValue)
                case "isUSBDebugging":
                    self.isUSBDebugging = try! utsSubscriptCheckValue(newValue)
                case "osName":
                    self.osName = try! utsSubscriptCheckValueIfPresent(newValue)
                case "osVersion":
                    self.osVersion = try! utsSubscriptCheckValueIfPresent(newValue)
                case "osLanguage":
                    self.osLanguage = try! utsSubscriptCheckValueIfPresent(newValue)
                case "osTheme":
                    self.osTheme = try! utsSubscriptCheckValueIfPresent(newValue)
                case "osAndroidAPILevel":
                    self.osAndroidAPILevel = try! utsSubscriptCheckValueIfPresent(newValue)
                case "osHarmonySDKAPIVersion":
                    self.osHarmonySDKAPIVersion = try! utsSubscriptCheckValueIfPresent(newValue)
                case "osHarmonyDisplayVersion":
                    self.osHarmonyDisplayVersion = try! utsSubscriptCheckValueIfPresent(newValue)
                case "romName":
                    self.romName = try! utsSubscriptCheckValueIfPresent(newValue)
                case "romVersion":
                    self.romVersion = try! utsSubscriptCheckValueIfPresent(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.brand = obj["brand"] as! String?
        self.deviceBrand = obj["deviceBrand"] as! String?
        self.deviceId = obj["deviceId"] as! String?
        self.model = obj["model"] as! String?
        self.deviceModel = obj["deviceModel"] as! String?
        self.deviceType = obj["deviceType"] as! String?
        self.deviceOrientation = obj["deviceOrientation"] as! String?
        self.devicePixelRatio = obj["devicePixelRatio"] as! NSNumber?
        self.system = obj["system"] as! String?
        self.platform = obj["platform"] as! String?
        self.isRoot = (obj["isRoot"] as? Bool) ?? false
        self.isSimulator = (obj["isSimulator"] as? Bool) ?? false
        self.isUSBDebugging = (obj["isUSBDebugging"] as? Bool) ?? false
        self.osName = obj["osName"] as! String?
        self.osVersion = obj["osVersion"] as! String?
        self.osLanguage = obj["osLanguage"] as! String?
        self.osTheme = obj["osTheme"] as! String?
        self.osAndroidAPILevel = obj["osAndroidAPILevel"] as! NSNumber?
        self.osHarmonySDKAPIVersion = obj["osHarmonySDKAPIVersion"] as! NSNumber?
        self.osHarmonyDisplayVersion = obj["osHarmonyDisplayVersion"] as! String?
        self.romName = obj["romName"] as! String?
        self.romVersion = obj["romVersion"] as! String?
    }
}
public typealias GetDeviceInfo = (_ options: GetDeviceInfoOptions?) -> GetDeviceInfoResult
public func isSimulator() -> Bool {
    return UTSiOS.isSimulator()
}
public var getDeviceInfo: GetDeviceInfo = {
(_ config: GetDeviceInfoOptions?) -> GetDeviceInfoResult in
var filter: Array<String> = []
if (config != nil && config?.filter != nil) {
    var temp = config?.filter
    filter = temp!
}
if (config == nil || filter.length == 0) {
    var defaultFilter = [
        "brand",
        "deviceBrand",
        "deviceId",
        "model",
        "deviceModel",
        "deviceType",
        "deviceOrientation",
        "devicePixelRatio",
        "system",
        "platform",
        "isRoot",
        "isSimulator",
        "osName",
        "osVersion",
        "osLanguage",
        "osTheme",
        "romName",
        "romVersion"
    ]
    filter = defaultFilter
}
return getBaseInfo(filter)
}
public func getBaseInfo(_ filterArray: Array<String>) -> GetDeviceInfoResult {
    var osVersion = DeviceUtil.getOSVersion()
    var result = GetDeviceInfoResult(UTSJSONObject([:]))
    if (filterArray.indexOf("brand") != -1) {
        result.brand = "apple"
    }
    if (filterArray.indexOf("deviceBrand") != -1) {
        result.deviceBrand = "apple"
    }
    if (filterArray.indexOf("deviceId") != -1) {
        result.deviceId = UTSiOS.getDeviceId()
    }
    if (filterArray.indexOf("model") != -1) {
        result.model = UTSiOS.getModel()
    }
    if (filterArray.indexOf("deviceModel") != -1) {
        result.deviceModel = UTSiOS.getModel()
    }
    if (filterArray.indexOf("deviceType") != -1) {
        result.deviceType = DeviceUtil.isPad() ? "pad" : "phone"
    }
    if (filterArray.indexOf("deviceOrientation") != -1) {
        result.deviceOrientation = DeviceUtil.getOrientation()
    }
    if (filterArray.indexOf("devicePixelRatio") != -1) {
        result.devicePixelRatio = NSNumber.from(UIScreen.main.scale)
    }
    if (filterArray.indexOf("system") != -1) {
        result.system = String(format: "iOS %@", osVersion)
    }
    if (filterArray.indexOf("platform") != -1) {
        result.platform = "ios"
    }
    if (filterArray.indexOf("isRoot") != -1) {
        result.isRoot = DeviceUtil.hasRootPrivilege()
    }
    if (filterArray.indexOf("isSimulator") != -1) {
        result.isSimulator = UTSiOS.isSimulator()
    }
    if (filterArray.indexOf("osName") != -1) {
        result.osName = "ios"
    }
    if (filterArray.indexOf("osVersion") != -1) {
        result.osVersion = UIDevice.current.systemVersion
    }
    if (filterArray.indexOf("osLanguage") != -1) {
        result.osLanguage = UTSiOS.getOsLanguage()
    }
    if (filterArray.indexOf("osTheme") != -1) {
        result.osTheme = UTSiOS.getOsTheme()
    }
    if (filterArray.indexOf("romName") != -1) {
        result.romName = "ios"
    }
    if (filterArray.indexOf("romVersion") != -1) {
        result.romVersion = UIDevice.current.systemVersion
    }
    return result
}
@objc(UTSSDKModulesDCloudUniGetDeviceInfoGetDeviceInfoOptionsJSONObject)
@objcMembers
public class GetDeviceInfoOptionsJSONObject : NSObject {
    public var filter: Array<String>!
}
public func isSimulatorByJs() -> Bool {
    return isSimulator()
}
public func getDeviceInfoByJs(_ options: GetDeviceInfoOptionsJSONObject?) -> GetDeviceInfoResult {
    return getDeviceInfo(options != nil ? GetDeviceInfoOptions(UTSJSONObject([
        "filter": options!.filter
    ])) : nil)
}
@objc(UTSSDKModulesDCloudUniGetDeviceInfoIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniGetDeviceInfoIndexSwift : NSObject {
    public static func s_isSimulatorByJs() -> Bool {
        return isSimulatorByJs()
    }
    public static func s_getDeviceInfoByJs(_ options: GetDeviceInfoOptionsJSONObject?) -> GetDeviceInfoResult {
        return getDeviceInfoByJs(options)
    }
}
