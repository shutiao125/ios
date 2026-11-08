import DCloudUTSFoundation
public typealias ArrayBufferToBase64 = (_ arrayBuffer: ArrayBuffer) -> String
public var arrayBufferToBase64: ArrayBufferToBase64 = {
(_ arrayBuffer: ArrayBuffer) -> String in
var data = arrayBuffer.toData()
return data.base64EncodedString()
}
public func arrayBufferToBase64ByJs(_ arrayBuffer: ArrayBuffer) -> String {
    return arrayBufferToBase64(arrayBuffer)
}
@objc(UTSSDKModulesDCloudUniArrayBufferToBase64IndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniArrayBufferToBase64IndexSwift : NSObject {
    public static func s_arrayBufferToBase64ByJs(_ arrayBuffer: ArrayBuffer) -> String {
        return arrayBufferToBase64ByJs(arrayBuffer)
    }
}
