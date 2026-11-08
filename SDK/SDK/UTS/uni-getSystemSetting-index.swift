import DCloudUTSFoundation
@objc(UTSSDKModulesDCloudUniGetSystemSettingGetSystemSettingResult)
@objcMembers
public class GetSystemSettingResult : NSObject, UTSObject {
    public var bluetoothEnabled: Bool = false
    public var bluetoothError: String?
    public var locationEnabled: Bool = false
    public var wifiEnabled: Bool = false
    public var wifiError: String?
    public var deviceOrientation: String!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "bluetoothEnabled":
                    self.bluetoothEnabled = try! utsSubscriptCheckValue(newValue)
                case "bluetoothError":
                    self.bluetoothError = try! utsSubscriptCheckValueIfPresent(newValue)
                case "locationEnabled":
                    self.locationEnabled = try! utsSubscriptCheckValue(newValue)
                case "wifiEnabled":
                    self.wifiEnabled = try! utsSubscriptCheckValue(newValue)
                case "wifiError":
                    self.wifiError = try! utsSubscriptCheckValueIfPresent(newValue)
                case "deviceOrientation":
                    self.deviceOrientation = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.bluetoothEnabled = (obj["bluetoothEnabled"] as? Bool) ?? false
        self.bluetoothError = obj["bluetoothError"] as! String?
        self.locationEnabled = obj["locationEnabled"] as! Bool
        self.wifiEnabled = (obj["wifiEnabled"] as? Bool) ?? false
        self.wifiError = obj["wifiError"] as! String?
        self.deviceOrientation = obj["deviceOrientation"] as! String
    }
}
public typealias GetSystemSetting = () -> GetSystemSettingResult
public var getSystemSetting: GetSystemSetting = {
() -> GetSystemSettingResult in
var setting: Map<String, Any> = UTSiOS.getSystemSetting()
var result = GetSystemSettingResult(UTSJSONObject([
    "deviceOrientation": "portrait",
    "locationEnabled": false
]))
if (setting.has("bluetoothEnabled")) {
    result.bluetoothEnabled = setting.get("bluetoothEnabled") as! Bool
}
if (setting.has("bluetoothError")) {
    result.bluetoothError = setting.get("bluetoothError") as! String
}
if (setting.has("locationEnabled")) {
    result.locationEnabled = setting.get("locationEnabled") as! Bool
}
if (setting.has("wifiEnabled")) {
    result.wifiEnabled = setting.get("wifiEnabled") as! Bool
}
if (setting.has("deviceOrientation")) {
    result.deviceOrientation = setting.get("deviceOrientation") as! String
}
return result
}
public func getSystemSettingByJs() -> GetSystemSettingResult {
    return getSystemSetting()
}
@objc(UTSSDKModulesDCloudUniGetSystemSettingIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniGetSystemSettingIndexSwift : NSObject {
    public static func s_getSystemSettingByJs() -> GetSystemSettingResult {
        return getSystemSettingByJs()
    }
}
