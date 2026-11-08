import DCloudUTSFoundation
import Foundation
@_implementationOnly import storage
@objc(UTSSDKModulesDCloudUniStorageSetStorageSuccess)
@objcMembers
public class SetStorageSuccess : NSObject, UTSObject {
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {}
}
public typealias SetStorageSuccessCallback = (_ res: SetStorageSuccess) -> Void
public typealias SetStorageFailCallback = (_ res: UniError) -> Void
public typealias SetStorageCompleteCallback = (_ res: Any) -> Void
@objc(UTSSDKModulesDCloudUniStorageSetStorageOptions)
@objcMembers
public class SetStorageOptions : NSObject, UTSObject {
    public var key: String!
    public var data: Any!
    public var success: SetStorageSuccessCallback?
    public var fail: SetStorageFailCallback?
    public var complete: SetStorageCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "key":
                    self.key = try! utsSubscriptCheckValue(newValue)
                case "data":
                    self.data = try! utsSubscriptCheckValue(newValue)
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
        self.key = obj["key"] as! String
        self.data = obj["data"] as! Any
        self.success = obj["success"] as! SetStorageSuccessCallback?
        self.fail = obj["fail"] as! SetStorageFailCallback?
        self.complete = obj["complete"] as! SetStorageCompleteCallback?
    }
}
public typealias SetStorage = (_ options: SetStorageOptions) -> Void
public typealias SetStorageSync = (_ key: String, _ data: Any) -> Void
@objc(UTSSDKModulesDCloudUniStorageGetStorageSuccess)
@objcMembers
public class GetStorageSuccess : NSObject, UTSObject {
    public var data: Any?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "data":
                    self.data = try! utsSubscriptCheckValueIfPresent(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.data = obj["data"] as! Any?
    }
}
public typealias GetStorageSuccessCallback = (_ res: GetStorageSuccess) -> Void
public typealias GetStorageFailCallback = (_ res: UniError) -> Void
public typealias GetStorageCompleteCallback = (_ res: Any) -> Void
@objc(UTSSDKModulesDCloudUniStorageGetStorageOptions)
@objcMembers
public class GetStorageOptions : NSObject, UTSObject {
    public var key: String!
    public var success: GetStorageSuccessCallback?
    public var fail: GetStorageFailCallback?
    public var complete: GetStorageCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "key":
                    self.key = try! utsSubscriptCheckValue(newValue)
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
        self.key = obj["key"] as! String
        self.success = obj["success"] as! GetStorageSuccessCallback?
        self.fail = obj["fail"] as! GetStorageFailCallback?
        self.complete = obj["complete"] as! GetStorageCompleteCallback?
    }
}
public typealias GetStorage = (_ options: GetStorageOptions) -> Void
public typealias GetStorageSync = (_ key: String) -> Any?
@objc(UTSSDKModulesDCloudUniStorageGetStorageInfoSuccess)
@objcMembers
public class GetStorageInfoSuccess : NSObject, UTSObject {
    public var keys: Array<String>!
    public var currentSize: NSNumber!
    public var limitSize: NSNumber!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "keys":
                    self.keys = try! utsSubscriptCheckValue(newValue)
                case "currentSize":
                    self.currentSize = try! utsSubscriptCheckValue(newValue)
                case "limitSize":
                    self.limitSize = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.keys = obj["keys"] as! Array<String>
        self.currentSize = obj["currentSize"] as! NSNumber
        self.limitSize = obj["limitSize"] as! NSNumber
    }
}
public typealias GetStorageInfoSuccessCallback = (_ res: GetStorageInfoSuccess) -> Void
public typealias GetStorageInfoFailCallback = (_ res: UniError) -> Void
public typealias GetStorageInfoCompleteCallback = (_ res: Any) -> Void
@objc(UTSSDKModulesDCloudUniStorageGetStorageInfoOptions)
@objcMembers
public class GetStorageInfoOptions : NSObject, UTSObject {
    public var success: GetStorageInfoSuccessCallback?
    public var fail: GetStorageInfoFailCallback?
    public var complete: GetStorageInfoCompleteCallback?
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
        self.success = obj["success"] as! GetStorageInfoSuccessCallback?
        self.fail = obj["fail"] as! GetStorageInfoFailCallback?
        self.complete = obj["complete"] as! GetStorageInfoCompleteCallback?
    }
}
public typealias GetStorageInfo = (_ options: GetStorageInfoOptions) -> Void
public typealias GetStorageInfoSync = () -> GetStorageInfoSuccess
@objc(UTSSDKModulesDCloudUniStorageRemoveStorageSuccess)
@objcMembers
public class RemoveStorageSuccess : NSObject, UTSObject {
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {}
}
public typealias RemoveStorageSuccessCallback = (_ res: RemoveStorageSuccess) -> Void
public typealias RemoveStorageFailCallback = (_ res: UniError) -> Void
public typealias RemoveStorageCompleteCallback = (_ res: Any) -> Void
@objc(UTSSDKModulesDCloudUniStorageRemoveStorageOptions)
@objcMembers
public class RemoveStorageOptions : NSObject, UTSObject {
    public var key: String!
    public var success: RemoveStorageSuccessCallback?
    public var fail: RemoveStorageFailCallback?
    public var complete: RemoveStorageCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "key":
                    self.key = try! utsSubscriptCheckValue(newValue)
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
        self.key = obj["key"] as! String
        self.success = obj["success"] as! RemoveStorageSuccessCallback?
        self.fail = obj["fail"] as! RemoveStorageFailCallback?
        self.complete = obj["complete"] as! RemoveStorageCompleteCallback?
    }
}
public typealias RemoveStorage = (_ options: RemoveStorageOptions) -> Void
public typealias RemoveStorageSync = (_ key: String) -> Void
@objc(UTSSDKModulesDCloudUniStorageClearStorageSuccess)
@objcMembers
public class ClearStorageSuccess : NSObject, UTSObject {
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {}
}
public typealias ClearStorageSuccessCallback = (_ res: ClearStorageSuccess) -> Void
public typealias ClearStorageFailCallback = (_ res: UniError) -> Void
public typealias ClearStorageCompleteCallback = (_ res: Any) -> Void
@objc(UTSSDKModulesDCloudUniStorageClearStorageOptions)
@objcMembers
public class ClearStorageOptions : NSObject, UTSObject {
    public var success: ClearStorageSuccessCallback?
    public var fail: ClearStorageFailCallback?
    public var complete: ClearStorageCompleteCallback?
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
        self.success = obj["success"] as! ClearStorageSuccessCallback?
        self.fail = obj["fail"] as! ClearStorageFailCallback?
        self.complete = obj["complete"] as! ClearStorageCompleteCallback?
    }
}
public typealias ClearStorage = (_ option: ClearStorageOptions?) -> Void
public typealias ClearStorageSync = () -> Void
public var STORAGE_DATA_TYPE = "__TYPE"
public func filterNativeType(_ src: String) -> String {
    if (src == "Double" || src == "Float" || src == "Long" || src == "Int" || src == "Short" || src == "Byte" || src == "UByte" || src == "UShort" || src == "UInt" || src == "ULong") {
        return "number"
    }
    return src
}
public func parseValue(_ value: Any) -> Any? {
    var types = [
        "object",
        "string",
        "number",
        "boolean",
        "undefined"
    ]
    var object = UTSiOS.typeof(value) == "string" ? JSON.parse(value as! String) : value
    if (object == nil) {
        return nil
    } else {
        var type = UTSiOS.typeof(object)
        if (types.indexOf(type) >= 0) {
            if (UTSiOS.instanceof(object, UTSJSONObject.self) || UTSiOS.instanceof(object, Map<String, Any>.self)) {
                var map = (UTSiOS.instanceof(object, UTSJSONObject.self)) ? (object as! UTSJSONObject).toMap() : (object as! Map<String, Any>)
                if (map.size == 2 && map.has("data") && map.has("type")) {
                    var dataType: String = ""
                    if (map.get("type") == nil) {
                        dataType = ""
                    } else {
                        dataType = map.get("type") as! String
                    }
                    if (filterNativeType(UTSiOS.typeof(map.get("data"))) == dataType && dataType != "string") {
                        return map.get("data")
                    } else if (UTSiOS.typeof(map.get("data")) == dataType && dataType == "string") {
                        var regex = UTSRegExp("^\\d{4}-\\d{2}-\\d{2}T\\d{2}\\:\\d{2}\\:\\d{2}\\.\\d{3}Z$", "")
                        if (type == "object" && regex.test(map.get("data") as! String)) {
                            var dateStr = map.get("data") as! String
                            return Date.init(dateStr)
                        }
                        return map.get("data")
                    }
                } else if (map.size >= 1) {
                    return ""
                }
            }
        }
        return nil
    }
}
public func praseGetStorage(_ type: String, _ value: String) -> Any? {
    var data: Any? = value
    if (type != "string" || (type == "string" && value == "{\"type\":\"undefined\"}")) {
        var object = JSON.parse(value)
        if (object == nil) {
            return data
        }
        var result = parseValue(object)
        if (result != nil) {
            data = result
        } else if (type != nil && type != "") {
            data = object
            if (UTSiOS.typeof(object) == "string") {
                object = JSON.parse(object as! String)
                var objectType = UTSiOS.typeof(object)
                if (objectType == "number" && type == "date") {
                    var dateNum = object as! NSNumber
                    data = Date.init(dateNum)
                } else if (objectType == ([
                    "null",
                    "array"
                ].indexOf(type) < 0 ? type : "object")) {
                    data = object
                }
            }
        }
    }
    return data
}
public func uni_setStorageSync(_ key: String, _ data: Any, _ saveItemHandler: @escaping (_ key: String, _ data: String) -> Void, _ removeItemHandler: @escaping (_ key: String) -> Void) {
    var type = filterNativeType(UTSiOS.typeof(data))
    var value: String? = nil
    value = (type == "string") ? (data as! String) : JSON.stringify(UTSJSONObject([
        "type": type,
        "data": data
    ]))
    if (type == "string" && parseValue(data) != nil) {
        saveItemHandler(key + STORAGE_DATA_TYPE, type)
    } else {
        removeItemHandler(key + STORAGE_DATA_TYPE)
    }
    if (value == nil) {
        value = ""
    }
    saveItemHandler(key, value!)
}
public func uni_setStorageAsync(_ options: SetStorageOptions, _ saveItemAsyncHandler: @escaping (_ key: String, _ data: String) -> Void, _ removeItemAsyncHandler: @escaping (_ key: String) -> Void) {
    var type = filterNativeType(UTSiOS.typeof(options.data))
    var value: String? = nil
    value = (type == "string") ? (options.data as! String) : JSON.stringify(UTSJSONObject([
        "type": type,
        "data": options.data
    ]))
    if (value == nil) {
        var fail = UniError("uni-storage", -1, "data can not be stringify")
        options.fail?(fail)
        options.complete?(fail)
    } else {
        if (type == "string" && parseValue(options.data) != nil) {
            saveItemAsyncHandler(options.key + STORAGE_DATA_TYPE, type)
        } else {
            removeItemAsyncHandler(options.key + STORAGE_DATA_TYPE)
        }
        if (value == nil) {
            value = ""
        }
        saveItemAsyncHandler(options.key, value!)
        var success = SetStorageSuccess(UTSJSONObject([:]))
        options.success?(success)
        options.complete?(success)
    }
}
public func uni_getStorageSync(_ key: String, _ getItemHandler: @escaping ((_ key: String) -> String?)) -> Any? {
    var value = getItemHandler(key)
    var typeOrigin = getItemHandler(key + STORAGE_DATA_TYPE)
    if (typeOrigin == nil) {
        typeOrigin = ""
    }
    var type = typeOrigin!.toLowerCase()
    if (UTSiOS.typeof(value) != "string") {
        return ""
    }
    if (value == nil) {
        value = ""
    }
    return praseGetStorage(type, value!)
}
public func uni_getStorageAsync(_ options: GetStorageOptions, _ getItemAsyncHandler: @escaping ((_ key: String) -> String?), _ includesKey: @escaping (_ key: String) -> Bool) {
    var ret = includesKey(options.key)
    if (!ret) {
        var fail = UniError("uni-storage", -2, "getStorage:fail data not found")
        options.fail?(fail)
        options.complete?(fail)
        return
    }
    var value = getItemAsyncHandler(options.key)
    if (value == nil) {
        value = ""
    }
    var typeOrigin = getItemAsyncHandler(options.key + STORAGE_DATA_TYPE)
    if (typeOrigin == nil) {
        typeOrigin = ""
    }
    var type = typeOrigin!.toLowerCase()
    if (UTSiOS.typeof(value) != "string") {
        var success = GetStorageSuccess(UTSJSONObject([
            "data": ""
        ]))
        options.success?(success)
        options.complete?(success)
    } else {
        var data = praseGetStorage(type, value!)
        var success = GetStorageSuccess(UTSJSONObject([
            "data": data
        ]))
        options.success?(success)
        options.complete?(success)
    }
}
@objc(UTSSDKModulesDCloudUniStorageStorageTool)
@objcMembers
public class StorageTool : NSObject {
    internal static var storage: Storage?
    private static func migrateStorage(_ storage: Storage) {
        var dataPath = UTSiOS.getDataPath()
        var oldPath = URL(fileURLWithPath: dataPath).appendingPathComponent(dc_storage_old_path_component).absoluteString
        var content: Any? = nil
        if (FileManager.default.fileExists(atPath: oldPath)) {
            var data = FileManager.default.contents(atPath: oldPath)
            if (data != nil) {
                content = PropertyListSerialization.propertyListFromData(data!, mutabilityOption: [
                    PropertyListSerialization.MutabilityOptions.mutableContainersAndLeaves
                ], format: nil, errorDescription: nil)
            }
            do {
                try FileManager.default.removeItem(atPath: oldPath)
            } catch let e {}
        } else {
            var path = URL(fileURLWithPath: dataPath).appendingPathComponent(dc_storage_path_component).absoluteString
            var inputData = NSData.init(contentsOfFile: path)
            if (inputData != nil) {
                var input = inputData! as! Data
                var data = UTSiOS.dc_AESDecrypt(data: input, key: dc_storage_aes_key)
                if (data != nil) {
                    content = NSKeyedUnarchiver.unarchiveObject(with: data!)
                }
            }
            do {
                try FileManager.default.removeItem(atPath: path)
            }
             catch let e {}
        }
        if (content != nil) {
            var contentDic = UTSiOS.convertDictionary(content!)
            if (contentDic.isEmpty == false) {
                var dic = NSDictionary(dictionary: contentDic)
                var i: NSNumber = 0
                while(i < dic.allKeys.length){
                    var key = dic.allKeys[i]
                    if (key != nil && UTSiOS.typeof(key) == "string") {
                        var value = dic.value(forKey: key as! String)
                        if (value != nil && UTSiOS.typeof(value) == "string") {
                            storage.setItem(key as! String, value: value as! String, callback: nil)
                        }
                    }
                    i++
                }
            }
        }
    }
    fileprivate static func getStorage() -> Storage {
        if (self.storage != nil) {
            return self.storage!
        }
        var domain: String = UTSiOS.getAppId()
        var storage: Storage? = nil
        storage = StorageManager.storage(withDomain: domain)
        if (self.storage == nil) {
            storage = StorageManager.activeStorage(withDomain: domain)
            var path = UTSiOS.getDataPath()
            storage!.rootPath = path
            self.migrateStorage(storage!)
        }
        self.storage = storage
        return storage!
    }
}
public var setStorage: SetStorage = {
(_ options: SetStorageOptions) -> Void in
setTimeout({
() -> Void in
uni_setStorageAsync(options, {
(_ itemKey: String, _ itemData: String) -> Void in
StorageTool.getStorage().setItemPersistent(itemKey, value: itemData, callback: nil)
}, {
(_ itemKey: String) -> Void in
StorageTool.getStorage().removeItem(itemKey, callback: nil)
})
}, 0)
}
public var setStorageSync: SetStorageSync = {
(_ key: String, _ data: Any) -> Void in
uni_setStorageSync(key, data, {
(_ itemKey: String, _ itemValue: String) -> Void in
StorageTool.getStorage().setItemPersistent(itemKey, value: itemValue, callback: nil)
}, {
(_ itemKey: String) -> Void in
StorageTool.getStorage().removeItem(itemKey, callback: nil)
})
}
public func getItemAsync(_ itemKey: String) -> String? {
    return StorageTool.getStorage().getItem(itemKey, callback: nil)
}
public func includeKey(_ key: String) -> Bool {
    var storage = StorageTool.getStorage()
    var list = storage.getAllKeys()
    if (list != nil) {
        var item = list!.find({
        (_ value) -> Bool in
        if (UTSiOS.typeof(value) == "string") {
            return (value as! String) == key
        }
        return false
        })
        return (item != nil)
    }
    return false
}
public var getStorage: GetStorage = {
(_ options: GetStorageOptions) -> Void in
setTimeout({
() -> Void in
uni_getStorageAsync(options, getItemAsync, includeKey)
}, 0)
}
public var getStorageSync: GetStorageSync = {
(_ key: String) -> Any in
return uni_getStorageSync(key, getItemAsync)
}
public var getStorageInfo: GetStorageInfo = {
(_ options: GetStorageInfoOptions) -> Void in
setTimeout({
() -> Void in
var storage = StorageTool.getStorage()
var allKeys = storage.getAllKeys()
var length = storage.length()
var limitSize: NSNumber = 1.7976931348623157e+308
var success = GetStorageInfoSuccess(UTSJSONObject([
    "keys": allKeys,
    "currentSize": length,
    "limitSize": limitSize
]))
options.success?(success)
options.complete?(success)
}, 0)
}
public var getStorageInfoSync: GetStorageInfoSync = {
() -> GetStorageInfoSuccess in
var storage = StorageTool.getStorage()
var allKeys = storage.getAllKeys()
var length = storage.length()
var limitSize: NSNumber = 1.7976931348623157e+308
var success = GetStorageInfoSuccess(UTSJSONObject([
    "keys": allKeys,
    "currentSize": length,
    "limitSize": limitSize
]))
return success
}
public var removeStorage: RemoveStorage = {
(_ options: RemoveStorageOptions) -> Void in
setTimeout({
() -> Void in
StorageTool.getStorage().removeItem(options.key, callback: nil)
var success = RemoveStorageSuccess(UTSJSONObject([:]))
options.success?(success)
options.complete?(success)
}, 0)
}
public var removeStorageSync: RemoveStorageSync = {
(_ key: String) -> Void in
StorageTool.getStorage().removeItem(key, callback: nil)
}
public var clearStorage: ClearStorage = {
(_ option: ClearStorageOptions?) -> Void in
setTimeout({
() -> Void in
StorageTool.getStorage().clear()
var success = ClearStorageSuccess(UTSJSONObject([:]))
if (option != nil) {
    option!.success?(success)
    option!.complete?(success)
}
}, 0)
}
public var clearStorageSync: ClearStorageSync = {
() -> Void in
StorageTool.getStorage().clear()
}
@objc(UTSSDKModulesDCloudUniStorageSetStorageOptionsJSONObject)
@objcMembers
public class SetStorageOptionsJSONObject : NSObject {
    public var key: String!
    public var data: Any!
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniStorageGetStorageOptionsJSONObject)
@objcMembers
public class GetStorageOptionsJSONObject : NSObject {
    public var key: String!
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniStorageGetStorageInfoOptionsJSONObject)
@objcMembers
public class GetStorageInfoOptionsJSONObject : NSObject {
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniStorageRemoveStorageOptionsJSONObject)
@objcMembers
public class RemoveStorageOptionsJSONObject : NSObject {
    public var key: String!
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniStorageClearStorageOptionsJSONObject)
@objcMembers
public class ClearStorageOptionsJSONObject : NSObject {
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
public func setStorageByJs(_ options: SetStorageOptionsJSONObject) -> Void {
    return setStorage(SetStorageOptions(UTSJSONObject([
        "key": options.key,
        "data": options.data,
        "success": {
        (res: SetStorageSuccess) -> Void in
        options.success?(res)
        },
        "fail": {
        (res: UniError) -> Void in
        options.fail?(res)
        },
        "complete": {
        (res: Any) -> Void in
        options.complete?(res)
        }
    ])))
}
public func setStorageSyncByJs(_ key: String, _ data: Any) -> Void {
    return setStorageSync(key, data)
}
public func getStorageByJs(_ options: GetStorageOptionsJSONObject) -> Void {
    return getStorage(GetStorageOptions(UTSJSONObject([
        "key": options.key,
        "success": {
        (res: GetStorageSuccess) -> Void in
        options.success?(res)
        },
        "fail": {
        (res: UniError) -> Void in
        options.fail?(res)
        },
        "complete": {
        (res: Any) -> Void in
        options.complete?(res)
        }
    ])))
}
public func getStorageSyncByJs(_ key: String) -> Any? {
    return getStorageSync(key)
}
public func getStorageInfoByJs(_ options: GetStorageInfoOptionsJSONObject) -> Void {
    return getStorageInfo(GetStorageInfoOptions(UTSJSONObject([
        "success": {
        (res: GetStorageInfoSuccess) -> Void in
        options.success?(res)
        },
        "fail": {
        (res: UniError) -> Void in
        options.fail?(res)
        },
        "complete": {
        (res: Any) -> Void in
        options.complete?(res)
        }
    ])))
}
public func getStorageInfoSyncByJs() -> GetStorageInfoSuccess {
    return getStorageInfoSync()
}
public func removeStorageByJs(_ options: RemoveStorageOptionsJSONObject) -> Void {
    return removeStorage(RemoveStorageOptions(UTSJSONObject([
        "key": options.key,
        "success": {
        (res: RemoveStorageSuccess) -> Void in
        options.success?(res)
        },
        "fail": {
        (res: UniError) -> Void in
        options.fail?(res)
        },
        "complete": {
        (res: Any) -> Void in
        options.complete?(res)
        }
    ])))
}
public func removeStorageSyncByJs(_ key: String) -> Void {
    return removeStorageSync(key)
}
public func clearStorageByJs(_ option: ClearStorageOptionsJSONObject?) -> Void {
    return clearStorage(option != nil ? ClearStorageOptions(UTSJSONObject([
        "success": {
        (res: ClearStorageSuccess) -> Void in
        option!.success?(res)
        },
        "fail": {
        (res: UniError) -> Void in
        option!.fail?(res)
        },
        "complete": {
        (res: Any) -> Void in
        option!.complete?(res)
        }
    ])) : nil)
}
public func clearStorageSyncByJs() -> Void {
    return clearStorageSync()
}
@objc(UTSSDKModulesDCloudUniStorageIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniStorageIndexSwift : NSObject {
    public static func s_setStorageByJs(_ options: SetStorageOptionsJSONObject) -> Void {
        return setStorageByJs(options)
    }
    public static func s_setStorageSyncByJs(_ key: String, _ data: Any) -> Void {
        return setStorageSyncByJs(key, data)
    }
    public static func s_getStorageByJs(_ options: GetStorageOptionsJSONObject) -> Void {
        return getStorageByJs(options)
    }
    public static func s_getStorageSyncByJs(_ key: String) -> Any? {
        return getStorageSyncByJs(key)
    }
    public static func s_getStorageInfoByJs(_ options: GetStorageInfoOptionsJSONObject) -> Void {
        return getStorageInfoByJs(options)
    }
    public static func s_getStorageInfoSyncByJs() -> GetStorageInfoSuccess {
        return getStorageInfoSyncByJs()
    }
    public static func s_removeStorageByJs(_ options: RemoveStorageOptionsJSONObject) -> Void {
        return removeStorageByJs(options)
    }
    public static func s_removeStorageSyncByJs(_ key: String) -> Void {
        return removeStorageSyncByJs(key)
    }
    public static func s_clearStorageByJs(_ option: ClearStorageOptionsJSONObject?) -> Void {
        return clearStorageByJs(option)
    }
    public static func s_clearStorageSyncByJs() -> Void {
        return clearStorageSyncByJs()
    }
}
