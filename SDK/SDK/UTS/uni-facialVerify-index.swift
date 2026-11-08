@_implementationOnly import AliyunFaceAuthFacade
import DCloudUTSFoundation
@_implementationOnly import DTFIdentityManager
import Dispatch
import Foundation
public typealias FacialRecognitionVerifyErrorCode = NSNumber
public typealias StartFacialRecognitionVerifyScreenOrientation = String
public protocol IFacialRecognitionVerifyError : IUniError {
    var errCode: FacialRecognitionVerifyErrorCode { get set }
}
@objc(UTSSDKModulesDCloudUniFacialVerifyStartFacialRecognitionVerifySuccess)
@objcMembers
public class StartFacialRecognitionVerifySuccess : NSObject, UTSObject {
    public var errCode: NSNumber!
    public var errSubject: String!
    public var errMsg: String!
    public var cause: SourceError?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "errCode":
                    self.errCode = try! utsSubscriptCheckValue(newValue)
                case "errSubject":
                    self.errSubject = try! utsSubscriptCheckValue(newValue)
                case "errMsg":
                    self.errMsg = try! utsSubscriptCheckValue(newValue)
                case "cause":
                    self.cause = try! utsSubscriptCheckValueIfPresent(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.errCode = obj["errCode"] as! NSNumber
        self.errSubject = obj["errSubject"] as! String
        self.errMsg = obj["errMsg"] as! String
        self.cause = obj["cause"] as! SourceError?
    }
}
public typealias StartFacialRecognitionVerifySuccessCallback = (_ res: StartFacialRecognitionVerifySuccess) -> Void
public typealias StartFacialRecognitionVerifyFailCallback = (_ res: IFacialRecognitionVerifyError) -> Void
public typealias StartFacialRecognitionVerifyCompleteCallback = (_ res: Any) -> Void
@objc(UTSSDKModulesDCloudUniFacialVerifyStartFacialRecognitionVerifyOptions)
@objcMembers
public class StartFacialRecognitionVerifyOptions : NSObject, UTSObject {
    public var certifyId: String!
    public var progressBarColor: String?
    public var screenOrientation: StartFacialRecognitionVerifyScreenOrientation?
    public var success: StartFacialRecognitionVerifySuccessCallback?
    public var fail: StartFacialRecognitionVerifyFailCallback?
    public var complete: StartFacialRecognitionVerifyCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "certifyId":
                    self.certifyId = try! utsSubscriptCheckValue(newValue)
                case "progressBarColor":
                    self.progressBarColor = try! utsSubscriptCheckValueIfPresent(newValue)
                case "screenOrientation":
                    self.screenOrientation = try! utsSubscriptCheckValueIfPresent(newValue)
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
        self.certifyId = obj["certifyId"] as! String
        self.progressBarColor = obj["progressBarColor"] as! String?
        self.screenOrientation = obj["screenOrientation"] as! StartFacialRecognitionVerifyScreenOrientation?
        self.success = obj["success"] as! StartFacialRecognitionVerifySuccessCallback?
        self.fail = obj["fail"] as! StartFacialRecognitionVerifyFailCallback?
        self.complete = obj["complete"] as! StartFacialRecognitionVerifyCompleteCallback?
    }
}
public typealias GetFacialRecognitionMetaInfo = () -> String
public typealias StartFacialRecognitionVerify = (_ faceStyle: StartFacialRecognitionVerifyOptions) -> Void
public var UniError_StartFacialRecognitionVerify = "uni-startFacialRecognitionVerify"
public var FacialRecognitionVerifyUniErrors: Map<NSNumber, String> = Map([
    [
        10001,
        "certifyId 不能为空"
    ],
    [
        10002,
        "当前设备不支持"
    ],
    [
        10010,
        "刷脸异常"
    ],
    [
        10012,
        "网络异常"
    ],
    [
        10011,
        "验证中断"
    ],
    [
        10013,
        "刷脸验证失败"
    ],
    [
        10020,
        "设备设置时间异常"
    ]
])
@objc(UTSSDKModulesDCloudUniFacialVerifyFacialRecognitionVerifyErrorImpl)
@objcMembers
public class FacialRecognitionVerifyErrorImpl : UniError, IFacialRecognitionVerifyError {
    public init(_ errCode: FacialRecognitionVerifyErrorCode, _ causeError: SourceError?){
        super.init()
        self.errSubject = UniError_StartFacialRecognitionVerify
        self.errCode = errCode
        self.errMsg = FacialRecognitionVerifyUniErrors[errCode] ?? ""
        if (causeError != nil) {
            self.cause = causeError as! UTSError
        }
    }
}
public var isLoadService: Bool = false
public var faceAuth: FacialRecognition = FacialRecognition()
public var startFacialRecognitionVerify: StartFacialRecognitionVerify = {
(_ faceStyle: StartFacialRecognitionVerifyOptions) -> Void in
faceAuth.initSDK()
faceAuth.startVerify(faceStyle)
}
public var getFacialRecognitionMetaInfo: GetFacialRecognitionMetaInfo = {
() -> String in
faceAuth.initSDK()
return faceAuth.getMetaInfo()
}
@objc(UTSSDKModulesDCloudUniFacialVerifyFacialRecognition)
@objcMembers
public class FacialRecognition : NSObject {
    public func initSDK() {
        faceInit()
    }
    public func startVerify(_ options: StartFacialRecognitionVerifyOptions) {
        faceStartVerify(options)
    }
    public func getMetaInfo() -> String {
        return faceGetMetaInfo()
    }
    private func faceInit() {
        if (isLoadService == false) {
            isLoadService = true
            AliyunFaceAuthFacade.initSDK()
        }
    }
    private func faceGetMetaInfo() -> String {
        var metaInfo = AliyunFaceAuthFacade.getMetaInfo()
        var meta = JSON.stringify(metaInfo)
        if (meta != nil) {
            return meta!
        } else {
            return ""
        }
    }
    private func faceStartVerify(_ options: StartFacialRecognitionVerifyOptions) {
        if (options.certifyId != nil && options.certifyId.length > 0) {
            var extParams = Map<String, Any>()
            if (options.progressBarColor != nil) {
                var characterSet = CharacterSet(charactersIn: "#")
                var progressBarColor = options.progressBarColor!.trimmingCharacters(in: characterSet)
                extParams.set("ext_params_key_ocr_face_circle_color", progressBarColor)
            }
            DispatchQueue.main.async(execute: {
            () -> Void in
            extParams.set("currentCtr", UTSiOS.getCurrentViewController())
            AliyunFaceAuthFacade.verify(with: options.certifyId, extParams: extParams, onCompletion: {
            (response: ZIMResponse?) -> Void in
            if (response != nil) {
                self.handleResponse(options, response!)
            }
            })
            })
        } else {
            var result = FacialRecognitionVerifyErrorImpl(10001, nil)
            options.fail?(result)
            options.complete?(result)
        }
    }
    private func handleResponse(_ options: StartFacialRecognitionVerifyOptions, _ response: ZIMResponse) {
        var causeError = SourceError()
        causeError.code = NSNumber.from(response.code.rawValue)
        causeError.message = response.retMessageSub ?? ""
        var errorMessage = "刷脸异常"
        var errorCode: NSNumber = 10010
        if (response.code == ZIMResponseCode.ZIMResponseSuccess) {
            errorCode = 0
            errorMessage = "刷脸完成"
        }
        if (response.code == ZIMResponseCode.ZIMInternalError) {
            errorCode = 10010
            errorMessage = "刷脸异常"
        }
        if (response.code == ZIMResponseCode.ZIMInterrupt) {
            errorCode = 10011
            errorMessage = "验证中断"
        }
        if (response.code == ZIMResponseCode.ZIMNetworkfail) {
            errorCode = 10012
            errorMessage = "网络异常"
        }
        if (response.code == ZIMResponseCode.ZIMTIMEError) {
            errorCode = 10020
            errorMessage = "设备设置时间异常"
        }
        if (response.code == ZIMResponseCode.ZIMResponseFail) {
            errorCode = 10013
            errorMessage = "刷脸失败"
        }
        if (errorCode == 0) {
            var result = StartFacialRecognitionVerifySuccess(UTSJSONObject([
                "errSubject": "uni-startFacialRecognitionVerify",
                "errCode": errorCode,
                "errMsg": errorMessage,
                "cause": causeError
            ]))
            options.success?(result)
            options.complete?(result)
        } else {
            var result = FacialRecognitionVerifyErrorImpl(errorCode, causeError)
            options.fail?(result)
            options.complete?(result)
        }
    }
}
@objc(UTSSDKModulesDCloudUniFacialVerifyStartFacialRecognitionVerifyOptionsJSONObject)
@objcMembers
public class StartFacialRecognitionVerifyOptionsJSONObject : NSObject {
    public var certifyId: String!
    public var progressBarColor: String?
    public var screenOrientation: StartFacialRecognitionVerifyScreenOrientation?
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
public func startFacialRecognitionVerifyByJs(_ faceStyle: StartFacialRecognitionVerifyOptionsJSONObject) -> Void {
    return startFacialRecognitionVerify(StartFacialRecognitionVerifyOptions(UTSJSONObject([
        "certifyId": faceStyle.certifyId,
        "progressBarColor": faceStyle.progressBarColor,
        "screenOrientation": faceStyle.screenOrientation,
        "success": {
        (res: StartFacialRecognitionVerifySuccess) -> Void in
        faceStyle.success?(res)
        },
        "fail": {
        (res: IFacialRecognitionVerifyError) -> Void in
        faceStyle.fail?(res)
        },
        "complete": {
        (res: Any) -> Void in
        faceStyle.complete?(res)
        }
    ])))
}
public func getFacialRecognitionMetaInfoByJs() -> String {
    return getFacialRecognitionMetaInfo()
}
@objc(UTSSDKModulesDCloudUniFacialVerifyIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniFacialVerifyIndexSwift : NSObject {
    public static func s_startFacialRecognitionVerifyByJs(_ faceStyle: StartFacialRecognitionVerifyOptionsJSONObject) -> Void {
        return startFacialRecognitionVerifyByJs(faceStyle)
    }
    public static func s_getFacialRecognitionMetaInfoByJs() -> String {
        return getFacialRecognitionMetaInfoByJs()
    }
}
