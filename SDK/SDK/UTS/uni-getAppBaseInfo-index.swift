import CommonCrypto
import DCloudUTSFoundation
import Foundation
import Swift
@objc(UTSSDKModulesDCloudUniGetAppBaseInfoAppBaseInfoDeviceUtil)
@objcMembers
public class AppBaseInfoDeviceUtil : NSObject {
    public static func getAppID() -> String {
        return UTSiOS.getAppId()
    }
    public static func getAppName() -> String {
        return UTSiOS.getAppName()
    }
    public static func getHostName() -> String {
        return UTSiOS.getHostName()
    }
    public static func getHostTheme() -> String {
        return UTSiOS.getHostTheme()
    }
    public static func getHostLanguage() -> String {
        return UTSiOS.getHostLanguage()
    }
    public static func getHostVersion() -> String {
        return UTSiOS.getHostVersion()
    }
    public static func getHostPackageName() -> String {
        return UTSiOS.getHostPackageName()
    }
    public static func getAppVersion() -> String {
        return UTSiOS.getAppVersion()
    }
    public static func getAppVersionCode() -> String {
        return UTSiOS.getAppVersionCode()
    }
    public static func getAppWgtVersion() -> String {
        return UTSiOS.getAppWgtVersion()
    }
    public static func getOsLanguage() -> String {
        return UTSiOS.getOsLanguage()
    }
    public static func getOsLanguageNormal() -> String {
        var LOCALE_ZH_HANS = "zh-Hans"
        var LOCALE_ZH_HANT = "zh-Hant"
        var locale = UTSiOS.getOsLanguage()
        if (locale.indexOf("zh") == 0) {
            if (locale.indexOf("-hans") > -1) {
                return LOCALE_ZH_HANS
            }
            if (locale.indexOf("-hant") > -1) {
                return LOCALE_ZH_HANT
            }
            if (locale.includes("-tw") || locale.includes("-hk") || locale.includes("-mo") || locale.includes("-cht")) {
                return LOCALE_ZH_HANT
            }
            return LOCALE_ZH_HANS
        } else {
            return locale
        }
    }
    public static func getAppInnerVersion() -> String {
        return UTSiOS.getInnerVersion()
    }
    public static func getBundleId() -> String {
        return Bundle.main.bundleIdentifier!
    }
    public static func getSignature() -> String {
        var bundleId = AppBaseInfoDeviceUtil.getBundleId()
        var embeddedPath = Bundle.main.path(forResource: "embedded", ofType: "mobileprovision")
        if (embeddedPath != nil) {
            if (FileManager.default.fileExists(atPath: embeddedPath!)) {
                var embeddedProvisioning: String? = try? String(contentsOfFile: embeddedPath!, encoding: String.Encoding.ascii)
                var embeddedProvisioningLines = embeddedProvisioning?.split("\n")
                var target = ""
                embeddedProvisioningLines?.forEach({
                (line: String, index: NSNumber) -> Void in
                if (line.indexOf("application-identifier") != -1) {
                    if (index + 1 < embeddedProvisioningLines!.length) {
                        target = embeddedProvisioningLines![index + 1]
                    }
                }
                })
                var leftStr = "<string>"
                var rightStr = "</string>"
                if (target != "") {
                    var start = target.indexOf(leftStr) + leftStr.length
                    var end = target.indexOf(rightStr)
                    var fullIdentifier = target.slice(start, end)
                    var idStart = fullIdentifier.indexOf(".") + 1
                    var id = fullIdentifier.slice(idStart)
                    if (id.length > 0) {
                        bundleId = id
                    }
                }
            }
        }
        var strData = bundleId.data(using: String.Encoding.utf8)!
        var digest = Array<UInt8>.init(repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
        strData.withUnsafeBytes({
        (body: UnsafeRawBufferPointer) -> Void in
        CC_MD5(body.baseAddress, UInt32(strData.count), &digest)
        })
        var md5String = ""
        digest.forEach({
        (byte: UInt8) -> Void in
        md5String += String(format: "%02x", UInt8(byte))
        })
        return md5String
    }
}
@objc(UTSSDKModulesDCloudUniGetAppBaseInfoGetAppBaseInfoOptions)
@objcMembers
public class GetAppBaseInfoOptions : NSObject, UTSObject {
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
@objc(UTSSDKModulesDCloudUniGetAppBaseInfoGetAppBaseInfoResult)
@objcMembers
public class GetAppBaseInfoResult : NSObject, UTSObject {
    public var appId: String?
    public var appName: String?
    public var appVersion: String?
    public var appVersionCode: String?
    public var appLanguage: String?
    public var appTheme: String?
    public var appWgtVersion: String?
    public var hostLanguage: String?
    public var hostVersion: String?
    public var hostName: String?
    public var hostPackageName: String?
    public var hostSDKVersion: String?
    public var hostTheme: String?
    public var isUniAppX: Bool = false
    public var uniCompileVersion: String?
    public var uniCompilerVersion: String?
    public var uniCompileVersionCode: NSNumber?
    public var uniCompilerVersionCode: NSNumber?
    public var uniRuntimeVersion: String?
    public var uniRuntimeVersionCode: NSNumber?
    public var uniPlatform: String?
    public var channel: String?
    public var packageName: String?
    public var bundleName: String?
    public var bundleId: String?
    public var signature: String?
    public var language: String?
    public var version: String?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "appId":
                    self.appId = try! utsSubscriptCheckValueIfPresent(newValue)
                case "appName":
                    self.appName = try! utsSubscriptCheckValueIfPresent(newValue)
                case "appVersion":
                    self.appVersion = try! utsSubscriptCheckValueIfPresent(newValue)
                case "appVersionCode":
                    self.appVersionCode = try! utsSubscriptCheckValueIfPresent(newValue)
                case "appLanguage":
                    self.appLanguage = try! utsSubscriptCheckValueIfPresent(newValue)
                case "appTheme":
                    self.appTheme = try! utsSubscriptCheckValueIfPresent(newValue)
                case "appWgtVersion":
                    self.appWgtVersion = try! utsSubscriptCheckValueIfPresent(newValue)
                case "hostLanguage":
                    self.hostLanguage = try! utsSubscriptCheckValueIfPresent(newValue)
                case "hostVersion":
                    self.hostVersion = try! utsSubscriptCheckValueIfPresent(newValue)
                case "hostName":
                    self.hostName = try! utsSubscriptCheckValueIfPresent(newValue)
                case "hostPackageName":
                    self.hostPackageName = try! utsSubscriptCheckValueIfPresent(newValue)
                case "hostSDKVersion":
                    self.hostSDKVersion = try! utsSubscriptCheckValueIfPresent(newValue)
                case "hostTheme":
                    self.hostTheme = try! utsSubscriptCheckValueIfPresent(newValue)
                case "isUniAppX":
                    self.isUniAppX = try! utsSubscriptCheckValue(newValue)
                case "uniCompileVersion":
                    self.uniCompileVersion = try! utsSubscriptCheckValueIfPresent(newValue)
                case "uniCompilerVersion":
                    self.uniCompilerVersion = try! utsSubscriptCheckValueIfPresent(newValue)
                case "uniCompileVersionCode":
                    self.uniCompileVersionCode = try! utsSubscriptCheckValueIfPresent(newValue)
                case "uniCompilerVersionCode":
                    self.uniCompilerVersionCode = try! utsSubscriptCheckValueIfPresent(newValue)
                case "uniRuntimeVersion":
                    self.uniRuntimeVersion = try! utsSubscriptCheckValueIfPresent(newValue)
                case "uniRuntimeVersionCode":
                    self.uniRuntimeVersionCode = try! utsSubscriptCheckValueIfPresent(newValue)
                case "uniPlatform":
                    self.uniPlatform = try! utsSubscriptCheckValueIfPresent(newValue)
                case "channel":
                    self.channel = try! utsSubscriptCheckValueIfPresent(newValue)
                case "packageName":
                    self.packageName = try! utsSubscriptCheckValueIfPresent(newValue)
                case "bundleName":
                    self.bundleName = try! utsSubscriptCheckValueIfPresent(newValue)
                case "bundleId":
                    self.bundleId = try! utsSubscriptCheckValueIfPresent(newValue)
                case "signature":
                    self.signature = try! utsSubscriptCheckValueIfPresent(newValue)
                case "language":
                    self.language = try! utsSubscriptCheckValueIfPresent(newValue)
                case "version":
                    self.version = try! utsSubscriptCheckValueIfPresent(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.appId = obj["appId"] as! String?
        self.appName = obj["appName"] as! String?
        self.appVersion = obj["appVersion"] as! String?
        self.appVersionCode = obj["appVersionCode"] as! String?
        self.appLanguage = obj["appLanguage"] as! String?
        self.appTheme = obj["appTheme"] as! String?
        self.appWgtVersion = obj["appWgtVersion"] as! String?
        self.hostLanguage = obj["hostLanguage"] as! String?
        self.hostVersion = obj["hostVersion"] as! String?
        self.hostName = obj["hostName"] as! String?
        self.hostPackageName = obj["hostPackageName"] as! String?
        self.hostSDKVersion = obj["hostSDKVersion"] as! String?
        self.hostTheme = obj["hostTheme"] as! String?
        self.isUniAppX = (obj["isUniAppX"] as? Bool) ?? false
        self.uniCompileVersion = obj["uniCompileVersion"] as! String?
        self.uniCompilerVersion = obj["uniCompilerVersion"] as! String?
        self.uniCompileVersionCode = obj["uniCompileVersionCode"] as! NSNumber?
        self.uniCompilerVersionCode = obj["uniCompilerVersionCode"] as! NSNumber?
        self.uniRuntimeVersion = obj["uniRuntimeVersion"] as! String?
        self.uniRuntimeVersionCode = obj["uniRuntimeVersionCode"] as! NSNumber?
        self.uniPlatform = obj["uniPlatform"] as! String?
        self.channel = obj["channel"] as! String?
        self.packageName = obj["packageName"] as! String?
        self.bundleName = obj["bundleName"] as! String?
        self.bundleId = obj["bundleId"] as! String?
        self.signature = obj["signature"] as! String?
        self.language = obj["language"] as! String?
        self.version = obj["version"] as! String?
    }
}
public typealias GetAppBaseInfo = (_ options: GetAppBaseInfoOptions?) -> GetAppBaseInfoResult
public var getAppBaseInfo: GetAppBaseInfo = {
(_ config: GetAppBaseInfoOptions?) -> GetAppBaseInfoResult in
var filter: Array<String> = []
if (config != nil && config!.filter != nil) {
    filter = config!.filter
}
if (config == nil || filter.length == 0) {
    var defaultFilter = [
        "appId",
        "appName",
        "appVersion",
        "appVersionCode",
        "appLanguage",
        "language",
        "version",
        "appWgtVersion",
        "hostLanguage",
        "hostVersion",
        "hostName",
        "hostPackageName",
        "hostSDKVersion",
        "hostTheme",
        "packageName",
        "bundleId",
        "signature",
        "isUniAppX",
        "uniCompilerVersion",
        "uniPlatform",
        "uniRuntimeVersion",
        "uniCompilerVersionCode",
        "uniRuntimeVersionCode",
        "appTheme",
        "channel"
    ]
    filter = defaultFilter
}
return getBaseInfo(filter)
}
public func getBaseInfo(_ filterArray: Array<String>) -> GetAppBaseInfoResult {
    var result = GetAppBaseInfoResult(UTSJSONObject([:]))
    if (filterArray.indexOf("appId") != -1) {
        result.appId = AppBaseInfoDeviceUtil.getAppID()
    }
    if (filterArray.indexOf("appName") != -1) {
        result.appName = AppBaseInfoDeviceUtil.getAppName()
    }
    if (UTSiOS.isUniMp()) {
        if (filterArray.indexOf("hostPackageName") != -1) {
            result.hostPackageName = AppBaseInfoDeviceUtil.getHostPackageName()
        }
        if (filterArray.indexOf("hostVersion") != -1) {
            result.hostVersion = AppBaseInfoDeviceUtil.getHostVersion()
        }
        if (filterArray.indexOf("hostName") != -1) {
            result.hostName = AppBaseInfoDeviceUtil.getHostName()
        }
        if (filterArray.indexOf("hostTheme") != -1) {
            result.hostTheme = AppBaseInfoDeviceUtil.getHostTheme()
        }
        if (filterArray.indexOf("hostLanguage") != -1) {
            result.hostLanguage = AppBaseInfoDeviceUtil.getHostLanguage()
        }
    }
    if (filterArray.indexOf("appVersion") != -1) {
        result.appVersion = AppBaseInfoDeviceUtil.getAppVersion()
    }
    if (filterArray.indexOf("appVersionCode") != -1) {
        result.appVersionCode = AppBaseInfoDeviceUtil.getAppVersionCode()
    }
    if (filterArray.indexOf("appLanguage") != -1) {
        result.appLanguage = AppBaseInfoDeviceUtil.getOsLanguageNormal()
    }
    if (filterArray.indexOf("language") != -1) {
        result.language = AppBaseInfoDeviceUtil.getOsLanguage()
    }
    if (filterArray.indexOf("version") != -1) {
        result.version = AppBaseInfoDeviceUtil.getAppInnerVersion()
    }
    if (filterArray.indexOf("appWgtVersion") != -1) {
        result.appWgtVersion = AppBaseInfoDeviceUtil.getAppWgtVersion()
    }
    if (filterArray.indexOf("packageName") != -1) {
        result.packageName = AppBaseInfoDeviceUtil.getBundleId()
    }
    if (filterArray.indexOf("bundleId") != -1) {
        result.bundleId = AppBaseInfoDeviceUtil.getBundleId()
    }
    if (filterArray.indexOf("signature") != -1) {
        result.signature = AppBaseInfoDeviceUtil.getSignature()
    }
    if (filterArray.indexOf("isUniAppX") != -1) {
        result.isUniAppX = UTSiOS.isUniAppX()
    }
    if (filterArray.indexOf("uniCompilerVersion") != -1) {
        result.uniCompilerVersion = UTSiOS.getCompileVersion()
    }
    if (filterArray.indexOf("uniPlatform") != -1) {
        result.uniPlatform = "app"
    }
    if (filterArray.indexOf("uniRuntimeVersion") != -1) {
        result.uniRuntimeVersion = UTSiOS.getRuntimeVersion()
    }
    if (filterArray.indexOf("uniCompilerVersionCode") != -1) {
        result.uniCompilerVersionCode = AppBaseInfoConvertVersionCode(UTSiOS.getCompileVersion())
    }
    if (filterArray.indexOf("uniRuntimeVersionCode") != -1) {
        result.uniRuntimeVersionCode = AppBaseInfoConvertVersionCode(UTSiOS.getRuntimeVersion())
    }
    if (filterArray.indexOf("appTheme") != -1) {
        result.appTheme = UTSiOS.getAppTheme()
    }
    if (filterArray.indexOf("channel") != -1) {
        result.channel = UTSiOS.getChannel()
    }
    return result
}
public var AppBaseInfoConvertVersionCode = {
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
@objc(UTSSDKModulesDCloudUniGetAppBaseInfoGetAppBaseInfoOptionsJSONObject)
@objcMembers
public class GetAppBaseInfoOptionsJSONObject : NSObject {
    public var filter: Array<String>!
}
public func getAppBaseInfoByJs(_ options: GetAppBaseInfoOptionsJSONObject?) -> GetAppBaseInfoResult {
    return getAppBaseInfo(options != nil ? GetAppBaseInfoOptions(UTSJSONObject([
        "filter": options!.filter
    ])) : nil)
}
@objc(UTSSDKModulesDCloudUniGetAppBaseInfoIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniGetAppBaseInfoIndexSwift : NSObject {
    public static func s_getAppBaseInfoByJs(_ options: GetAppBaseInfoOptionsJSONObject?) -> GetAppBaseInfoResult {
        return getAppBaseInfoByJs(options)
    }
}
