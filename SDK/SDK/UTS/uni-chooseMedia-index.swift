import AVFoundation
import CoreFoundation
import CoreMedia
import DCloudUTSFoundation
import Foundation
import PhotosUI
import UIKit
import UniformTypeIdentifiers
import DCloudUTSExtAPI
public typealias ChooseMediaErrorCode = NSNumber
public protocol IChooseMediaError : IUniError {
    var errCode: ChooseMediaErrorCode { get set }
}
public typealias ChooseMediaFileType = String
@objc(UTSSDKModulesDCloudUniChooseMediaChooseMediaTempFile)
@objcMembers
public class ChooseMediaTempFile : NSObject, UTSObject {
    public var tempFilePath: String!
    public var fileType: ChooseMediaFileType!
    public var size: NSNumber!
    public var byteSize: NSNumber?
    public var duration: NSNumber?
    public var height: NSNumber?
    public var width: NSNumber?
    public var thumbTempFilePath: String?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "tempFilePath":
                    self.tempFilePath = try! utsSubscriptCheckValue(newValue)
                case "fileType":
                    self.fileType = try! utsSubscriptCheckValue(newValue)
                case "size":
                    self.size = try! utsSubscriptCheckValue(newValue)
                case "byteSize":
                    self.byteSize = try! utsSubscriptCheckValueIfPresent(newValue)
                case "duration":
                    self.duration = try! utsSubscriptCheckValueIfPresent(newValue)
                case "height":
                    self.height = try! utsSubscriptCheckValueIfPresent(newValue)
                case "width":
                    self.width = try! utsSubscriptCheckValueIfPresent(newValue)
                case "thumbTempFilePath":
                    self.thumbTempFilePath = try! utsSubscriptCheckValueIfPresent(newValue)
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
        self.fileType = obj["fileType"] as! ChooseMediaFileType
        self.size = obj["size"] as! NSNumber
        self.byteSize = obj["byteSize"] as! NSNumber?
        self.duration = obj["duration"] as! NSNumber?
        self.height = obj["height"] as! NSNumber?
        self.width = obj["width"] as! NSNumber?
        self.thumbTempFilePath = obj["thumbTempFilePath"] as! String?
    }
}
@objc(UTSSDKModulesDCloudUniChooseMediaChooseMediaSuccess)
@objcMembers
public class ChooseMediaSuccess : NSObject, UTSObject {
    public var tempFiles: [ChooseMediaTempFile]!
    public var type: String!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "tempFiles":
                    self.tempFiles = try! utsSubscriptCheckValue(newValue)
                case "type":
                    self.type = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.tempFiles = obj["tempFiles"] as! [ChooseMediaTempFile]
        self.type = obj["type"] as! String
    }
}
public typealias ChooseMediaFail = IChooseMediaError
public typealias ChooseMediaSuccessCallback = (_ callback: ChooseMediaSuccess) -> Void
public typealias ChooseMediaFailCallback = (_ callback: ChooseMediaFail) -> Void
public typealias ChooseMediaCompleteCallback = (_ callback: Any) -> Void
public typealias ChooseMediaPageOrientation = String
@objc(UTSSDKModulesDCloudUniChooseMediaChooseMediaOptions)
@objcMembers
public class ChooseMediaOptions : NSObject, UTSObject {
    public var pageOrientation: ChooseMediaPageOrientation?
    public var count: NSNumber?
    public var mediaType: [String]?
    public var sourceType: [String]?
    public var maxDuration: NSNumber?
    public var camera: String?
    public var success: ChooseMediaSuccessCallback?
    public var fail: ChooseMediaFailCallback?
    public var complete: ChooseMediaCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "pageOrientation":
                    self.pageOrientation = try! utsSubscriptCheckValueIfPresent(newValue)
                case "count":
                    self.count = try! utsSubscriptCheckValueIfPresent(newValue)
                case "mediaType":
                    self.mediaType = try! utsSubscriptCheckValueIfPresent(newValue)
                case "sourceType":
                    self.sourceType = try! utsSubscriptCheckValueIfPresent(newValue)
                case "maxDuration":
                    self.maxDuration = try! utsSubscriptCheckValueIfPresent(newValue)
                case "camera":
                    self.camera = try! utsSubscriptCheckValueIfPresent(newValue)
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
        self.pageOrientation = obj["pageOrientation"] as! ChooseMediaPageOrientation?
        self.count = obj["count"] as! NSNumber?
        self.mediaType = obj["mediaType"] as! [String]?
        self.sourceType = obj["sourceType"] as! [String]?
        self.maxDuration = obj["maxDuration"] as! NSNumber?
        self.camera = obj["camera"] as! String?
        self.success = obj["success"] as! ChooseMediaSuccessCallback?
        self.fail = obj["fail"] as! ChooseMediaFailCallback?
        self.complete = obj["complete"] as! ChooseMediaCompleteCallback?
    }
}
public typealias ChooseMedia = (_ options: ChooseMediaOptions) -> Void
public var UniError_ChooseMedia = "uni-chooseMedia"
public var ChooseMediaUniErrors: Map<NSNumber, String> = Map([
    [
        1101001,
        "user cancel"
    ],
    [
        1101005,
        "No Permission"
    ],
    [
        1101006,
        "save error"
    ],
    [
        1101008,
        "camera error"
    ],
    [
        1101010,
        "unexpect error"
    ]
])
@objc(UTSSDKModulesDCloudUniChooseMediaChooseMediaErrorImpl)
@objcMembers
public class ChooseMediaErrorImpl : UniError, IChooseMediaError {
    public init(_ errCode: ChooseMediaErrorCode, _ uniErrorSubject: String = "uni-chooseMedia"){
        super.init()
        self.errSubject = uniErrorSubject
        self.errCode = errCode
        self.errMsg = ChooseMediaUniErrors.get(errCode) ?? ""
    }
}
public var imagePickerManager: ChooseMediaImagePickerManager? = nil
public var chooseMedia: ChooseMedia = {
(_ options: ChooseMediaOptions) -> Void in
chooseMediaWithSourceType(options, {
(_ index: NSNumber) -> Void in
if (index == 0) {
    chooseMediaRequestCameraPermission({
    (_ status: NSNumber) -> Void in
    var mediaType: Array<String> = (options.mediaType != nil && options.mediaType!.length > 0) ? options.mediaType! : [
        "image",
        "video"
    ]
    if (status == 1) {
        if (mediaType.indexOf("video") >= 0) {
            chooseMediaRequestMicrophonePermission({
            (_ status: NSNumber) -> Void in
            if (status == 1) {
                chooseMediaWithCamera(options)
            } else {
                var error = ChooseMediaErrorImpl(1101005, UniError_ChooseMedia)
                options.fail?(error)
                options.complete?(error)
            }
            })
        } else {
            chooseMediaWithCamera(options)
        }
    } else {
        var error = ChooseMediaErrorImpl(1101005, UniError_ChooseMedia)
        options.fail?(error)
        options.complete?(error)
    }
    })
} else if (index == 1) {
    imagePickerManager = ChooseMediaImagePickerManager(options)
    imagePickerManager!.chooseMediaWithAlbum()
}
})
}
public func chooseMediaWithCamera(_ options: ChooseMediaOptions) {
    imagePickerManager = ChooseMediaImagePickerManager(options)
    imagePickerManager!.chooseMediaWithCamera()
}
public func chooseMediaRequestCameraPermission(_ completion: @escaping (_ status: NSNumber) -> Void) {
    var cameraAuthorized = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
    if (cameraAuthorized == AVAuthorizationStatus.authorized) {
        completion(1)
    } else if (cameraAuthorized == AVAuthorizationStatus.notDetermined) {
        AVCaptureDevice.requestAccess(for: AVMediaType.video, completionHandler: {
        (result: Bool) -> Void in
        if (result) {
            completion(1)
        } else {
            completion(0)
        }
        })
    } else {
        completion(0)
    }
}
public func chooseMediaRequestMicrophonePermission(_ completion: @escaping (_ status: NSNumber) -> Void) {
    var authorized = AVCaptureDevice.authorizationStatus(for: AVMediaType.audio)
    if (authorized == AVAuthorizationStatus.authorized) {
        completion(1)
    } else if (authorized == AVAuthorizationStatus.notDetermined) {
        AVCaptureDevice.requestAccess(for: AVMediaType.audio, completionHandler: {
        (result: Bool) -> Void in
        if (result) {
            completion(1)
        } else {
            completion(0)
        }
        })
    } else {
        completion(0)
    }
}
public func chooseMediaWithSourceType(_ options: ChooseMediaOptions, _ chooseSourceCallback: @escaping (_ index: NSNumber) -> Void) {
    var sourceType: Array<String> = (options.sourceType != nil && options.sourceType!.length > 0) ? options.sourceType! : [
        "album",
        "camera"
    ]
    if (sourceType.length == 1) {
        if (sourceType.indexOf("camera") >= 0) {
            chooseSourceCallback(0)
        } else if (sourceType.indexOf("album") >= 0) {
            chooseSourceCallback(1)
        }
    } else if (sourceType.length == 2) {
        DCloudUTSExtAPI.showActionSheet(ShowActionSheetOptions(UTSJSONObject([
            "itemList": [
                "拍摄",
                "从相册选择"
            ],
            "success": {
            (e: ShowActionSheetSuccess) -> Void in
            chooseSourceCallback(e.tapIndex)
            },
            "fail": {
            (e: ShowActionSheetFail) -> Void in
            var error = ChooseMediaErrorImpl(1101001, UniError_ChooseMedia)
            options.fail?(error)
            options.complete?(error)
            }
        ])))
    }
}
@objc(UTSSDKModulesDCloudUniChooseMediaChooseMediaUtil)
@objcMembers
public class ChooseMediaUtil : NSObject {
    public static func createFilePath(_ fileName: String) -> String {
        var mediaCachePath = UTSiOS.getMediaCacheDir() + "/"
        var isCreateSuccess = true
        if (FileManager.default.fileExists(atPath: mediaCachePath) == false) {
            do {
                try FileManager.default.createDirectory(atPath: mediaCachePath, withIntermediateDirectories: true, attributes: nil)
                isCreateSuccess = true
            }
             catch let e {
                var e = UTSError(e)
                isCreateSuccess = false
            }
        }
        return isCreateSuccess == true ? mediaCachePath + fileName : ""
    }
    public static func saveImage(_ image: UIImage, _ path: String) -> Bool {
        var imageData = image.jpegData(compressionQuality: 1.0)
        var isSuccess = false
        if (imageData != nil) {
            var fileUrl = URL(fileURLWithPath: path)
            do {
                try imageData!.write(to: fileUrl)
                isSuccess = true
            }
             catch let e {}
        }
        return isSuccess
    }
    public static func getFristFrameWithVideo(_ mediaUrl: URL) -> UIImage? {
        var videoAsset = AVURLAsset(url: mediaUrl)
        var imageGenerator = AVAssetImageGenerator(asset: videoAsset)
        imageGenerator.appliesPreferredTrackTransform = true
        var image: UIImage? = nil
        do {
            var generatedCGImage: CGImage? = try imageGenerator.copyCGImage(at: CMTime.zero, actualTime: nil)
            if (generatedCGImage != nil) {
                image = UIImage(cgImage: generatedCGImage!)
            }
        }
         catch let e {}
        return image
    }
    public static func getVideoInfo(_ mediaUrl: URL) -> Map<String, Any> {
        var asset = AVURLAsset(url: mediaUrl)
        var track = asset.tracks(withMediaType: AVMediaType.video).first
        var width: NSNumber = 0
        var height: NSNumber = 0
        var duration: NSNumber = 0
        if (track != nil) {
            var videoSize: CGSize = track!.naturalSize
            width = NSNumber(value: videoSize.width)
            height = NSNumber(value: videoSize.height)
            var seconds = CMTimeGetSeconds(asset.duration)
            var formatter = NumberFormatter()
            formatter.numberStyle = NumberFormatter.Style.decimal
            formatter.maximumFractionDigits = 3
            var durationString = formatter.string(from: NSNumber(value: seconds))
            var number = formatter.number(from: durationString ?? "")
            if (number != nil) {
                duration = number!
            }
        }
        var videoInfo = Map<String, Any>()
        videoInfo.set("width", width)
        videoInfo.set("height", height)
        videoInfo.set("duration", duration)
        return videoInfo
    }
    public static func getTempFileWithImage(_ image: UIImage) -> ChooseMediaTempFile? {
        var currentTime = """
\(Date.now())\(Math.floor(Math.random() * 10000))
"""
        var fileName = currentTime.toString() + ".jpg"
        var tempFilePath = ChooseMediaUtil.createFilePath(fileName)
        var isSaveSuc: Bool = ChooseMediaUtil.saveImage(image, tempFilePath)
        if (isSaveSuc) {
            var fileType = "image"
            if (image.cgImage != nil) {
                var bytesPerRow = image.cgImage!.bytesPerRow
                var height = image.cgImage!.height
                var bytes = bytesPerRow * height
                var fileUrl = URL(fileURLWithPath: tempFilePath)
                var mediaTempFile = ChooseMediaTempFile(UTSJSONObject([
                    "tempFilePath": fileUrl.absoluteString,
                    "fileType": fileType,
                    "size": NSNumber.from(bytes)
                ]))
                return mediaTempFile
            }
        }
        return nil
    }
    public static func getTempFileWithVideo(_ mediaUrl: URL) -> ChooseMediaTempFile? {
        var currentTime = """
\(Date.now())\(Math.floor(Math.random() * 10000))
"""
        var fileName = currentTime.toString() + ".mp4"
        var tempFilePath = ChooseMediaUtil.createFilePath(fileName)
        var fileUrl: URL = URL(fileURLWithPath: tempFilePath)
        var byteSize: NSNumber = 0
        do {
            try FileManager.default.copyItem(at: mediaUrl, to: fileUrl)
            var fileAttributes = try FileManager.default.attributesOfItem(atPath: tempFilePath)
            byteSize = fileAttributes[FileAttributeKey.size] as! NSNumber
        }
         catch let e {}
        var exist = FileManager.default.fileExists(atPath: tempFilePath)
        if (exist) {
            var formatter = NumberFormatter()
            formatter.numberStyle = NumberFormatter.Style.decimal
            formatter.maximumFractionDigits = 3
            var size: NSNumber = byteSize / 1024.0
            var sizeString = formatter.string(from: size)
            var sizeKb = formatter.number(from: sizeString ?? "") ?? 0
            var videoInfo = ChooseMediaUtil.getVideoInfo(fileUrl)
            var coverImage = ChooseMediaUtil.getFristFrameWithVideo(fileUrl)
            var thumbTempFilePath = ""
            if (coverImage != nil) {
                var fileName = currentTime.toString() + ".jpg"
                var coverImageFilePath = ChooseMediaUtil.createFilePath(fileName)
                var isSaveSuc: Bool = ChooseMediaUtil.saveImage(coverImage!, coverImageFilePath)
                if (isSaveSuc) {
                    var coverImageFileUrl = URL(fileURLWithPath: coverImageFilePath)
                    thumbTempFilePath = coverImageFileUrl.absoluteString
                }
            }
            var fileType = "video"
            var mediaTempFile = ChooseMediaTempFile(UTSJSONObject([
                "tempFilePath": fileUrl.absoluteString,
                "fileType": fileType,
                "size": sizeKb,
                "byteSize": byteSize,
                "duration": videoInfo.get("duration"),
                "width": videoInfo.get("width"),
                "height": videoInfo.get("height"),
                "thumbTempFilePath": thumbTempFilePath
            ]))
            return mediaTempFile
        }
        return nil
    }
}
@objc(UTSSDKModulesDCloudUniChooseMediaChooseMediaImagePickerManager)
@objcMembers
public class ChooseMediaImagePickerManager : NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    private var options: ChooseMediaOptions
    @available(iOS 14.0, *)
    private static var phPickerManager: ChooseMediaPHPickerManager? = nil
    public init(_ options: ChooseMediaOptions){
        self.options = options
    }
    public func chooseMediaWithCamera() {
        if (UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera)) {
            var cameraDevice: UIImagePickerController.CameraDevice = (self.options.camera != nil && self.options.camera == "front") ? UIImagePickerController.CameraDevice.front : UIImagePickerController.CameraDevice.rear
            if (UIImagePickerController.isCameraDeviceAvailable(cameraDevice)) {
                DispatchQueue.main.async(execute: {
                () -> Void in
                var pickerController = UIImagePickerController()
                pickerController.delegate = self
                pickerController.sourceType = UIImagePickerController.SourceType.camera
                pickerController.mediaTypes = self.getMediaTypes(self.options.mediaType)
                pickerController.cameraDevice = cameraDevice
                var duration: NSNumber = 10
                if (self.options.maxDuration != nil && self.options.maxDuration! > 0) {
                    if (self.options.maxDuration! > 30) {
                        duration = 30
                    } else if (self.options.maxDuration! < 3) {
                        duration = 3
                    } else {
                        duration = self.options.maxDuration!
                    }
                }
                pickerController.videoMaximumDuration = duration.toDouble()
                UTSiOS.getCurrentViewController().present(pickerController, animated: true, completion: nil)
                })
                return
            }
        }
        var error = ChooseMediaErrorImpl(1101008, UniError_ChooseMedia)
        self.options.fail?(error)
        self.options.complete?(error)
    }
    public func chooseMediaWithAlbum() {
        if #available(iOS 14.0, *) {
            ChooseMediaImagePickerManager.phPickerManager = ChooseMediaPHPickerManager(self.options)
            ChooseMediaImagePickerManager.phPickerManager!.chooseMediaWithAlbum()
        } else {
            DispatchQueue.main.async(execute: {
            () -> Void in
            var pickerController = UIImagePickerController()
            pickerController.delegate = self
            pickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
            pickerController.mediaTypes = self.getMediaTypes(self.options.mediaType)
            pickerController.videoExportPreset = AVAssetExportPresetPassthrough
            UTSiOS.getCurrentViewController().present(pickerController, animated: true, completion: nil)
            })
        }
    }
    public func getMediaTypes(_ types: [String]?) -> [String] {
        var mediaType: Array<String> = (types != nil && types!.length > 0) ? types! : [
            "image",
            "video"
        ]
        var results: [String] = []
        if (mediaType.includes("image")) {
            results.push("public.image")
        }
        if (mediaType.includes("video")) {
            results.push("public.movie")
        }
        return results
    }
    public func dismiss(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
        picker.delegate = nil
    }
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: Map<UIImagePickerController.InfoKey, Any>) {
        var mediaType: String = info[UIImagePickerController.InfoKey.mediaType] as! String
        if (mediaType == "public.image") {
            var originalImage: UIImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            var mediaTempFile: ChooseMediaTempFile? = ChooseMediaUtil.getTempFileWithImage(originalImage)
            if (mediaTempFile != nil) {
                var tempFiles = [
                    mediaTempFile as! ChooseMediaTempFile
                ] as! [ChooseMediaTempFile]
                DispatchQueue.main.async(execute: {
                () -> Void in
                self.dismiss(picker)
                var success = ChooseMediaSuccess(UTSJSONObject([
                    "tempFiles": tempFiles,
                    "type": "image"
                ]))
                self.options.success?(success)
                self.options.complete?(success)
                })
                return
            }
            DispatchQueue.main.async(execute: {
            () -> Void in
            self.dismiss(picker)
            var error = ChooseMediaErrorImpl(1101006, UniError_ChooseMedia)
            self.options.fail?(error)
            self.options.complete?(error)
            })
        } else if (mediaType == "public.movie") {
            var mediaUrl: URL = info[UIImagePickerController.InfoKey.mediaURL] as! URL
            var mediaTempFile: ChooseMediaTempFile? = ChooseMediaUtil.getTempFileWithVideo(mediaUrl)
            if (mediaTempFile != nil) {
                var tempFiles = [
                    mediaTempFile as! ChooseMediaTempFile
                ] as! [ChooseMediaTempFile]
                DispatchQueue.main.async(execute: {
                () -> Void in
                self.dismiss(picker)
                var success = ChooseMediaSuccess(UTSJSONObject([
                    "tempFiles": tempFiles,
                    "type": "video"
                ]))
                self.options.success?(success)
                self.options.complete?(success)
                })
                return
            }
            DispatchQueue.main.async(execute: {
            () -> Void in
            self.dismiss(picker)
            var error = ChooseMediaErrorImpl(1101006, UniError_ChooseMedia)
            self.options.fail?(error)
            self.options.complete?(error)
            })
        }
    }
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        DispatchQueue.main.async(execute: {
        () -> Void in
        self.dismiss(picker)
        var error = ChooseMediaErrorImpl(1101001, UniError_ChooseMedia)
        self.options.fail?(error)
        self.options.complete?(error)
        })
    }
}
@available(iOS 14.0, *)
@objc(UTSSDKModulesDCloudUniChooseMediaChooseMediaPHPickerManager)
@objcMembers
public class ChooseMediaPHPickerManager : NSObject, PHPickerViewControllerDelegate, UIAdaptivePresentationControllerDelegate {
    private var options: ChooseMediaOptions
    private var isProcessing: Bool = false
    private var isSettled: Bool = false
    public init(_ options: ChooseMediaOptions){
        self.options = options
    }
    public func finishSuccess(_ success: ChooseMediaSuccess) {
        if (self.isSettled) {
            return
        }
        self.isSettled = true
        self.options.success?(success)
        self.options.complete?(success)
    }
    public func finishFail() {
        if (self.isSettled) {
            return
        }
        self.isSettled = true
        var error = ChooseMediaErrorImpl(1101001, UniError_ChooseMedia)
        self.options.fail?(error)
        self.options.complete?(error)
    }
    public func chooseMediaWithAlbum() {
        DispatchQueue.main.async(execute: {
        () -> Void in
        var pickerConfiguration = PHPickerConfiguration()
        if (self.options.count != nil) {
            pickerConfiguration.selectionLimit = self.options.count!.intValue
        } else {
            pickerConfiguration.selectionLimit = 9
        }
        var filter: PHPickerFilter? = self.getMediaTypes(self.options.mediaType)
        if (filter != nil) {
            pickerConfiguration.filter = filter!
        }
        var pickerController = PHPickerViewController(configuration: pickerConfiguration)
        pickerController.delegate = self
        if (pickerController.presentationController != nil) {
            pickerController.presentationController!.delegate = self
        }
        UTSiOS.getCurrentViewController().present(pickerController, animated: true, completion: nil)
        })
    }
    public func getMediaTypes(_ types: [String]?) -> PHPickerFilter? {
        var mediaType: Array<String> = (types != nil && types!.length > 0) ? types! : [
            "image",
            "video"
        ]
        if (mediaType.includes("image") == true && mediaType.includes("video") == false) {
            return PHPickerFilter.images
        } else if (mediaType.includes("image") == false && mediaType.includes("video") == true) {
            return PHPickerFilter.videos
        }
        return nil
    }
    public func getFileType(_ types: [String]) -> String {
        if (types.includes("image") && types.includes("video")) {
            return "mix"
        } else if (types.includes("image") && types.includes("video") == false) {
            return "image"
        } else if (types.includes("video") && types.includes("image") == false) {
            return "video"
        }
        return "mix"
    }
    public func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        if (self.isSettled) {
            return
        }
        if (results.length > 0) {
            if (self.isProcessing) {
                return
            }
            self.isProcessing = true
            var tempFiles: [ChooseMediaTempFile] = []
            var group = DispatchGroup()
            var types: [String] = []
            do {
                var i: NSNumber = 0
                while(i < results.length){
                    group.enter()
                    var result: PHPickerResult = results[i] as! PHPickerResult
                    var itemProvider: NSItemProvider = result.itemProvider
                    if (itemProvider.hasItemConformingToTypeIdentifier(UTType.image.identifier)) {
                        if (itemProvider.canLoadObject(ofClass: UIImage.self)) {
                            itemProvider.loadObject(ofClass: UIImage.self, completionHandler: {
                            (object, error) -> Void in
                            if ((UTSiOS.instanceof(object, UIImage.self)) && error == nil) {
                                var mediaTempFile: ChooseMediaTempFile? = ChooseMediaUtil.getTempFileWithImage(object as! UIImage)
                                if (mediaTempFile != nil) {
                                    if (types.includes("image") == false) {
                                        types.push("image")
                                    }
                                    tempFiles.push(mediaTempFile!)
                                }
                            }
                            group.leave()
                            })
                        } else {
                            group.leave()
                        }
                    } else if (itemProvider.hasItemConformingToTypeIdentifier(UTType.movie.identifier)) {
                        itemProvider.loadFileRepresentation(forTypeIdentifier: UTType.movie.identifier, completionHandler: {
                        (url, error) -> Void in
                        if (url != nil) {
                            var mediaTempFile: ChooseMediaTempFile? = ChooseMediaUtil.getTempFileWithVideo(url!)
                            if (mediaTempFile != nil) {
                                if (types.includes("video") == false) {
                                    types.push("video")
                                }
                                tempFiles.push(mediaTempFile!)
                            }
                        }
                        group.leave()
                        })
                    } else {
                        group.leave()
                    }
                    i++
                }
            }
            group.notify(queue: DispatchQueue.main, execute: {
            () -> Void in
            if (self.isSettled) {
                return
            }
            self.dismiss(picker)
            var success = ChooseMediaSuccess(UTSJSONObject([
                "tempFiles": tempFiles,
                "type": self.getFileType(types)
            ]))
            self.finishSuccess(success)
            })
        } else {
            self.finishFail()
            DispatchQueue.main.async(execute: {
            () -> Void in
            self.dismiss(picker)
            })
        }
    }
    public func dismiss(_ picker: PHPickerViewController) {
        picker.delegate = nil
        if (picker.presentationController != nil) {
            picker.presentationController!.delegate = nil
        }
        picker.dismiss(animated: true, completion: nil)
    }
    public func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        self.finishFail()
    }
}
@objc(UTSSDKModulesDCloudUniChooseMediaChooseMediaOptionsJSONObject)
@objcMembers
public class ChooseMediaOptionsJSONObject : NSObject {
    public var pageOrientation: ChooseMediaPageOrientation?
    public var count: NSNumber?
    public var mediaType: [String]?
    public var sourceType: [String]?
    public var maxDuration: NSNumber?
    public var camera: String?
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
public func chooseMediaByJs(_ options: ChooseMediaOptionsJSONObject) -> Void {
    return chooseMedia(ChooseMediaOptions(UTSJSONObject([
        "pageOrientation": options.pageOrientation,
        "count": options.count,
        "mediaType": options.mediaType,
        "sourceType": options.sourceType,
        "maxDuration": options.maxDuration,
        "camera": options.camera,
        "success": {
        (callback: ChooseMediaSuccess) -> Void in
        options.success?(callback)
        },
        "fail": {
        (callback: ChooseMediaFail) -> Void in
        options.fail?(callback)
        },
        "complete": {
        (callback: Any) -> Void in
        options.complete?(callback)
        }
    ])))
}
@objc(UTSSDKModulesDCloudUniChooseMediaIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniChooseMediaIndexSwift : NSObject {
    public static func s_chooseMediaByJs(_ options: ChooseMediaOptionsJSONObject) -> Void {
        return chooseMediaByJs(options)
    }
}
