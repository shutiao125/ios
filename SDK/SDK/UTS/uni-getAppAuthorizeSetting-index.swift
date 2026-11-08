import DCloudUTSFoundation
public typealias GetAppAuthorizeSetting = () -> GetAppAuthorizeSettingResult
@objc(UTSSDKModulesDCloudUniGetAppAuthorizeSettingGetAppAuthorizeSettingResult)
@objcMembers
public class GetAppAuthorizeSettingResult : NSObject, UTSObject {
    public var albumAuthorized: String!
    public var bluetoothAuthorized: String!
    public var cameraAuthorized: String!
    public var locationAuthorized: String!
    public var locationAccuracy: String?
    public var locationReducedAccuracy: Bool = false
    public var microphoneAuthorized: String!
    public var notificationAuthorized: String!
    public var notificationAlertAuthorized: String?
    public var notificationBadgeAuthorized: String?
    public var notificationSoundAuthorized: String?
    public var phoneCalendarAuthorized: String?
    public var readPhoneCalendarAuthorized: String?
    public var writePhoneCalendarAuthorized: String?
    public var pasteboardAuthorized: String?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "albumAuthorized":
                    self.albumAuthorized = try! utsSubscriptCheckValue(newValue)
                case "bluetoothAuthorized":
                    self.bluetoothAuthorized = try! utsSubscriptCheckValue(newValue)
                case "cameraAuthorized":
                    self.cameraAuthorized = try! utsSubscriptCheckValue(newValue)
                case "locationAuthorized":
                    self.locationAuthorized = try! utsSubscriptCheckValue(newValue)
                case "locationAccuracy":
                    self.locationAccuracy = try! utsSubscriptCheckValueIfPresent(newValue)
                case "locationReducedAccuracy":
                    self.locationReducedAccuracy = try! utsSubscriptCheckValue(newValue)
                case "microphoneAuthorized":
                    self.microphoneAuthorized = try! utsSubscriptCheckValue(newValue)
                case "notificationAuthorized":
                    self.notificationAuthorized = try! utsSubscriptCheckValue(newValue)
                case "notificationAlertAuthorized":
                    self.notificationAlertAuthorized = try! utsSubscriptCheckValueIfPresent(newValue)
                case "notificationBadgeAuthorized":
                    self.notificationBadgeAuthorized = try! utsSubscriptCheckValueIfPresent(newValue)
                case "notificationSoundAuthorized":
                    self.notificationSoundAuthorized = try! utsSubscriptCheckValueIfPresent(newValue)
                case "phoneCalendarAuthorized":
                    self.phoneCalendarAuthorized = try! utsSubscriptCheckValueIfPresent(newValue)
                case "readPhoneCalendarAuthorized":
                    self.readPhoneCalendarAuthorized = try! utsSubscriptCheckValueIfPresent(newValue)
                case "writePhoneCalendarAuthorized":
                    self.writePhoneCalendarAuthorized = try! utsSubscriptCheckValueIfPresent(newValue)
                case "pasteboardAuthorized":
                    self.pasteboardAuthorized = try! utsSubscriptCheckValueIfPresent(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.albumAuthorized = obj["albumAuthorized"] as! String
        self.bluetoothAuthorized = obj["bluetoothAuthorized"] as! String
        self.cameraAuthorized = obj["cameraAuthorized"] as! String
        self.locationAuthorized = obj["locationAuthorized"] as! String
        self.locationAccuracy = obj["locationAccuracy"] as! String?
        self.locationReducedAccuracy = (obj["locationReducedAccuracy"] as? Bool) ?? false
        self.microphoneAuthorized = obj["microphoneAuthorized"] as! String
        self.notificationAuthorized = obj["notificationAuthorized"] as! String
        self.notificationAlertAuthorized = obj["notificationAlertAuthorized"] as! String?
        self.notificationBadgeAuthorized = obj["notificationBadgeAuthorized"] as! String?
        self.notificationSoundAuthorized = obj["notificationSoundAuthorized"] as! String?
        self.phoneCalendarAuthorized = obj["phoneCalendarAuthorized"] as! String?
        self.readPhoneCalendarAuthorized = obj["readPhoneCalendarAuthorized"] as! String?
        self.writePhoneCalendarAuthorized = obj["writePhoneCalendarAuthorized"] as! String?
        self.pasteboardAuthorized = obj["pasteboardAuthorized"] as! String?
    }
}
public var getAppAuthorizeSetting: GetAppAuthorizeSetting = {
() -> GetAppAuthorizeSettingResult in
var setting: Map<String, Any> = UTSiOS.getAppAuthorizeSetting()
var result = GetAppAuthorizeSettingResult(UTSJSONObject([
    "cameraAuthorized": "",
    "locationAuthorized": "",
    "locationAccuracy": nil,
    "microphoneAuthorized": "",
    "notificationAuthorized": "",
    "albumAuthorized": "",
    "bluetoothAuthorized": "",
    "locationReducedAccuracy": false,
    "notificationAlertAuthorized": nil,
    "notificationBadgeAuthorized": nil,
    "notificationSoundAuthorized": nil,
    "phoneCalendarAuthorized": nil
]))
if (setting.has("cameraAuthorized")) {
    result.cameraAuthorized = setting.get("cameraAuthorized") as! String
}
if (setting.has("locationAuthorized")) {
    result.locationAuthorized = setting.get("locationAuthorized") as! String
}
if (setting.has("locationAccuracy")) {
    result.locationAccuracy = setting.get("locationAccuracy") as! String
}
if (setting.has("microphoneAuthorized")) {
    result.microphoneAuthorized = setting.get("microphoneAuthorized") as! String
}
if (setting.has("notificationAuthorized")) {
    result.notificationAuthorized = setting.get("notificationAuthorized") as! String
}
if (setting.has("albumAuthorized")) {
    result.albumAuthorized = setting.get("albumAuthorized") as! String
}
if (setting.has("bluetoothAuthorized")) {
    result.bluetoothAuthorized = setting.get("bluetoothAuthorized") as! String
}
if (setting.has("locationReducedAccuracy")) {
    result.locationReducedAccuracy = setting.get("locationReducedAccuracy") as! Bool
}
if (setting.has("notificationAlertAuthorized")) {
    result.notificationAlertAuthorized = setting.get("notificationAlertAuthorized") as! String
}
if (setting.has("notificationBadgeAuthorized")) {
    result.notificationBadgeAuthorized = setting.get("notificationBadgeAuthorized") as! String
}
if (setting.has("notificationSoundAuthorized")) {
    result.notificationSoundAuthorized = setting.get("notificationSoundAuthorized") as! String
}
return result
}
public func getAppAuthorizeSettingByJs() -> GetAppAuthorizeSettingResult {
    return getAppAuthorizeSetting()
}
@objc(UTSSDKModulesDCloudUniGetAppAuthorizeSettingIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniGetAppAuthorizeSettingIndexSwift : NSObject {
    public static func s_getAppAuthorizeSettingByJs() -> GetAppAuthorizeSettingResult {
        return getAppAuthorizeSettingByJs()
    }
}
