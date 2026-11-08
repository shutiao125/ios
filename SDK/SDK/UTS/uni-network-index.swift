import CommonCrypto
import CoreFoundation
import DCloudUTSFoundation
import Foundation
import MobileCoreServices
import ObjectiveC
import Swift
public class RequestOptions<T> : UTSObject {
    public var url: String!
    public var data: Any?
    public var header: UTSJSONObject?
    public var method: RequestMethod?
    public var timeout: NSNumber?
    public var enableQuic: Bool = false
    public var dataType: String?
    public var responseType: String?
    public var sslVerify: Bool = false
    public var withCredentials: Bool = false
    public var firstIpv4: Bool = false
    public var enableChunked: Bool = false
    public var success: RequestSuccessCallback<T>?
    public var fail: RequestFailCallback?
    public var complete: RequestCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "url":
                    self.url = try! utsSubscriptCheckValue(newValue)
                case "data":
                    self.data = try! utsSubscriptCheckValueIfPresent(newValue)
                case "header":
                    self.header = try! utsSubscriptCheckValueIfPresent(newValue)
                case "method":
                    self.method = try! utsSubscriptCheckValueIfPresent(newValue)
                case "timeout":
                    self.timeout = try! utsSubscriptCheckValueIfPresent(newValue)
                case "enableQuic":
                    self.enableQuic = try! utsSubscriptCheckValue(newValue)
                case "dataType":
                    self.dataType = try! utsSubscriptCheckValueIfPresent(newValue)
                case "responseType":
                    self.responseType = try! utsSubscriptCheckValueIfPresent(newValue)
                case "sslVerify":
                    self.sslVerify = try! utsSubscriptCheckValue(newValue)
                case "withCredentials":
                    self.withCredentials = try! utsSubscriptCheckValue(newValue)
                case "firstIpv4":
                    self.firstIpv4 = try! utsSubscriptCheckValue(newValue)
                case "enableChunked":
                    self.enableChunked = try! utsSubscriptCheckValue(newValue)
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
    @objc
    public func dcUTS_modelToJSONObject() -> Map<String, Any> {
        return UTSObjectTransformer.transformObj2Map(self)
    }
    public init(_ obj: UTSJSONObject) {
        self.url = obj["url"] as! String
        self.data = obj["data"] as! Any?
        self.header = obj["header"] as! UTSJSONObject?
        self.method = obj["method"] as! RequestMethod?
        self.timeout = obj["timeout"] as! NSNumber?
        self.enableQuic = (obj["enableQuic"] as? Bool) ?? false
        self.dataType = obj["dataType"] as! String?
        self.responseType = obj["responseType"] as! String?
        self.sslVerify = (obj["sslVerify"] as? Bool) ?? false
        self.withCredentials = (obj["withCredentials"] as? Bool) ?? false
        self.firstIpv4 = (obj["firstIpv4"] as? Bool) ?? false
        self.enableChunked = (obj["enableChunked"] as? Bool) ?? false
        self.success = obj["success"] as! RequestSuccessCallback<T>?
        self.fail = obj["fail"] as! RequestFailCallback?
        self.complete = obj["complete"] as! RequestCompleteCallback?
    }
}
public class RequestSuccess<T> : UTSObject {
    public var data: T?
    public var statusCode: NSNumber!
    public var header: Any!
    public var cookies: Array<String>!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "data":
                    self.data = try! utsSubscriptCheckValueIfPresent(newValue)
                case "statusCode":
                    self.statusCode = try! utsSubscriptCheckValue(newValue)
                case "header":
                    self.header = try! utsSubscriptCheckValue(newValue)
                case "cookies":
                    self.cookies = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    @objc
    public func dcUTS_modelToJSONObject() -> Map<String, Any> {
        return UTSObjectTransformer.transformObj2Map(self)
    }
    public init(_ obj: UTSJSONObject) {
        self.data = obj["data"] as! T?
        self.statusCode = obj["statusCode"] as! NSNumber
        self.header = obj["header"] as! Any
        self.cookies = obj["cookies"] as! Array<String>
    }
}
public typealias RequestMethod = String
public typealias RequestErrorCode = NSNumber
public protocol RequestFail : IUniError {
    var errCode: RequestErrorCode { get set }
}
public typealias RequestSuccessCallback<T> = (_ option: RequestSuccess<T>) -> Void
public typealias RequestFailCallback = (_ option: RequestFail) -> Void
public typealias RequestCompleteCallback = (_ option: Any) -> Void
@objc(UTSSDKModulesDCloudUniNetworkRequestTaskOnChunkReceivedListenerResult)
@objcMembers
public class RequestTaskOnChunkReceivedListenerResult : NSObject, UTSObject {
    public var data: ArrayBuffer!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "data":
                    self.data = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.data = obj["data"] as! ArrayBuffer
    }
}
public typealias RequestTaskOnChunkReceivedCallback = (_ result: RequestTaskOnChunkReceivedListenerResult) -> Void
@objc(UTSSDKModulesDCloudUniNetworkRequestTaskOnHeadersReceivedListenerResult)
@objcMembers
public class RequestTaskOnHeadersReceivedListenerResult : NSObject, UTSObject {
    public var cookies: [String]!
    public var header: UTSJSONObject!
    public var statusCode: NSNumber!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "cookies":
                    self.cookies = try! utsSubscriptCheckValue(newValue)
                case "header":
                    self.header = try! utsSubscriptCheckValue(newValue)
                case "statusCode":
                    self.statusCode = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.cookies = obj["cookies"] as! [String]
        self.header = obj["header"] as! UTSJSONObject
        self.statusCode = obj["statusCode"] as! NSNumber
    }
}
public typealias RequestTaskOnHeadersReceivedCallback = (_ result: RequestTaskOnHeadersReceivedListenerResult) -> Void
public protocol RequestTask {
    func abort()
    func onChunkReceived(_ listener: @escaping RequestTaskOnChunkReceivedCallback) -> NSNumber
    func offChunkReceived(_ listener: Any?)
    func onHeadersReceived(_ listener: @escaping RequestTaskOnHeadersReceivedCallback) -> NSNumber
    func offHeadersReceived(_ listener: Any?)
}
public typealias UploadFile = (_ options: UploadFileOptions) -> UploadTask
@objc(UTSSDKModulesDCloudUniNetworkUploadFileOptionFiles)
@objcMembers
public class UploadFileOptionFiles : NSObject, UTSObject {
    public var name: String?
    public var uri: String!
    public var file: Any?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "name":
                    self.name = try! utsSubscriptCheckValueIfPresent(newValue)
                case "uri":
                    self.uri = try! utsSubscriptCheckValue(newValue)
                case "file":
                    self.file = try! utsSubscriptCheckValueIfPresent(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.name = obj["name"] as! String?
        self.uri = obj["uri"] as! String
        self.file = obj["file"] as! Any?
    }
}
@objc(UTSSDKModulesDCloudUniNetworkUploadFileSuccess)
@objcMembers
public class UploadFileSuccess : NSObject, UTSObject {
    public var data: String!
    public var statusCode: NSNumber!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "data":
                    self.data = try! utsSubscriptCheckValue(newValue)
                case "statusCode":
                    self.statusCode = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.data = obj["data"] as! String
        self.statusCode = obj["statusCode"] as! NSNumber
    }
}
public typealias UploadFileSuccessCallback = (_ result: UploadFileSuccess) -> Void
public protocol UploadFileFail : IUniError {
    var errCode: RequestErrorCode { get set }
}
public typealias UploadFileFailCallback = (_ result: UploadFileFail) -> Void
public typealias UploadFileCompleteCallback = (_ result: Any) -> Void
@objc(UTSSDKModulesDCloudUniNetworkUploadFileOptions)
@objcMembers
public class UploadFileOptions : NSObject, UTSObject {
    public var url: String!
    public var filePath: String?
    public var name: String?
    public var files: [UploadFileOptionFiles]?
    public var header: UTSJSONObject?
    public var formData: UTSJSONObject?
    public var timeout: NSNumber?
    public var success: UploadFileSuccessCallback?
    public var fail: UploadFileFailCallback?
    public var complete: UploadFileCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "url":
                    self.url = try! utsSubscriptCheckValue(newValue)
                case "filePath":
                    self.filePath = try! utsSubscriptCheckValueIfPresent(newValue)
                case "name":
                    self.name = try! utsSubscriptCheckValueIfPresent(newValue)
                case "files":
                    self.files = try! utsSubscriptCheckValueIfPresent(newValue)
                case "header":
                    self.header = try! utsSubscriptCheckValueIfPresent(newValue)
                case "formData":
                    self.formData = try! utsSubscriptCheckValueIfPresent(newValue)
                case "timeout":
                    self.timeout = try! utsSubscriptCheckValueIfPresent(newValue)
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
        self.url = obj["url"] as! String
        self.filePath = obj["filePath"] as! String?
        self.name = obj["name"] as! String?
        self.files = obj["files"] as! [UploadFileOptionFiles]?
        self.header = obj["header"] as! UTSJSONObject?
        self.formData = obj["formData"] as! UTSJSONObject?
        self.timeout = obj["timeout"] as! NSNumber?
        self.success = obj["success"] as! UploadFileSuccessCallback?
        self.fail = obj["fail"] as! UploadFileFailCallback?
        self.complete = obj["complete"] as! UploadFileCompleteCallback?
    }
}
@objc(UTSSDKModulesDCloudUniNetworkOnProgressUpdateResult)
@objcMembers
public class OnProgressUpdateResult : NSObject, UTSObject {
    public var progress: NSNumber!
    public var totalBytesSent: NSNumber!
    public var totalBytesExpectedToSend: NSNumber!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "progress":
                    self.progress = try! utsSubscriptCheckValue(newValue)
                case "totalBytesSent":
                    self.totalBytesSent = try! utsSubscriptCheckValue(newValue)
                case "totalBytesExpectedToSend":
                    self.totalBytesExpectedToSend = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.progress = obj["progress"] as! NSNumber
        self.totalBytesSent = obj["totalBytesSent"] as! NSNumber
        self.totalBytesExpectedToSend = obj["totalBytesExpectedToSend"] as! NSNumber
    }
}
public typealias UploadFileProgressUpdateCallback = (_ result: OnProgressUpdateResult) -> Void
public protocol UploadTask {
    func abort()
    func onProgressUpdate(_ callback: @escaping UploadFileProgressUpdateCallback)
}
public typealias DownloadFile = (_ options: DownloadFileOptions) -> DownloadTask
@objc(UTSSDKModulesDCloudUniNetworkDownloadFileSuccess)
@objcMembers
public class DownloadFileSuccess : NSObject, UTSObject {
    public var tempFilePath: String!
    public var statusCode: NSNumber!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "tempFilePath":
                    self.tempFilePath = try! utsSubscriptCheckValue(newValue)
                case "statusCode":
                    self.statusCode = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.tempFilePath = obj["tempFilePath"] as! String
        self.statusCode = obj["statusCode"] as! NSNumber
    }
}
public typealias DownloadFileSuccessCallback = (_ result: DownloadFileSuccess) -> Void
public protocol DownloadFileFail : IUniError {
    var errCode: RequestErrorCode { get set }
}
public typealias DownloadFileFailCallback = (_ result: DownloadFileFail) -> Void
public typealias DownloadFileComplete = Any
public typealias DownloadFileCompleteCallback = (_ result: DownloadFileComplete) -> Void
@objc(UTSSDKModulesDCloudUniNetworkDownloadFileOptions)
@objcMembers
public class DownloadFileOptions : NSObject, UTSObject {
    public var url: String!
    public var header: UTSJSONObject?
    public var filePath: String?
    public var timeout: NSNumber?
    public var success: DownloadFileSuccessCallback?
    public var fail: DownloadFileFailCallback?
    public var complete: DownloadFileCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "url":
                    self.url = try! utsSubscriptCheckValue(newValue)
                case "header":
                    self.header = try! utsSubscriptCheckValueIfPresent(newValue)
                case "filePath":
                    self.filePath = try! utsSubscriptCheckValueIfPresent(newValue)
                case "timeout":
                    self.timeout = try! utsSubscriptCheckValueIfPresent(newValue)
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
        self.url = obj["url"] as! String
        self.header = obj["header"] as! UTSJSONObject?
        self.filePath = obj["filePath"] as! String?
        self.timeout = obj["timeout"] as! NSNumber?
        self.success = obj["success"] as! DownloadFileSuccessCallback?
        self.fail = obj["fail"] as! DownloadFileFailCallback?
        self.complete = obj["complete"] as! DownloadFileCompleteCallback?
    }
}
@objc(UTSSDKModulesDCloudUniNetworkOnProgressDownloadResult)
@objcMembers
public class OnProgressDownloadResult : NSObject, UTSObject {
    public var progress: NSNumber!
    public var totalBytesWritten: NSNumber!
    public var totalBytesExpectedToWrite: NSNumber!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "progress":
                    self.progress = try! utsSubscriptCheckValue(newValue)
                case "totalBytesWritten":
                    self.totalBytesWritten = try! utsSubscriptCheckValue(newValue)
                case "totalBytesExpectedToWrite":
                    self.totalBytesExpectedToWrite = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.progress = obj["progress"] as! NSNumber
        self.totalBytesWritten = obj["totalBytesWritten"] as! NSNumber
        self.totalBytesExpectedToWrite = obj["totalBytesExpectedToWrite"] as! NSNumber
    }
}
public typealias DownloadFileProgressUpdateCallback = (_ result: OnProgressDownloadResult) -> Void
public protocol DownloadTask {
    func abort()
    func onProgressUpdate(_ callback: @escaping DownloadFileProgressUpdateCallback)
}
@objc(UTSSDKModulesDCloudUniNetworkNetworkUtil)
@objcMembers
public class NetworkUtil : NSObject {
    public static func convertHeaders(_ headers: Map<String, Any>?) -> UTSJSONObject {
        var simpleHeaders = UTSJSONObject()
        if (headers != nil) {
            headers!.forEach({
            (value: Any?, key: String) -> Void in
            if (value == nil) {
                simpleHeaders.set(key, "")
            } else {
                simpleHeaders.set(key, value)
            }
            })
        }
        return simpleHeaders
    }
    public static func parseCookie(_ header: UTSJSONObject?) -> [String] {
        if (header == nil) {
            return []
        }
        var cookiesStr = header!.getString("Set-Cookie") as! String?
        if (cookiesStr == nil) {
            cookiesStr = header!.getString("set-cookie") as! String?
        }
        if (cookiesStr == nil) {
            return []
        }
        var cookiesArr = Array<String>()
        if (cookiesStr!.charAt(0) == "[" && cookiesStr!.charAt(cookiesStr!.length - 1) == "]") {
            cookiesStr = cookiesStr!.slice(1, -1)
        }
        var handleCookiesArr = cookiesStr!.split(";")
        do {
            var i: NSNumber = 0
            while(i < handleCookiesArr.length){
                if (handleCookiesArr[i].indexOf("Expires=") != -1 || handleCookiesArr[i].indexOf("expires=") != -1) {
                    cookiesArr.push(handleCookiesArr[i].replace(",", ""))
                } else {
                    cookiesArr.push(handleCookiesArr[i])
                }
                i++
            }
        }
        cookiesArr = cookiesArr.join(";").split(",")
        return cookiesArr
    }
    public static func percentEscapedString(_ urlString: String) -> String {
        var queryStart = urlString.indexOf("?")
        var pathPart = urlString
        var queryPart = ""
        if (queryStart >= 0) {
            pathPart = urlString.substring(0, queryStart as! Int)
            queryPart = urlString.substring(queryStart as! Int)
        }
        var encodedPath = self.encodeURLPath(pathPart)
        var encodedQuery = ""
        if (queryPart.length > 0) {
            encodedQuery = self.encodeURLQuery(queryPart)
        }
        return encodedPath + encodedQuery
    }
    private static func encodeURLPath(_ pathString: String) -> String {
        var schemeEnd = pathString.indexOf("://")
        if (schemeEnd < 0) {
            return self.safePercentEncode(pathString, CharacterSet.urlPathAllowed)
        }
        var pathStart = pathString.indexOf("/", schemeEnd + 3)
        if (pathStart < 0) {
            return pathString
        }
        var schemeAndHost = pathString.substring(0, pathStart as! Int)
        var pathOnly = pathString.substring(pathStart as! Int)
        var encodedPathOnly = self.safePercentEncode(pathOnly, CharacterSet.urlPathAllowed)
        return schemeAndHost + encodedPathOnly
    }
    private static func encodeURLQuery(_ queryString: String) -> String {
        if (!queryString.startsWith("?")) {
            return queryString
        }
        var queryWithoutMark = queryString.substring(1)
        var pairs = queryWithoutMark.components(separatedBy: "&")
        var encodedPairs: Array<String> = []
        for pair in resolveUTSKeyIterator(pairs){
            var keyValue = pair.components(separatedBy: "=")
            if (keyValue.count == 2) {
                var key = self.safePercentEncode(keyValue[0], CharacterSet.urlQueryAllowed)
                var value = self.safePercentEncode(keyValue[1], CharacterSet.urlQueryAllowed)
                encodedPairs.append(key + "=" + value)
            } else if (keyValue.count == 1) {
                encodedPairs.append(self.safePercentEncode(pair, CharacterSet.urlQueryAllowed))
            } else {
                var key = keyValue[0]
                var value = keyValue.suffix(from: 1).joined(separator: "=")
                var encodedKey = self.safePercentEncode(key, CharacterSet.urlQueryAllowed)
                var encodedValue = self.safePercentEncode(value, CharacterSet.urlQueryAllowed)
                encodedPairs.append(encodedKey + "=" + encodedValue)
            }
        }
        return "?" + encodedPairs.joined(separator: "&")
    }
    private static func safePercentEncode(_ str: String, _ allowedCharacters: CharacterSet) -> String {
        var result = ""
        var pendingStart: NSNumber = -1
        var i: NSNumber = 0
        while(i < str.length){
            if (str.charAt(i) == "%" && i + 2 < str.length) {
                var hex1 = str.charAt(i + 1)
                var hex2 = str.charAt(i + 2)
                if (self.isHexChar(hex1) && self.isHexChar(hex2)) {
                    if (pendingStart >= 0) {
                        var pending = str.substring(pendingStart, i)
                        var encoded = pending.addingPercentEncoding(withAllowedCharacters: allowedCharacters)
                        result += encoded ?? pending
                        pendingStart = -1
                    }
                    result += str.substring(i, i + 3)
                    i += 3
                    continue
                }
            }
            if (pendingStart < 0) {
                pendingStart = i
            }
            i += 1
        }
        if (pendingStart >= 0) {
            var pending = str.substring(pendingStart as! Int)
            var encoded = pending.addingPercentEncoding(withAllowedCharacters: allowedCharacters)
            result += encoded ?? pending
        }
        return result
    }
    private static func isHexChar(_ char: String) -> Bool {
        if (char.length != 1) {
            return false
        }
        var code = char.charCodeAt(0)
        return (code >= 48 && code <= 57) || (code >= 65 && code <= 70) || (code >= 97 && code <= 102)
    }
}
@objc(UTSSDKModulesDCloudUniNetworkNetworkRequestListener)
@objcMembers
public class NetworkRequestListener : NSObject {
    public weak var task: AnyObject? = nil
    public func onStart() -> Void {}
    public func onHeadersReceived(_ statusCode: NSNumber, _ headers: Map<String, Any>) -> Void {}
    public func onDataReceived(_ data: Data) -> Void {}
    public func onFinished(_ response: HTTPURLResponse) -> Void {}
    public func onFail(_ error: Error) -> Void {}
}
@objc(UTSSDKModulesDCloudUniNetworkNetworkUploadFileListener)
@objcMembers
public class NetworkUploadFileListener : NSObject {
    public weak var task: AnyObject? = nil
    public var progressListeners: Array<UploadFileProgressUpdateCallback> = Array<UploadFileProgressUpdateCallback>()
    public func onProgress(_ progressUpdate: OnProgressUpdateResult) -> Void {}
    public func onDataReceived(_ data: Data) -> Void {}
    public func onFinished(_ response: HTTPURLResponse) -> Void {}
    public func onFail(_ error: Error) -> Void {}
}
@objc(UTSSDKModulesDCloudUniNetworkNetworkDownloadFileListener)
@objcMembers
public class NetworkDownloadFileListener : NSObject {
    public weak var task: AnyObject? = nil
    public var options: DownloadFileOptions? = nil
    public var progressListeners: Array<DownloadFileProgressUpdateCallback> = Array<DownloadFileProgressUpdateCallback>()
    public func onProgress(_ progressUpdate: OnProgressDownloadResult) -> Void {}
    public func onFinished(_ response: HTTPURLResponse, _ filePath: String) -> Void {}
    public func onFail(_ error: Error) -> Void {}
}
@objc(UTSSDKModulesDCloudUniNetworkNetworkRequestTaskImpl)
@objcMembers
public class NetworkRequestTaskImpl : NSObject, RequestTask {
    public var headersReceivedListeners = Map<NSNumber, RequestTaskOnHeadersReceivedCallback>()
    public var chunkReceivedListeners = Map<NSNumber, RequestTaskOnChunkReceivedCallback>()
    private var requestTaskOnHeadersReceivedCallbackCount: NSNumber = 0
    private var requestTaskOnChunkReceivedCallbackCount: NSNumber = 0
    private var semaphore = DispatchSemaphore(value: 1)
    private var task: URLSessionDataTask? = nil
    public init(_ task: URLSessionDataTask?){
        self.task = task
        super.init()
    }
    public func abort() {
        self.task?.cancel()
        UTSiOS.destroyInstance(self)
    }
    public func onHeadersReceived(_ listener: @escaping RequestTaskOnHeadersReceivedCallback) -> NSNumber {
        self.semaphore.wait()
        self.requestTaskOnHeadersReceivedCallbackCount += 1
        self.semaphore.signal()
        self.headersReceivedListeners.set(self.requestTaskOnHeadersReceivedCallbackCount, listener)
        return self.requestTaskOnHeadersReceivedCallbackCount
    }
    public func offHeadersReceived(_ listener: Any?) -> Void {
        if (listener != nil && UTSiOS.typeof(listener!) == "number") {
            var id = listener as! NSNumber
            self.headersReceivedListeners.delete(id)
        } else {
            self.headersReceivedListeners.clear()
        }
    }
    public func onChunkReceived(_ listener: @escaping RequestTaskOnChunkReceivedCallback) -> NSNumber {
        self.semaphore.wait()
        self.requestTaskOnChunkReceivedCallbackCount += 1
        self.semaphore.signal()
        self.chunkReceivedListeners.set(self.requestTaskOnChunkReceivedCallbackCount, listener)
        return self.requestTaskOnChunkReceivedCallbackCount
    }
    public func offChunkReceived(_ listener: Any?) -> Void {
        if (listener != nil && UTSiOS.typeof(listener!) == "number") {
            var id = listener as! NSNumber
            self.chunkReceivedListeners.delete(id)
        } else {
            self.chunkReceivedListeners.clear()
        }
    }
}
@objc(UTSSDKModulesDCloudUniNetworkNetworkUploadTaskImpl)
@objcMembers
public class NetworkUploadTaskImpl : NSObject, UploadTask {
    private var task: URLSessionDataTask? = nil
    private var listener: NetworkUploadFileListener? = nil
    public init(_ task: URLSessionDataTask?, _ listener: NetworkUploadFileListener){
        self.task = task
        self.listener = listener
        super.init()
    }
    public func abort() {
        self.task?.cancel()
        UTSiOS.destroyInstance(self)
    }
    public func onProgressUpdate(_ option: @escaping UploadFileProgressUpdateCallback) {
        var kListener = self.listener
        if (kListener != nil) {
            kListener!.progressListeners.add(option)
        }
    }
}
@objc(UTSSDKModulesDCloudUniNetworkUploadController)
@objcMembers
public class UploadController : NSObject, URLSessionDataDelegate {
    private static var instance: UploadController? = nil
    private var session: URLSession? = nil
    private var taskMap: Map<URLSessionTask, NetworkUploadFileListener> = Map<URLSessionTask, NetworkUploadFileListener>()
    public static func getInstance() -> UploadController {
        if (self.instance == nil) {
            self.instance = UploadController()
        }
        return self.instance!
    }
    public func uploadFile(_ options: UploadFileOptions, _ listener: NetworkUploadFileListener) -> UploadTask {
        var boundary = """
----\(UUID().uuidString)
"""
        var request = self.createRequest(options, listener, boundary)
        if (request == nil) {
            var task = NetworkUploadTaskImpl(nil, listener)
            listener.task = task
            return task
        }
        if (self.session == nil) {
            var urlSessionConfig = URLSessionConfiguration.default
            self.session = URLSession(configuration: urlSessionConfig, delegate: self, delegateQueue: OperationQueue.current)
        }
        var bodyData = self.createBody(boundary, options, listener)
        if (bodyData == nil) {
            var task = NetworkUploadTaskImpl(nil, listener)
            listener.task = task
            return task
        }
        var task = self.session?.uploadTask(with: request!, from: bodyData!)
        task?.resume()
        if (task != nil) {
            self.taskMap.set(task!, listener)
        }
        var requestTask = NetworkUploadTaskImpl(task, listener)
        listener.task = requestTask
        return requestTask
    }
    private func createRequest(_ param: UploadFileOptions, _ listener: NetworkUploadFileListener, _ boundary: String) -> URLRequest? {
        var encodeUrl = NetworkUtil.percentEscapedString(param.url)
        var url = URL(string: encodeUrl)
        if (url == nil) {
            var error = NSError(domain: "invalid URL", code: 600009)
            listener.onFail(error)
            return nil
        }
        var timeout = param.timeout == nil ? 120000 : param.timeout
        var timeoutInterval = Double(timeout!) / 1000
        var request = URLRequest(url: url!, cachePolicy: URLRequest.CachePolicy.useProtocolCachePolicy, timeoutInterval: timeoutInterval)
        request.httpShouldHandleCookies = true
        request.httpMethod = "POST"
        request.setValue("""
multipart/form-data; boundary=\(boundary)
""", forHTTPHeaderField: "Content-Type")
        var ua = UTSiOS.getUserAgent()
        request.setValue(ua, forHTTPHeaderField: "User-Agent")
        var headers = param.header?.toMap()
        if (headers != nil) {
            for entry in resolveUTSKeyIterator(headers!){
                var key = entry.key
                var value = entry.value
                var valueStr = ""
                if (UTSiOS.instanceof(value, UTSJSONObject.self)) {
                    valueStr = JSON.stringify(value) ?? ""
                } else if (UTSiOS.instanceof(value, Map<String, Any>.self)) {
                    valueStr = JSON.stringify(UTSJSONObject(value)) ?? ""
                } else {
                    valueStr = """
\(value)
"""
                }
                request.setValue(valueStr, forHTTPHeaderField: key)
            }
        }
        return request
    }
    private func createBody(_ boundary: String, _ options: UploadFileOptions, _ listener: NetworkUploadFileListener) -> Data? {
        var body = NSMutableData()
        var formData = options.formData?.toMap()
        if (formData != nil) {
            for entry in resolveUTSKeyIterator(formData!){
                var key = entry.key
                var value = entry.value
                if (value != nil && UTSiOS.typeof(key) == "string") {
                    if (UTSiOS.instanceof(value, UTSJSONObject.self)) {
                        var valueStr = JSON.stringify(value)
                        if (valueStr != nil) {
                            self.fillTextPart(body, boundary, key, valueStr as! String)
                        }
                    } else if (UTSiOS.instanceof(value, Map<String, Any>.self)) {
                        var valueStr = JSON.stringify(UTSJSONObject(value))
                        if (valueStr != nil) {
                            self.fillTextPart(body, boundary, key, valueStr as! String)
                        }
                    } else {
                        self.fillTextPart(body, boundary, key, """
\(value)
""")
                    }
                } else {
                    continue
                }
            }
        }
        var tempFiles = options.files
        var filePath = options.filePath
        if (tempFiles != nil && tempFiles!.length > 0) {
            var files: [UploadFileOptionFiles] = tempFiles!
            do {
                var i: NSNumber = 0
                while(i < files.length){
                    var item = files[i]
                    var filePath = item.uri
                    var name = item.name ?? "file"
                    if (!self.fillFilePart(body, boundary, name, filePath!, listener)) {
                        return nil
                    }
                    i++
                }
            }
        } else if (filePath != nil) {
            var name = options.name ?? "file"
            if (!self.fillFilePart(body, boundary, name, filePath!, listener)) {
                return nil
            }
        }
        if (formData == nil && filePath == nil && (tempFiles == nil || (tempFiles != nil && tempFiles?.length == 0))) {
            var error = NSError(domain: "At least one of the parameters filePath, files, or formData", code: 602001)
            listener.onFail(error)
            return nil
        }
        body.append("""
--\(boundary)--\r\n
""".data(using: String.Encoding.utf8)!)
        return body.copy() as! Data
    }
    private func fillTextPart(_ body: NSMutableData, _ boundary: String, _ key: String, _ value: String) {
        body.append("""
--\(boundary)\r\n
""".data(using: String.Encoding.utf8)!)
        body.append("""
Content-Disposition: form-data; name=\"\(key)\"\r\n
""".data(using: String.Encoding.utf8)!)
        body.append("\r\n".data(using: String.Encoding.utf8)!)
        body.append(value.data(using: String.Encoding.utf8)!)
        body.append("\r\n".data(using: String.Encoding.utf8)!)
    }
    private func fillFilePart(_ body: NSMutableData, _ boundary: String, _ name: String, _ filePath: String, _ listener: NetworkUploadFileListener) -> Bool {
        var absolutePath = URL(fileURLWithPath: UTSiOS.getResourceAbsolutePath(filePath, nil))
        var fileData = try? Data(contentsOf: absolutePath)
        if (fileData == nil) {
            var error = NSError(domain: "Illegal file", code: -1)
            listener.onFail(error)
            return false
        }
        var mimeType = self.getMimeType(absolutePath)
        var fileName = absolutePath.lastPathComponent
        var keys = Swift.Set([
            URLResourceKey.fileSizeKey
        ])
        var resourceValue = try? absolutePath.resourceValues(forKeys: keys)
        var fileSize = resourceValue?.fileSize
        body.append("""
--\(boundary)\r\n
""".data(using: String.Encoding.utf8)!)
        body.append("""
Content-Disposition: form-data; name=\"\(name)\"; filename=\"\(fileName)\"\r\n
""".data(using: String.Encoding.utf8)!)
        body.append("""
Content-Type: \(mimeType)\r\n
""".data(using: String.Encoding.utf8)!)
        if (fileSize != nil) {
            body.append("""
Content-Length: \(fileSize!)\r\n
""".data(using: String.Encoding.utf8)!)
        }
        body.append("\r\n".data(using: String.Encoding.utf8)!)
        body.append(fileData!)
        body.append("\r\n".data(using: String.Encoding.utf8)!)
        return true
    }
    private func getMimeType(_ url: URL) -> String {
        var pathExtension = url.pathExtension
        var uti = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, pathExtension as! CFString, nil)?.takeRetainedValue()
        if (uti != nil) {
            var mimetype = UTTypeCopyPreferredTagWithClass(uti!, kUTTagClassMIMEType)?.takeRetainedValue()
            if (mimetype != nil) {
                return mimetype as! String
            }
        }
        return "application/octet-stream"
    }
    public func urlSession(_ session: URLSession, task: URLSessionTask, didSendBodyData bytesSent: Int64, totalBytesSent: Int64, totalBytesExpectedToSend: Int64) {
        var listener = self.taskMap.get(task)
        var progress = (NSNumber.from(totalBytesSent) / totalBytesExpectedToSend) * 100
        var progressUpdate = OnProgressUpdateResult(UTSJSONObject([
            "progress": progress.toInt(),
            "totalBytesSent": totalBytesSent,
            "totalBytesExpectedToSend": totalBytesExpectedToSend
        ]))
        listener?.onProgress(progressUpdate)
    }
    public func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        var listener = self.taskMap.get(dataTask)
        listener?.onDataReceived(data)
    }
    public func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        var listener = self.taskMap.get(task)
        if (error != nil) {
            listener?.onFail(error as! NSError)
        } else {
            listener?.onFinished(task.response as! HTTPURLResponse)
        }
        self.taskMap.delete(task)
    }
}
@objc(UTSSDKModulesDCloudUniNetworkNetworkDownloadTaskImpl)
@objcMembers
public class NetworkDownloadTaskImpl : NSObject, DownloadTask {
    private var task: URLSessionDownloadTask? = nil
    private var listener: NetworkDownloadFileListener? = nil
    public init(_ task: URLSessionDownloadTask?, _ listener: NetworkDownloadFileListener){
        self.task = task
        self.listener = listener
        super.init()
    }
    public func abort() {
        self.task?.cancel()
        UTSiOS.destroyInstance(self)
    }
    public func onProgressUpdate(_ option: @escaping DownloadFileProgressUpdateCallback) {
        var kListener = self.listener
        if (kListener != nil) {
            kListener!.progressListeners.add(option)
        }
    }
}
@objc(UTSSDKModulesDCloudUniNetworkDownloadController)
@objcMembers
public class DownloadController : NSObject, URLSessionDownloadDelegate {
    private static var instance: DownloadController? = nil
    private var session: URLSession? = nil
    private var taskMap: Map<URLSessionTask, NetworkDownloadFileListener> = Map<URLSessionTask, NetworkDownloadFileListener>()
    public static func getInstance() -> DownloadController {
        if (self.instance == nil) {
            self.instance = DownloadController()
        }
        return self.instance!
    }
    public func downloadFile(_ options: DownloadFileOptions, _ listener: NetworkDownloadFileListener) -> DownloadTask {
        var request = self.createDownloadRequest(options, listener)
        if (request == nil) {
            var task = NetworkDownloadTaskImpl(nil, listener)
            listener.task = task
            return task
        }
        if (self.session == nil) {
            var urlSessionConfig = URLSessionConfiguration.default
            self.session = URLSession(configuration: urlSessionConfig, delegate: self, delegateQueue: OperationQueue.current)
        }
        var task = self.session?.downloadTask(with: request!)
        task?.resume()
        if (task != nil) {
            self.taskMap.set(task!, listener)
        }
        var requestTask = NetworkDownloadTaskImpl(task, listener)
        listener.task = requestTask
        return requestTask
    }
    private func createDownloadRequest(_ options: DownloadFileOptions, _ listener: NetworkDownloadFileListener) -> URLRequest? {
        var encodeUrl = NetworkUtil.percentEscapedString(options.url)
        var url = URL(string: encodeUrl)
        if (url == nil) {
            var error = NSError(domain: "invalid URL", code: 600009)
            listener.onFail(error)
            return nil
        }
        var timeout = options.timeout == nil ? 120000 : options.timeout
        var timeoutInterval = Double(timeout!) / 1000
        var request = URLRequest(url: url!, cachePolicy: URLRequest.CachePolicy.useProtocolCachePolicy, timeoutInterval: timeoutInterval)
        request.httpShouldHandleCookies = true
        request.httpMethod = "GET"
        var ua = UTSiOS.getUserAgent()
        request.setValue(ua, forHTTPHeaderField: "User-Agent")
        var headers = options.header?.toMap()
        if (headers != nil) {
            for entry in resolveUTSKeyIterator(headers!){
                var key = entry.key
                var value = entry.value
                var valueStr = ""
                if (UTSiOS.instanceof(value, UTSJSONObject.self)) {
                    valueStr = JSON.stringify(value) ?? ""
                } else if (UTSiOS.instanceof(value, Map<String, Any>.self)) {
                    valueStr = JSON.stringify(UTSJSONObject(value)) ?? ""
                } else {
                    valueStr = """
\(value)
"""
                }
                request.setValue(valueStr, forHTTPHeaderField: key)
            }
        }
        return request
    }
    private func convertToMD5(_ param: String) -> String {
        var strData = param.data(using: String.Encoding.utf8)!
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
    private func isSandBoxPath(_ path: String) -> Bool {
        return path.startsWith(NSHomeDirectory())
    }
    private func getTempPath() -> String {
        var cacheDirectory = FileManager.default.urls(for: FileManager.SearchPathDirectory.cachesDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first!
        return cacheDirectory.path
    }
    private func getRealPath() -> String {
        return self.getTempPath() + "/uni-download/"
    }
    private func getTargetPath(_ options: DownloadFileOptions?, _ fileName: String, _ listener: NetworkDownloadFileListener?) -> String? {
        var targetPath = ""
        var specifyPath = options?.filePath ?? ""
        if (specifyPath.startsWith("unifile://")) {
            specifyPath = UTSiOS.getResourceAbsolutePath(specifyPath, nil)
        }
        var hasFileName = false
        if (specifyPath != "") {
            var pos = specifyPath.lastIndexOf("/")
            if (pos == specifyPath.length - 1) {
                if (self.isSandBoxPath(specifyPath)) {
                    targetPath = specifyPath
                } else {
                    targetPath = self.getTempPath() + "/" + specifyPath
                }
            } else {
                var path = ""
                if (self.isSandBoxPath(specifyPath)) {
                    path = specifyPath
                } else {
                    path = self.getTempPath() + "/" + specifyPath
                }
                var fileManager = FileManager.default
                var isDirectory: ObjCBool = false
                if (fileManager.fileExists(atPath: path, isDirectory: &isDirectory)) {
                    if (isDirectory.boolValue) {
                        var error = NSError(domain: "The target file path is already a directory file, and file creation failed.", code: 602001)
                        listener?.onFail(error)
                        return nil
                    }
                }
                targetPath = path
                hasFileName = true
            }
        } else {
            targetPath = self.getRealPath()
        }
        if (!hasFileName) {
            targetPath += fileName
        }
        var fileManager = FileManager.default
        if (fileManager.fileExists(atPath: targetPath)) {
            var index = targetPath.lastIndexOf(".")
            var tFileName = targetPath
            var tFileType = ""
            if (index >= 0) {
                tFileName = targetPath.substring(0, index as! Int)
                tFileType = targetPath.substring(index as! Int)
            }
            var number: NSNumber = 1
            while(fileManager.fileExists(atPath: targetPath)){
                targetPath = tFileName + """
(\(number))
""" + tFileType
                number++
            }
        }
        return targetPath
    }
    private func getFileName(_ fileName: String, _ url: URL?) -> String {
        var suggestedFilename = fileName
        if (suggestedFilename != "") {
            var cString = suggestedFilename.cString(using: String.Encoding.isoLatin1)
            if (cString != nil) {
                suggestedFilename = String(cString: cString!, encoding: String.Encoding.utf8) ?? suggestedFilename
            }
            var cleanUri = suggestedFilename.removingPercentEncoding
            if (cleanUri != nil && cleanUri!.length > 0) {
                suggestedFilename = cleanUri!
            }
            suggestedFilename = suggestedFilename.replacingOccurrences(of: "/", with: "")
            suggestedFilename = suggestedFilename.replacingOccurrences(of: "\\", with: "")
        } else {
            if (url == nil) {
                suggestedFilename = ""
            } else {
                suggestedFilename = self.convertToMD5(url!.absoluteString)
            }
        }
        if (suggestedFilename.length > 255) {
            var extensionType = (suggestedFilename as! NSString).pathExtension
            suggestedFilename = self.convertToMD5((suggestedFilename as! NSString).deletingPathExtension)
            if (extensionType != "") {
                suggestedFilename = (suggestedFilename as! NSString).appendingPathExtension(extensionType) ?? suggestedFilename
            }
        }
        return suggestedFilename
    }
    public func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        var listener = self.taskMap.get(downloadTask)
        var progress = (NSNumber.from(totalBytesWritten) / totalBytesExpectedToWrite) * 100
        var progressUpdate = OnProgressDownloadResult(UTSJSONObject([
            "progress": progress.toInt(),
            "totalBytesWritten": totalBytesWritten,
            "totalBytesExpectedToWrite": totalBytesExpectedToWrite
        ]))
        listener?.onProgress(progressUpdate)
    }
    public func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        var listener = self.taskMap.get(downloadTask)
        var suggestedFilename = downloadTask.response?.suggestedFilename
        var statusCode = (downloadTask.response as! HTTPURLResponse).statusCode
        if (statusCode - 200 < 100 && statusCode - 200 >= 0) {
            var fileName = self.getFileName(suggestedFilename ?? "", downloadTask.response?.url)
            var destPath = self.getTargetPath(listener?.options, fileName, listener)
            if (destPath != nil) {
                var fileManager = FileManager.default
                do {
                    var directoryPath = (destPath as! NSString).deletingLastPathComponent
                    if (!fileManager.fileExists(atPath: directoryPath)) {
                        try? fileManager.createDirectory(atPath: directoryPath, withIntermediateDirectories: true, attributes: nil)
                    }
                    try? fileManager.moveItem(atPath: location.path, toPath: destPath!)
                    listener?.onFinished(downloadTask.response as! HTTPURLResponse, destPath!)
                }
                 catch  {
                    var error = NSError(domain: "file move fail", code: 602001)
                    listener?.onFail(error)
                }
            }
        } else {
            var error = NSError(domain: "request fail", code: statusCode)
            listener?.onFail(error)
        }
        self.taskMap.delete(downloadTask)
    }
    public func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        if (error != nil) {
            var listener = self.taskMap.get(task)
            listener?.onFail(error as! NSError)
            self.taskMap.delete(task)
        }
    }
}
@objc(UTSSDKModulesDCloudUniNetworkNetworkManager)
@objcMembers
public class NetworkManager : NSObject, URLSessionDataDelegate {
    private static var instance: NetworkManager? = nil
    private var enableChunked: Bool = false
    private var enableQuic: Bool = false
    private var lastQuicState: Bool? = nil
    private var session: URLSession? = nil
    private var taskMap: Map<URLSessionTask, NetworkRequestListener> = Map<URLSessionDataTask, NetworkRequestListener>()
    public static func getInstance() -> NetworkManager {
        if (self.instance == nil) {
            self.instance = NetworkManager()
        }
        return self.instance!
    }
    public func request<T>(_ param: RequestOptions<T>, _ listener: NetworkRequestListener) -> RequestTask {
        var currentQuicState = param.enableQuic ?? false
        self.enableQuic = currentQuicState
        self.lastQuicState = currentQuicState
        var request = self.createRequest(param)
        self.enableChunked = param.enableChunked ?? false
        if (request == nil) {
            var error = NSError(domain: "invalid URL", code: 600009)
            listener.onFail(error)
            var task = NetworkRequestTaskImpl(nil)
            listener.task = task
            return task
        }
        if (self.session == nil) {
            var urlSessionConfig = URLSessionConfiguration.default
            if (self.enableQuic) {
                urlSessionConfig.requestCachePolicy = NSURLRequest.CachePolicy.reloadIgnoringLocalCacheData
                urlSessionConfig.waitsForConnectivity = true
                urlSessionConfig.httpShouldSetCookies = false
            }
            self.session = URLSession(configuration: urlSessionConfig, delegate: self, delegateQueue: OperationQueue.current)
        }
        var task = self.session?.dataTask(with: request!)
        task?.resume()
        if (task != nil) {
            self.taskMap.set(task!, listener)
        }
        var requestTask = NetworkRequestTaskImpl(task)
        listener.task = requestTask
        return requestTask
    }
    public func uploadFile(_ options: UploadFileOptions, _ listener: NetworkUploadFileListener) -> UploadTask {
        return UploadController.getInstance().uploadFile(options, listener)
    }
    public func downloadFile(_ options: DownloadFileOptions, _ listener: NetworkDownloadFileListener) -> DownloadTask {
        return DownloadController.getInstance().downloadFile(options, listener)
    }
    public func createRequest<T>(_ param: RequestOptions<T>) -> URLRequest? {
        var encodeUrl = NetworkUtil.percentEscapedString(param.url)
        var url = URL(string: encodeUrl)
        if (url == nil) {
            return nil
        }
        var timeout = param.timeout == nil ? 120000 : param.timeout
        var timeoutInterval = Double(timeout!) / 1000
        var request = URLRequest(url: url!, cachePolicy: URLRequest.CachePolicy.useProtocolCachePolicy, timeoutInterval: timeoutInterval)
        request.httpShouldHandleCookies = true
        var method = param.method
        if (method == nil || method!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).count == 0) {
            method = "GET"
        }
        request.httpMethod = method!
        var ua = UTSiOS.getUserAgent()
        request.setValue(ua, forHTTPHeaderField: "User-Agent")
        if (param.header == nil) {
            param.header = UTSJSONObject([:])
        }
        var headers = param.header?.toMap()
        var hasContentType = false
        if (headers != nil) {
            for entry in resolveUTSKeyIterator(headers!){
                var key = entry.key
                var value = entry.value
                if (key.caseInsensitiveCompare("Content-Type") == ComparisonResult.orderedSame) {
                    hasContentType = true
                }
                var valueStr = ""
                if (UTSiOS.instanceof(value, UTSJSONObject.self)) {
                    valueStr = JSON.stringify(value) ?? ""
                } else if (UTSiOS.instanceof(value, Map<String, Any>.self)) {
                    valueStr = JSON.stringify(UTSJSONObject(value)) ?? ""
                } else {
                    valueStr = """
\(value)
"""
                }
                request.setValue(valueStr, forHTTPHeaderField: key)
            }
        }
        if (!hasContentType) {
            if ("GET" != method) {
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        }
        if ("GET" == method) {
            var data = param.data
            if (data != nil) {
                var json: UTSJSONObject? = nil
                if (UTSiOS.typeof(data) == "string") {
                    json = JSON.parseObject(data as! String)
                } else if (UTSiOS.instanceof(data, UTSJSONObject.self)) {
                    json = data as! UTSJSONObject
                } else if (UTSiOS.instanceof(data, Map<String, Any>.self)) {
                    json = UTSJSONObject(data!)
                }
                if (json != nil) {
                    var urlWithQuery = self.stringifyQuery(encodeUrl, json!)
                    var url = URL(string: urlWithQuery)
                    request.url = url
                }
            }
        } else if (param.data != nil) {
            var bodyData: Data? = nil
            if (UTSiOS.typeof(param.data) == "string") {
                bodyData = (param.data as! String).data(using: String.Encoding.utf8)
            } else if (UTSiOS.instanceof(param.data, Map<String, Any>.self)) {
                var body: String? = ""
                var contentType = request.value(forHTTPHeaderField: "Content-Type")
                var data = UTSJSONObject(param.data!)
                if (contentType != nil) {
                    if (contentType!.indexOf("application/x-www-form-urlencoded") == 0) {
                        var map: Map<String, Any?> = data.toMap()
                        var bodyArray = Array<String>()
                        map.forEach({
                        (value, key) -> Void in
                        bodyArray.push(key + "=" + """
\(value ?? "null")
""")
                        })
                        body = bodyArray.join("&")
                    } else {
                        body = JSON.stringify(data)
                    }
                    bodyData = body?.data(using: String.Encoding.utf8)
                }
            } else if (UTSiOS.instanceof(param.data, ArrayBuffer.self)) {
                var arrayBuffer = param.data as! ArrayBuffer
                bodyData = arrayBuffer.toData()
            } else if (UTSiOS.instanceof(param.data, UTSJSONObject.self)) {
                var body: String? = ""
                var contentType = request.value(forHTTPHeaderField: "Content-Type")
                if (contentType != nil) {
                    if (contentType!.indexOf("application/x-www-form-urlencoded") == 0) {
                        var data = param.data as! UTSJSONObject
                        var map: Map<String, Any?> = data.toMap()
                        var bodyArray = Array<String>()
                        map.forEach({
                        (value, key) -> Void in
                        bodyArray.push(key + "=" + """
\(value ?? "null")
""")
                        })
                        body = bodyArray.join("&")
                    } else {
                        body = JSON.stringify(param.data)
                    }
                    bodyData = body?.data(using: String.Encoding.utf8)
                }
            }
            if (bodyData == nil) {
                return nil
            }
            request.httpBody = bodyData
        }
        if #available(iOS 15.0, *) {
            request.assumesHTTP3Capable = self.enableQuic
        }
        return request
    }
    private func stringifyQuery(_ url: String, _ data: UTSJSONObject) -> String {
        var newUrl = url
        var str = url.split("#")
        var hash = ""
        if (str.length > 1) {
            hash = str[1]
        }
        str = str[0].split("?")
        var query = ""
        if (str.length > 1) {
            query = str[1]
        }
        newUrl = str[0]
        var pairs = query.split("&")
        var queryMap = Map<String, String>()
        pairs.forEach({
        (item: String, index: NSNumber) -> Void in
        var temp = item.split("=")
        if (temp.length > 1) {
            queryMap[temp[0]] = temp[1]
        }
        })
        var dataMap: Map<String, Any?> = data.toMap()
        dataMap.forEach({
        (reassignedValue, key) -> Void in
        var value = reassignedValue
        if (value == nil) {
            value = ""
        }
        var encodeKey = encodeURIComponent(key)!
        if (UTSiOS.instanceof(value, UTSJSONObject.self) || UTSiOS.instanceof(value, Array<Any?>.self)) {
            queryMap[encodeKey] = encodeURIComponent(JSON.stringify(value)!)!
        } else if (UTSiOS.instanceof(value, Map<String, Any>.self)) {
            queryMap[encodeKey] = encodeURIComponent(JSON.stringify(UTSJSONObject(value))!)!
        } else {
            queryMap[encodeKey] = encodeURIComponent("""
\(value!)
""")!
        }
        })
        var queryStr = ""
        queryMap.forEach({
        (value, key) -> Void in
        queryStr += key + "=" + value + "&"
        })
        queryStr = queryStr.slice(0, -1)
        if (queryStr.length > 0) {
            newUrl += "?" + queryStr
        }
        if (hash.length > 0) {
            newUrl += "#" + hash
        }
        return newUrl
    }
    private func percentEscapedString(_ str: String) -> String {
        return str.removingPercentEncoding?.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? str
    }
    public func urlSession(_ session: URLSession, task: URLSessionTask, didSendBodyData bytesSent: Int64, totalBytesSent: Int64, totalBytesExpectedToSend: Int64) {}
    public func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse, completionHandler: @escaping (_ dis: URLSession.ResponseDisposition) -> Void) {
        var listener = self.taskMap.get(dataTask)
        if (listener != nil) {
            var httpResponse: HTTPURLResponse = response as! HTTPURLResponse
            var statusCode = NSNumber(value: httpResponse.statusCode)
            listener?.onHeadersReceived(statusCode, httpResponse.allHeaderFields as! Map<String, Any>)
            var headers = NetworkUtil.convertHeaders(httpResponse.allHeaderFields as! Map<String, Any>)
            if (listener!.task != nil && UTSiOS.instanceof(listener!.task, NetworkRequestTaskImpl.self)) {
                var task = listener!.task! as! NetworkRequestTaskImpl
                task.headersReceivedListeners.forEach({
                (value: @escaping RequestTaskOnHeadersReceivedCallback, key: NSNumber) -> Void in
                var result = RequestTaskOnHeadersReceivedListenerResult(UTSJSONObject([
                    "cookies": NetworkUtil.parseCookie(headers),
                    "header": headers,
                    "statusCode": statusCode
                ]))
                value(result)
                })
            }
        }
        completionHandler(URLSession.ResponseDisposition.allow)
    }
    public func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        var listener = self.taskMap.get(dataTask)
        listener?.onDataReceived(data)
        if (self.enableChunked && listener != nil) {
            if (listener!.task != nil && UTSiOS.instanceof(listener!.task, NetworkRequestTaskImpl.self)) {
                var task = listener!.task! as! NetworkRequestTaskImpl
                task.chunkReceivedListeners.forEach({
                (value: @escaping RequestTaskOnChunkReceivedCallback, key: NSNumber) -> Void in
                var result = RequestTaskOnChunkReceivedListenerResult(UTSJSONObject([
                    "data": ArrayBuffer.fromData(data)
                ]))
                value(result)
                })
            }
        }
    }
    public func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        var listener = self.taskMap.get(task)
        if (error != nil) {
            listener?.onFail(error as! NSError)
        } else {
            listener?.onFinished(task.response as! HTTPURLResponse)
        }
        self.taskMap.delete(task)
    }
}
@objc(UTSSDKModulesDCloudUniNetworkStatusCode)
@objcMembers
public class StatusCode : NSObject {
    private static var statusCodeMap: Map<String, String>? = nil
    private static func initStatusCodeMap() {
        var map = Map<String, String>()
        map.set("100", "Continue")
        map.set("101", "Switching Protocol")
        map.set("200", "OK")
        map.set("201", "Created")
        map.set("202", "Accepted")
        map.set("203", "Non-Authoritative Information")
        map.set("204", "No Content")
        map.set("205", "Reset Content")
        map.set("206", "Partial Content")
        map.set("300", "Multiple Choice")
        map.set("301", "Moved Permanently")
        map.set("302", "Found")
        map.set("303", "See Other")
        map.set("304", "Not Modified")
        map.set("305", "Use Proxy")
        map.set("306", "unused")
        map.set("307", "Temporary Redirect")
        map.set("308", "Permanent Redirect")
        map.set("400", "Bad Request")
        map.set("401", "Unauthorized")
        map.set("402", "Payment Required")
        map.set("403", "Forbidden")
        map.set("404", "Not Found")
        map.set("405", "Method Not Allowed")
        map.set("406", "Not Acceptable")
        map.set("407", "Proxy Authentication Required")
        map.set("408", "Request Timeout")
        map.set("409", "Conflict")
        map.set("410", "Gone")
        map.set("411", "Length Required")
        map.set("412", "Precondition Failed")
        map.set("413", "Payload Too Large")
        map.set("414", "URI Too Long")
        map.set("415", "Unsupported Media Type")
        map.set("416", "Requested Range Not Satisfiable")
        map.set("417", "Expectation Failed")
        map.set("418", "I'm a teapot")
        map.set("421", "Misdirected Request")
        map.set("426", "Upgrade Required")
        map.set("428", "Precondition Required")
        map.set("429", "Too Many Requests")
        map.set("431", "Request Header Fields Too Large")
        map.set("500", "Internal Server Error")
        map.set("501", "Not Implemented")
        map.set("502", "Bad Gateway")
        map.set("503", "Service Unavailable")
        map.set("504", "Gateway Timeout")
        map.set("505", "HTTP Version Not Supported")
        map.set("506", "Variant Also Negotiates")
        map.set("507", "Variant Also Negotiates")
        map.set("511", "Network Authentication Required")
        self.statusCodeMap = map
    }
    public static func getStatus(_ code: String) -> String {
        var map = self.statusCodeMap
        if (map == nil) {
            self.initStatusCodeMap()
        }
        var tmp = self.statusCodeMap!
        if (!tmp.has(code)) {
            return "unknown status"
        } else {
            return tmp.get(code)! as! String
        }
    }
}
public var UniNetWorkErrorSubject = "uni-request"
public var NetWorkUniErrors: Map<RequestErrorCode, String> = Map([
    [
        5,
        "time out"
    ],
    [
        1000,
        "server system error"
    ],
    [
        100001,
        "invalid json"
    ],
    [
        100002,
        "error message invalid json"
    ],
    [
        100003,
        "json parsing type conversion failed"
    ],
    [
        600003,
        "network interrupted error"
    ],
    [
        600008,
        "the data parameter type is invalid"
    ],
    [
        600009,
        "invalid URL"
    ],
    [
        600010,
        "cronet load fail"
    ],
    [
        602001,
        "request system error"
    ]
])
fileprivate func getErrcode(_ errCode: NSNumber) -> RequestErrorCode {
    var res = NetWorkUniErrors[errCode]
    return res == nil ? 602001 : errCode
}
@objc(UTSSDKModulesDCloudUniNetworkRequestFailImpl)
@objcMembers
public class RequestFailImpl : UniError, RequestFail {
    public init(_ errCode: RequestErrorCode){
        super.init()
        self.errSubject = UniNetWorkErrorSubject
        self.errCode = errCode
        self.errMsg = NetWorkUniErrors[errCode] ?? ""
    }
}
@objc(UTSSDKModulesDCloudUniNetworkUploadFileFailImpl)
@objcMembers
public class UploadFileFailImpl : UniError, UploadFileFail {
    public init(_ errCode: RequestErrorCode){
        super.init()
        self.errSubject = "uni-uploadFile"
        self.errCode = errCode
        self.errMsg = NetWorkUniErrors[errCode] ?? ""
    }
}
@objc(UTSSDKModulesDCloudUniNetworkDownloadFileFailImpl)
@objcMembers
public class DownloadFileFailImpl : UniError, DownloadFileFail {
    public init(_ errCode: RequestErrorCode){
        super.init()
        self.errSubject = "uni-downloadFile"
        self.errCode = errCode
        self.errMsg = NetWorkUniErrors[errCode] ?? ""
    }
}
public class SimpleNetworkListener<T> : NetworkRequestListener {
    private var param: RequestOptions<T>? = nil
    private var received: NSNumber = 0
    private var data: Data = Data()
    public weak override var task: AnyObject? {
        get {
            return self.__task
        }
        set(value) {
            self.__task = value
        }
    }
    public init(_ param: RequestOptions<T>){
        super.init()
        self.param = param
    }
    public override func onStart() -> Void {}
    public override func onHeadersReceived(_ statusCode: NSNumber, _ headers: Map<String, Any>) -> Void {}
    public override func onDataReceived(_ data: Data) -> Void {
        self.received += NSNumber.from(data.count)
        self.data.append(data)
    }
    public override func onFinished(_ response: HTTPURLResponse) -> Void {
        do {
            var originalHeaders = response.allHeaderFields as! Map<String, Any>
            var headers = Map<String, Any>()
            originalHeaders.forEach({
            (value, key) -> Void in
            headers.set(key.toLowerCase(), value)
            })
            var kParam = self.param
            var result: UTSJSONObject = UTSJSONObject([:])
            result["statusCode"] = response.statusCode
            result["statusText"] = StatusCode.getStatus(String(response.statusCode))
            if (headers != nil) {
                result["header"] = headers
            }
            var strData = self.readStringFromData(self.data, response.textEncodingName)
            var type__1 = kParam?.responseType != nil ? kParam?.responseType as! String : kParam?.dataType
            if (type__1 == nil && headers != nil) {
                for entry in resolveUTSKeyIterator(headers){
                    var key = entry.key
                    if (key.caseInsensitiveCompare("Content-Type") == ComparisonResult.orderedSame) {
                        type__1 = headers[key] as! String
                    }
                }
            }
            result["data"] = self.parseData(self.data, strData, type__1)
            if (result["data"] == nil) {
                var failResult = RequestFailImpl(getErrcode(100001))
                var fail = kParam?.fail
                var complete = kParam?.complete
                fail?(failResult)
                complete?(failResult)
                return
            }
            var tmp = RequestSuccess<T>(UTSJSONObject([
                "data": result["data"]! as! T,
                "statusCode": NSNumber(value: response.statusCode),
                "header": result["header"] ?? "",
                "cookies": self.parseCookie(headers)
            ]))
            var success = kParam?.success
            var complete = kParam?.complete
            success?(tmp)
            complete?(tmp)
        }
         catch let e {}
        if (self.task != nil) {
            UTSiOS.destroyInstance(self.task!)
        }
    }
    public override func onFail(_ error: Error) -> Void {
        var kParam = self.param
        var code = (error as! NSError).code
        var errCode = code
        var cause = error.localizedDescription
        if (code == -1001) {
            errCode = 5
        } else if (code == -1004) {
            errCode = 1000
        } else if (code == -1009) {
            errCode = 600003
        } else {
            errCode = 602001
        }
        var failResult = RequestFailImpl(getErrcode(NSNumber.from(errCode)))
        failResult.cause = SourceError(cause)
        var fail = kParam?.fail
        var complete = kParam?.complete
        fail?(failResult)
        complete?(failResult)
        if (self.task != nil) {
            UTSiOS.destroyInstance(self.task!)
        }
    }
    private func readStringFromData(_ data: Data, _ type__1: String?) -> String? {
        var result: String? = nil
        var finalType = type__1
        if (finalType == nil || finalType!.length == 0) {
            finalType = "utf-8"
        }
        var cfEncoding = CFStringConvertIANACharSetNameToEncoding(finalType as! CFString)
        if (cfEncoding != kCFStringEncodingInvalidId) {
            var stringEncoding = CFStringConvertEncodingToNSStringEncoding(cfEncoding)
            var encode = String.Encoding(rawValue: stringEncoding)
            result = String(data: data, encoding: encode)
        }
        return result
    }
    private func parseData(_ data: Data?, _ dataStr: String?, _ parseType: String?) -> Any? {
        if (T.self == String.self || T.self == Optional<String>.self) {
            return dataStr
        } else if (T.self == ArrayBuffer.self || T.self == Optional<ArrayBuffer>.self) {
            if (data == nil) {
                return data
            }
            return ArrayBuffer.fromData(data!)
        } else if ("""
\(type(of: T.self))
""" == "Any.Protocol" || """
\(type(of: T.self))
""" == "Optional<Any>.Type") {
            if (parseType != nil && parseType!.contains("json")) {
                if (dataStr == nil || dataStr!.length == 0) {
                    return UTSJSONObject([:])
                }
                return self.tryParseJson(data!, dataStr!)
            } else if (parseType == "jsonp") {
                if (dataStr == nil || dataStr!.length == 0) {
                    return UTSJSONObject([:])
                }
                var start = dataStr!.indexOf("(")
                var end = dataStr!.indexOf(")")
                if (start == 0 || start >= end) {
                    return UTSJSONObject([:])
                }
                start += 1
                var tmp = dataStr!.slice(start, end)
                return self.tryParseJson(data!, tmp)
            } else if (parseType != nil && parseType!.toLowerCase() == "string") {
                return dataStr
            } else if (parseType != nil && parseType!.toLowerCase() == "arraybuffer") {
                if (data == nil) {
                    return data
                }
                return ArrayBuffer.fromData(data!)
            } else {
                if (data == nil) {
                    return data
                }
                var currentStr: String? = dataStr
                if (currentStr == nil) {
                    currentStr = String(data: data!, encoding: String.Encoding.utf8)
                }
                if (currentStr == nil) {
                    currentStr = String(data: data!, encoding: String.Encoding.ascii)
                }
                if (currentStr == nil) {
                    return nil
                }
                return self.tryParseJson(data!, currentStr!) ?? currentStr
            }
        } else {
            if (dataStr == nil || dataStr!.length == 0) {
                return nil
            }
            return JSON.parse(dataStr!, T.self)
        }
    }
    private func tryParseJson(_ data: Data, _ jsonStr: String) -> Any? {
        var jsonData: Any? = nil
        do {
            var res = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
            if (res != nil) {
                jsonData = JSON.parse(jsonStr)
            }
        }
         catch let e {}
        return jsonData
    }
    private func parseCookie(_ header: Map<String, Any>?) -> [String] {
        if (header == nil) {
            return []
        }
        var cookiesStr = header!.get("Set-Cookie") as! String?
        if (cookiesStr == nil) {
            cookiesStr = header!.get("set-cookie") as! String?
        }
        if (cookiesStr == nil) {
            return []
        }
        var cookiesArr = Array<String>()
        if (cookiesStr!.charAt(0) == "[" && cookiesStr!.charAt(cookiesStr!.length - 1) == "]") {
            cookiesStr = cookiesStr!.slice(1, -1)
        }
        var handleCookiesArr = cookiesStr!.split(";")
        do {
            var i: NSNumber = 0
            while(i < handleCookiesArr.length){
                if (handleCookiesArr[i].indexOf("Expires=") != -1 || handleCookiesArr[i].indexOf("expires=") != -1) {
                    cookiesArr.push(handleCookiesArr[i].replace(",", ""))
                } else {
                    cookiesArr.push(handleCookiesArr[i])
                }
                i++
            }
        }
        cookiesArr = cookiesArr.join(";").split(",")
        return cookiesArr
    }
    private weak var __task: AnyObject? = nil
}
@objc(UTSSDKModulesDCloudUniNetworkUploadNetworkListener)
@objcMembers
public class UploadNetworkListener : NetworkUploadFileListener {
    private var param: UploadFileOptions? = nil
    public override var progressListeners: Array<UploadFileProgressUpdateCallback> {
        get {
            return self.__progressListeners
        }
        set(value) {
            self.__progressListeners = value
        }
    }
    private var data: Data = Data()
    public weak override var task: AnyObject? {
        get {
            return self.__task
        }
        set(value) {
            self.__task = value
        }
    }
    public init(_ param: UploadFileOptions){
        super.init()
        self.param = param
    }
    public override func onProgress(_ progressUpdate: OnProgressUpdateResult) {
        if (self.progressListeners.length != 0) {
            do {
                var i: NSNumber = 0
                while(i < self.progressListeners.length){
                    var listener = self.progressListeners[i]
                    listener(progressUpdate)
                    i++
                }
            }
        }
    }
    public override func onDataReceived(_ data: Data) -> Void {
        self.data.append(data)
    }
    public override func onFinished(_ response: HTTPURLResponse) -> Void {
        do {
            var kParam = self.param
            var strData = self.readStringFromData(self.data, response.textEncodingName)
            if (strData == nil) {
                strData = String(data: self.data, encoding: String.Encoding.utf8)
                if (strData == nil) {
                    strData = String(data: self.data, encoding: String.Encoding.ascii)
                }
            }
            var successResult = UploadFileSuccess(UTSJSONObject([
                "data": strData ?? "",
                "statusCode": response.statusCode
            ]))
            var success = kParam?.success
            var complete = kParam?.complete
            success?(successResult)
            complete?(successResult)
        }
         catch let e {}
        self.progressListeners.splice(0, self.progressListeners.length)
        if (self.task != nil) {
            UTSiOS.destroyInstance(self.task!)
        }
    }
    public override func onFail(_ error: Error) -> Void {
        var kParam = self.param
        var code = (error as! NSError).code
        var errCode = code
        var cause = error.localizedDescription
        if (code == -1001) {
            errCode = 5
        } else if (code == -1004) {
            errCode = 1000
        } else if (code == -1009) {
            errCode = 600003
        } else {
            errCode = 602001
        }
        var failResult = UploadFileFailImpl(getErrcode(NSNumber.from(errCode)))
        failResult.cause = SourceError(cause)
        var fail = kParam?.fail
        var complete = kParam?.complete
        fail?(failResult)
        complete?(failResult)
        self.progressListeners.splice(0, self.progressListeners.length)
        if (self.task != nil) {
            UTSiOS.destroyInstance(self.task!)
        }
    }
    private func readStringFromData(_ data: Data, _ type__1: String?) -> String? {
        var result: String? = nil
        var finalType = type__1
        if (finalType == nil || finalType!.length == 0) {
            finalType = "utf-8"
        }
        var cfEncoding = CFStringConvertIANACharSetNameToEncoding(finalType as! CFString)
        if (cfEncoding != kCFStringEncodingInvalidId) {
            var stringEncoding = CFStringConvertEncodingToNSStringEncoding(cfEncoding)
            var encode = String.Encoding(rawValue: stringEncoding)
            result = String(data: data, encoding: encode)
        }
        return result
    }
    private var __progressListeners: Array<UploadFileProgressUpdateCallback> = []
    private weak var __task: AnyObject? = nil
}
@objc(UTSSDKModulesDCloudUniNetworkDownloadNetworkListener)
@objcMembers
public class DownloadNetworkListener : NetworkDownloadFileListener {
    public override var options: DownloadFileOptions? {
        get {
            return self.__options
        }
        set(value) {
            self.__options = value
        }
    }
    public override var progressListeners: Array<DownloadFileProgressUpdateCallback> {
        get {
            return self.__progressListeners
        }
        set(value) {
            self.__progressListeners = value
        }
    }
    private var data: Data = Data()
    public weak override var task: AnyObject? {
        get {
            return self.__task
        }
        set(value) {
            self.__task = value
        }
    }
    public init(_ options: DownloadFileOptions){
        super.init()
        self.options = options
    }
    public override func onProgress(_ progressUpdate: OnProgressDownloadResult) {
        if (self.progressListeners.length != 0) {
            do {
                var i: NSNumber = 0
                while(i < self.progressListeners.length){
                    var listener = self.progressListeners[i]
                    listener(progressUpdate)
                    i++
                }
            }
        }
    }
    public override func onFinished(_ response: HTTPURLResponse, _ filePath: String) -> Void {
        do {
            var kParam = self.options
            var tmp = DownloadFileSuccess(UTSJSONObject([
                "tempFilePath": filePath,
                "statusCode": response.statusCode
            ]))
            var success = kParam?.success
            var complete = kParam?.complete
            success?(tmp)
            complete?(tmp)
        }
         catch let e {}
        self.progressListeners.splice(0, self.progressListeners.length)
        if (self.task != nil) {
            UTSiOS.destroyInstance(self.task!)
        }
    }
    public override func onFail(_ error: Error) -> Void {
        var kParam = self.options
        var code = (error as! NSError).code
        var errCode = code
        var cause = error.localizedDescription
        if (code == -1001) {
            errCode = 5
        } else if (code == -1004) {
            errCode = 1000
        } else if (code == -1009) {
            errCode = 600003
        } else {
            errCode = 602001
        }
        var failResult = DownloadFileFailImpl(getErrcode(NSNumber.from(errCode)))
        var codeCause = StatusCode.getStatus(String(code))
        var sourceError = SourceError(codeCause == "unknown status" ? cause : codeCause)
        sourceError.code = NSNumber.from(code)
        failResult.cause = sourceError
        var fail = kParam?.fail
        var complete = kParam?.complete
        fail?(failResult)
        complete?(failResult)
        self.progressListeners.splice(0, self.progressListeners.length)
        if (self.task != nil) {
            UTSiOS.destroyInstance(self.task!)
        }
    }
    private var __options: DownloadFileOptions? = nil
    private var __progressListeners: Array<DownloadFileProgressUpdateCallback> = []
    private weak var __task: AnyObject? = nil
}
public func request<T>(_ options: RequestOptions<T>, _ _t: T.Type) -> RequestTask {
    return NetworkManager.getInstance().request(options, SimpleNetworkListener<T>(options))
}
public var uploadFile: UploadFile = {
(_ options: UploadFileOptions) -> UploadTask in
return NetworkManager.getInstance().uploadFile(options, UploadNetworkListener(options))
}
public var downloadFile: DownloadFile = {
(_ options: DownloadFileOptions) -> DownloadTask in
return NetworkManager.getInstance().downloadFile(options, DownloadNetworkListener(options))
}
@objc(UTSSDKModulesDCloudUniNetworkRequestOptionsJSONObject)
@objcMembers
public class RequestOptionsJSONObject : NSObject {
    public var url: String!
    public var data: Any?
    public var header: UTSJSONObject?
    public var method: RequestMethod?
    public var timeout: NSNumber?
    public var enableQuic: Bool = false
    public var dataType: String?
    public var responseType: String?
    public var sslVerify: Bool = false
    public var withCredentials: Bool = false
    public var firstIpv4: Bool = false
    public var enableChunked: Bool = false
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniNetworkUploadFileOptionsJSONObject)
@objcMembers
public class UploadFileOptionsJSONObject : NSObject, DCUniModel {
    public var url: String!
    public var filePath: String?
    public var name: String?
    public var files: [UploadFileOptionFiles]?
    public var header: UTSJSONObject?
    public var formData: UTSJSONObject?
    public var timeout: NSNumber?
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
    public static func modelContainerPropertyGenericClass() -> Dictionary<String, Any>? {
        var dict: Dictionary<String, Any> = Dictionary()
        dict["files"] = UploadFileOptionFiles.classForCoder()
        return dict
    }
}
@objc(UTSSDKModulesDCloudUniNetworkDownloadFileOptionsJSONObject)
@objcMembers
public class DownloadFileOptionsJSONObject : NSObject {
    public var url: String!
    public var header: UTSJSONObject?
    public var filePath: String?
    public var timeout: NSNumber?
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
public func requestByJs(_ options: RequestOptionsJSONObject) -> Int {
    var ins = request(RequestOptions(UTSJSONObject([
        "url": options.url,
        "data": options.data,
        "header": options.header,
        "method": options.method,
        "timeout": options.timeout,
        "enableQuic": options.enableQuic,
        "dataType": options.dataType,
        "responseType": options.responseType,
        "sslVerify": options.sslVerify,
        "withCredentials": options.withCredentials,
        "firstIpv4": options.firstIpv4,
        "enableChunked": options.enableChunked,
        "success": {
        (_ option: RequestSuccess<Any>) -> Void in
        options.success?(option)
        },
        "fail": {
        (_ option: RequestFail) -> Void in
        options.fail?(option)
        },
        "complete": {
        (_ option: Any) -> Void in
        options.complete?(option)
        }
    ])), Any.self)
    return UTSBridge.registerJavaScriptClassInstance(RequestTaskByJsProxy(ins))
}
public func uploadFileByJs(_ options: UploadFileOptionsJSONObject) -> Int {
    var ins = uploadFile(UploadFileOptions(UTSJSONObject([
        "url": options.url,
        "filePath": options.filePath,
        "name": options.name,
        "files": options.files,
        "header": options.header,
        "formData": options.formData,
        "timeout": options.timeout,
        "success": {
        (_ result: UploadFileSuccess) -> Void in
        options.success?(result)
        },
        "fail": {
        (_ result: UploadFileFail) -> Void in
        options.fail?(result)
        },
        "complete": {
        (_ result: Any) -> Void in
        options.complete?(result)
        }
    ])))
    return UTSBridge.registerJavaScriptClassInstance(UploadTaskByJsProxy(ins))
}
public func downloadFileByJs(_ options: DownloadFileOptionsJSONObject) -> Int {
    var ins = downloadFile(DownloadFileOptions(UTSJSONObject([
        "url": options.url,
        "header": options.header,
        "filePath": options.filePath,
        "timeout": options.timeout,
        "success": {
        (_ result: DownloadFileSuccess) -> Void in
        options.success?(result)
        },
        "fail": {
        (_ result: DownloadFileFail) -> Void in
        options.fail?(result)
        },
        "complete": {
        (_ result: DownloadFileComplete) -> Void in
        options.complete?(result)
        }
    ])))
    return UTSBridge.registerJavaScriptClassInstance(DownloadTaskByJsProxy(ins))
}
@objc(UTSSDKModulesDCloudUniNetworkDownloadTaskByJsProxy)
@objcMembers
public class DownloadTaskByJsProxy : NSObject {
    public var __instance: DownloadTask
    public init(_ ins: DownloadTask){
        __instance = ins
    }
    public func abortByJs() -> Void {
        return __instance.abort()
    }
    public func onProgressUpdateByJs(_ callback: UTSCallback) -> Void {
        return __instance.onProgressUpdate({
        (result: OnProgressDownloadResult) -> Void in
        callback(result)
        })
    }
}
@objc(UTSSDKModulesDCloudUniNetworkRequestTaskByJsProxy)
@objcMembers
public class RequestTaskByJsProxy : NSObject {
    public var __instance: RequestTask
    public init(_ ins: RequestTask){
        __instance = ins
    }
    public func abortByJs() -> Void {
        return __instance.abort()
    }
    public func onChunkReceivedByJs(_ listener: UTSCallback) -> NSNumber {
        return __instance.onChunkReceived({
        (result: RequestTaskOnChunkReceivedListenerResult) -> Void in
        listener(result)
        })
    }
    public func offChunkReceivedByJs(_ listener: Any?) -> Void {
        return __instance.offChunkReceived(listener)
    }
    public func onHeadersReceivedByJs(_ listener: UTSCallback) -> NSNumber {
        return __instance.onHeadersReceived({
        (result: RequestTaskOnHeadersReceivedListenerResult) -> Void in
        listener(result)
        })
    }
    public func offHeadersReceivedByJs(_ listener: Any?) -> Void {
        return __instance.offHeadersReceived(listener)
    }
}
@objc(UTSSDKModulesDCloudUniNetworkUploadTaskByJsProxy)
@objcMembers
public class UploadTaskByJsProxy : NSObject {
    public var __instance: UploadTask
    public init(_ ins: UploadTask){
        __instance = ins
    }
    public func abortByJs() -> Void {
        return __instance.abort()
    }
    public func onProgressUpdateByJs(_ callback: UTSCallback) -> Void {
        return __instance.onProgressUpdate({
        (result: OnProgressUpdateResult) -> Void in
        callback(result)
        })
    }
}
@objc(UTSSDKModulesDCloudUniNetworkIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniNetworkIndexSwift : NSObject {
    public static func s_requestByJs(_ options: RequestOptionsJSONObject) -> Int {
        return requestByJs(options)
    }
    public static func s_uploadFileByJs(_ options: UploadFileOptionsJSONObject) -> Int {
        return uploadFileByJs(options)
    }
    public static func s_downloadFileByJs(_ options: DownloadFileOptionsJSONObject) -> Int {
        return downloadFileByJs(options)
    }
}
