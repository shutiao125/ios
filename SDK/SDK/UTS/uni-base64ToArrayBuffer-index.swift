import DCloudUTSFoundation
import Foundation
public typealias Base64ToArrayBuffer = (_ base64: String) -> ArrayBuffer
public var base64ToArrayBuffer: Base64ToArrayBuffer = {
(_ base64: String) -> ArrayBuffer in
var data = Data(base64Encoded: base64)
if (data != nil) {
    return ArrayBuffer.fromData(data!)
} else {
    var buffer = ArrayBuffer(base64.length)
    return buffer
}
}
public func base64ToArrayBufferByJs(_ base64: String) -> ArrayBuffer {
    return base64ToArrayBuffer(base64)
}
@objc(UTSSDKModulesDCloudUniBase64ToArrayBufferIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniBase64ToArrayBufferIndexSwift : NSObject {
    public static func s_base64ToArrayBufferByJs(_ base64: String) -> ArrayBuffer {
        return base64ToArrayBufferByJs(base64)
    }
}
