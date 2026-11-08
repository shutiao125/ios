import CoreLocation
import DCloudUTSFoundation
import Foundation
@_implementationOnly import TencentLBS
public typealias GetLocationFailImpl = GetLocationFailImpl__1
public var LocationUniErrorSubject = "uni-location"
public typealias LocationErrorCode = NSNumber
public protocol IGetLocationFail : IUniError {
    var errCode: LocationErrorCode { get set }
}
public typealias GetLocationFail = IGetLocationFail
public typealias GetLocation = (_ options: GetLocationOptions) -> Void
@objc(UTSSDKModulesDCloudUniGetLocationTencentUni1GetLocationSuccess)
@objcMembers
public class GetLocationSuccess : NSObject, UTSObject {
    public var latitude: NSNumber!
    public var longitude: NSNumber!
    public var speed: NSNumber!
    public var accuracy: NSNumber!
    public var altitude: NSNumber!
    public var verticalAccuracy: NSNumber!
    public var horizontalAccuracy: NSNumber!
    public var address: String?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "latitude":
                    self.latitude = try! utsSubscriptCheckValue(newValue)
                case "longitude":
                    self.longitude = try! utsSubscriptCheckValue(newValue)
                case "speed":
                    self.speed = try! utsSubscriptCheckValue(newValue)
                case "accuracy":
                    self.accuracy = try! utsSubscriptCheckValue(newValue)
                case "altitude":
                    self.altitude = try! utsSubscriptCheckValue(newValue)
                case "verticalAccuracy":
                    self.verticalAccuracy = try! utsSubscriptCheckValue(newValue)
                case "horizontalAccuracy":
                    self.horizontalAccuracy = try! utsSubscriptCheckValue(newValue)
                case "address":
                    self.address = try! utsSubscriptCheckValueIfPresent(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.latitude = obj["latitude"] as! NSNumber
        self.longitude = obj["longitude"] as! NSNumber
        self.speed = obj["speed"] as! NSNumber
        self.accuracy = obj["accuracy"] as! NSNumber
        self.altitude = obj["altitude"] as! NSNumber
        self.verticalAccuracy = obj["verticalAccuracy"] as! NSNumber
        self.horizontalAccuracy = obj["horizontalAccuracy"] as! NSNumber
        self.address = obj["address"] as! String?
    }
}
public typealias GetLocationSuccessCallback = (_ result: GetLocationSuccess) -> Void
public typealias GetLocationFailCallback = (_ result: GetLocationFail) -> Void
public typealias GetLocationComplete = Any
public typealias GetLocationCompleteCallback = (_ result: GetLocationComplete) -> Void
@objc(UTSSDKModulesDCloudUniGetLocationTencentUni1GetLocationOptions)
@objcMembers
public class GetLocationOptions : NSObject, UTSObject {
    public var type: String?
    public var altitude: Bool = false
    public var geocode: Bool = false
    public var highAccuracyExpireTime: NSNumber?
    public var isHighAccuracy: Bool = false
    public var success: GetLocationSuccessCallback?
    public var fail: GetLocationFailCallback?
    public var complete: GetLocationCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "type":
                    self.type = try! utsSubscriptCheckValueIfPresent(newValue)
                case "altitude":
                    self.altitude = try! utsSubscriptCheckValue(newValue)
                case "geocode":
                    self.geocode = try! utsSubscriptCheckValue(newValue)
                case "highAccuracyExpireTime":
                    self.highAccuracyExpireTime = try! utsSubscriptCheckValueIfPresent(newValue)
                case "isHighAccuracy":
                    self.isHighAccuracy = try! utsSubscriptCheckValue(newValue)
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
        self.type = obj["type"] as! String?
        self.altitude = (obj["altitude"] as? Bool) ?? false
        self.geocode = (obj["geocode"] as? Bool) ?? false
        self.highAccuracyExpireTime = obj["highAccuracyExpireTime"] as! NSNumber?
        self.isHighAccuracy = (obj["isHighAccuracy"] as? Bool) ?? false
        self.success = obj["success"] as! GetLocationSuccessCallback?
        self.fail = obj["fail"] as! GetLocationFailCallback?
        self.complete = obj["complete"] as! GetLocationCompleteCallback?
    }
}
public var LocationUniErrors: Map<LocationErrorCode, String> = Map([
    [
        1505003,
        "maybe not turn on the system location permission."
    ],
    [
        1505004,
        "maybe not obtain GPS Permission."
    ],
    [
        1505600,
        "location fail: timeout"
    ],
    [
        1505601,
        "system location support wgs84 only."
    ],
    [
        1505602,
        "location fail: request error"
    ],
    [
        1505603,
        "The system failed to retrieve geocode for the location."
    ],
    [
        1505604,
        "Failed to get provider."
    ],
    [
        1505700,
        "system location not support geocode."
    ],
    [
        1505701,
        "Provider is not find,Please ensure that the device location function is turned on"
    ],
    [
        1505800,
        "Unauthorized access to high-accuracy location services."
    ],
    [
        1505605,
        "The Tencent api key is misconfigured."
    ],
    [
        1505607,
        "GCJ-02 support only."
    ]
])
@objc(UTSSDKModulesDCloudUniGetLocationTencentUni1GetLocationFailImpl__1)
@objcMembers
public class GetLocationFailImpl__1 : UniError, IGetLocationFail {
    public init(_ errCode: LocationErrorCode){
        super.init()
        self.errSubject = LocationUniErrorSubject
        self.errCode = errCode
        self.errMsg = LocationUniErrors[errCode] ?? ""
    }
}
public var getLocation: GetLocation = {
(_ options: GetLocationOptions) -> Void in
LBSLocation.share.getLocationImpl(options)
}
@objc(UTSSDKModulesDCloudUniGetLocationTencentUni1LBSLocation)
@objcMembers
fileprivate class LBSLocation : NSObject, TencentLBSLocationManagerDelegate {
    public static var share = LBSLocation()
    private var locationManager: TencentLBSLocationManager!
    private var locationOptions: GetLocationOptions?
    private var requestLevel = TencentLBSRequestLevel.geo
    private var hasRequestLocationSuccess: Bool = false
    private func configLocationManager() {
        if (self.locationManager == nil) {
            TencentLBSLocationManager.setUserAgreePrivacy(true)
            self.locationManager = TencentLBSLocationManager()
            var apiKey = Bundle.main.infoDictionary?["TencentLBSAPIKey"]
            if (apiKey != nil) {
                self.locationManager.apiKey = apiKey! as! String
            }
            self.locationManager.delegate = self
        }
    }
    private func requestLocationWithAuthorization() {
        var status = self.getAuthorizationStatus()
        if (status == CLAuthorizationStatus.notDetermined) {
            self.locationManager.requestWhenInUseAuthorization()
        } else if (status == CLAuthorizationStatus.denied || status == CLAuthorizationStatus.restricted) {
            self.failedAction(1505004)
        } else if (status == CLAuthorizationStatus.authorizedAlways || status == CLAuthorizationStatus.authorizedWhenInUse) {
            self.getLocation()
        }
    }
    private func getAuthorizationStatus() -> CLAuthorizationStatus {
        return self.locationManager.authorizationStatus
    }
    public func getLocationImpl(_ options: GetLocationOptions) {
        self.configLocationManager()
        self.locationOptions = options
        DispatchQueue.main.async(execute: {
        () -> Void in
        if (CLLocationManager.locationServicesEnabled() == false) {
            self.failedAction(1505003)
            return
        }
        })
        if (options.highAccuracyExpireTime == nil) {
            self.locationOptions!.highAccuracyExpireTime = 3000
        }
        if (options.type == nil) {
            self.locationOptions!.type = "gcj02"
        }
        if (options.type != "gcj02") {
            self.failedAction(1505607)
            return
        }
        var apiKey = Bundle.main.infoDictionary?["TencentLBSAPIKey"]
        if (apiKey == nil) {
            self.failedAction(1505605)
            return
        }
        if (options.geocode) {
            self.requestLevel = TencentLBSRequestLevel.name
        }
        self.requestLocationWithAuthorization()
    }
    private func getLocation() {
        if #available(iOS 14.0, *) {
            if (self.locationOptions?.isHighAccuracy != nil && self.locationOptions?.isHighAccuracy == true && self.locationManager.accuracyAuthorization == TencentLBSAccuracyAuthorization.reducedAccuracy) {
                self.requestTemporaryFullAccuracyAuthorization()
            } else {
                if (self.locationOptions?.isHighAccuracy != nil && self.locationOptions?.isHighAccuracy == true) {
                    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
                } else {
                    self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
                }
                self.requestLocation()
            }
        } else {
            if (self.locationOptions?.isHighAccuracy != nil && self.locationOptions?.isHighAccuracy == true) {
                self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
            } else {
                if (self.locationOptions?.altitude != nil && self.locationOptions?.altitude == true) {
                    self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
                } else {
                    self.locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
                }
            }
            self.requestLocation()
        }
    }
    private func getAddress(_ location: TencentLBSLocation?) -> String? {
        var address: String? = nil
        if (self.locationOptions?.geocode != nil && self.locationOptions?.geocode == true) {
            var nation = location?.nation ?? ""
            var province = location?.province ?? ""
            var city = location?.city ?? ""
            var district = location?.district ?? ""
            var street = location?.street ?? ""
            var name = location?.name ?? ""
            if (city == province) {
                address = nation + province + district + street + name
            } else {
                address = nation + province + city + district + street + name
            }
            if (address == name) {
                address = (location?.address ?? "") + name
            }
        }
        return address
    }
    private func requestLocation() {
        self.hasRequestLocationSuccess = false
        self.locationManager.requestLocation(with: self.requestLevel, locationTimeout: 10, completionBlock: {
        (location: TencentLBSLocation?, err: Error?) -> Void in
        if (location == nil) {
            self.failedAction(1505602)
            return
        }
        var altitude: NSNumber = 0.0
        if (self.locationOptions?.altitude != nil && self.locationOptions?.altitude == true) {
            altitude = NSNumber(location!.location.altitude)
        }
        var response = GetLocationSuccess(UTSJSONObject([
            "latitude": NSNumber(location!.location.coordinate.latitude),
            "longitude": NSNumber(location!.location.coordinate.longitude),
            "speed": NSNumber(location!.location.speed),
            "altitude": altitude,
            "accuracy": NSNumber(location!.location.horizontalAccuracy),
            "verticalAccuracy": NSNumber(location!.location.verticalAccuracy),
            "horizontalAccuracy": NSNumber(location!.location.horizontalAccuracy),
            "address": self.getAddress(location)
        ]))
        self.successAction(response)
        })
        if (self.locationOptions?.isHighAccuracy != nil && self.locationOptions?.isHighAccuracy == true) {
            var timeoutMill: Int = self.locationOptions?.highAccuracyExpireTime?.toInt() ?? 3000
            setTimeout({
            () -> Void in
            self.clearWatch()
            if (!self.hasRequestLocationSuccess) {
                self.failedAction(1505600)
            }
            }, timeoutMill)
        }
    }
    private func requestTemporaryFullAccuracyAuthorization() {
        if #available(iOS 14.0, *) {
            self.locationManager.requestTemporaryFullAccuracyAuthorization(withPurposeKey: "PurposeKey", completion: {
            (err: Error?) -> Void in
            if (self.locationManager.accuracyAuthorization == TencentLBSAccuracyAuthorization.reducedAccuracy) {
                self.failedAction(1505800)
            }
            })
        }
    }
    private func failedAction(_ errCode: NSNumber) {
        var err = GetLocationFailImpl(errCode)
        self.locationOptions?.fail?(err)
        self.locationOptions?.complete?(err)
        self.clearWatch()
    }
    private func successAction(_ response: GetLocationSuccess) {
        self.locationOptions?.success?(response)
        self.locationOptions?.complete?(response)
        self.hasRequestLocationSuccess = true
        self.clearWatch()
    }
    private func clearWatch() {
        self.locationManager.stopUpdatingLocation()
    }
    public func tencentLBSDidChangeAuthorization(_ manager: TencentLBSLocationManager) {
        DispatchQueue.main.async(execute: {
        () -> Void in
        if (CLLocationManager.locationServicesEnabled() == false) {
            self.failedAction(1505003)
            return
        }
        })
        var status = self.getAuthorizationStatus()
        if (status == CLAuthorizationStatus.denied || status == CLAuthorizationStatus.restricted) {
            self.failedAction(1505004)
        } else if (status == CLAuthorizationStatus.authorizedAlways || status == CLAuthorizationStatus.authorizedWhenInUse) {
            self.getLocation()
        }
    }
    public func tencentLBSLocationManager(_ manager: TencentLBSLocationManager, didFailWithError error: Error) {
        self.failedAction(1505602)
    }
}
@objc(UTSSDKModulesDCloudUniGetLocationTencentUni1GetLocationOptionsJSONObject)
@objcMembers
public class GetLocationOptionsJSONObject : NSObject {
    public var type: String?
    public var altitude: Bool = false
    public var geocode: Bool = false
    public var highAccuracyExpireTime: NSNumber?
    public var isHighAccuracy: Bool = false
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
public func getLocationByJs(_ options: GetLocationOptionsJSONObject) -> Void {
    return getLocation(GetLocationOptions(UTSJSONObject([
        "type": options.type,
        "altitude": options.altitude,
        "geocode": options.geocode,
        "highAccuracyExpireTime": options.highAccuracyExpireTime,
        "isHighAccuracy": options.isHighAccuracy,
        "success": {
        (result: GetLocationSuccess) -> Void in
        options.success?(result)
        },
        "fail": {
        (result: GetLocationFail) -> Void in
        options.fail?(result)
        },
        "complete": {
        (result: GetLocationComplete) -> Void in
        options.complete?(result)
        }
    ])))
}
@objc(UTSSDKModulesDCloudUniGetLocationTencentUni1IndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniGetLocationTencentUni1IndexSwift : NSObject {
    public static func s_getLocationByJs(_ options: GetLocationOptionsJSONObject) -> Void {
        return getLocationByJs(options)
    }
}
