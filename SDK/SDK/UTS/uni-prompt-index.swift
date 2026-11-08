import DCloudUTSFoundation
import Dispatch
import UIKit
public typealias PromptErrorCode = NSNumber
public protocol IPromptError : IUniError {
    var errCode: PromptErrorCode { get set }
}
@objc(UTSSDKModulesDCloudUniPromptShowToastSuccess)
@objcMembers
public class ShowToastSuccess : NSObject, UTSObject {
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
public typealias ShowToastFail = IPromptError
public typealias ShowToastSuccessCallback = (_ res: ShowToastSuccess) -> Void
public typealias ShowToastFailCallback = (_ res: ShowToastFail) -> Void
public typealias ShowToastCompleteCallback = (_ res: Any) -> Void
public typealias Icon = String
public typealias ShowToastPosition = String
@objc(UTSSDKModulesDCloudUniPromptShowToastOptions)
@objcMembers
public class ShowToastOptions : NSObject, UTSObject {
    public var title: String!
    public var icon: Icon?
    public var image: String?
    public var mask: Bool = false
    public var duration: NSNumber?
    public var position: ShowToastPosition?
    public var success: ShowToastSuccessCallback?
    public var fail: ShowToastFailCallback?
    public var complete: ShowToastCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "title":
                    self.title = try! utsSubscriptCheckValue(newValue)
                case "icon":
                    self.icon = try! utsSubscriptCheckValueIfPresent(newValue)
                case "image":
                    self.image = try! utsSubscriptCheckValueIfPresent(newValue)
                case "mask":
                    self.mask = try! utsSubscriptCheckValue(newValue)
                case "duration":
                    self.duration = try! utsSubscriptCheckValueIfPresent(newValue)
                case "position":
                    self.position = try! utsSubscriptCheckValueIfPresent(newValue)
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
        self.title = obj["title"] as! String
        self.icon = obj["icon"] as! Icon?
        self.image = obj["image"] as! String?
        self.mask = (obj["mask"] as? Bool) ?? false
        self.duration = obj["duration"] as! NSNumber?
        self.position = obj["position"] as! ShowToastPosition?
        self.success = obj["success"] as! ShowToastSuccessCallback?
        self.fail = obj["fail"] as! ShowToastFailCallback?
        self.complete = obj["complete"] as! ShowToastCompleteCallback?
    }
}
public typealias ShowToast = (_ options: ShowToastOptions) -> Void
@objc(UTSSDKModulesDCloudUniPromptHideToastSuccess)
@objcMembers
public class HideToastSuccess : NSObject, UTSObject {
    public var errMsg: String!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "errMsg":
                    self.errMsg = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.errMsg = obj["errMsg"] as! String
    }
}
public typealias HideToastFail = IPromptError
public typealias HideToastSuccessCallback = (_ res: HideToastSuccess) -> Void
public typealias HideToastFailCallback = (_ res: HideToastFail) -> Void
public typealias HideToastCompleteCallback = (_ res: Any) -> Void
@objc(UTSSDKModulesDCloudUniPromptHideToastOptions)
@objcMembers
public class HideToastOptions : NSObject, UTSObject {
    public var allType: Bool = false
    public var success: HideToastSuccessCallback?
    public var fail: HideToastFailCallback?
    public var complete: HideToastCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "allType":
                    self.allType = try! utsSubscriptCheckValue(newValue)
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
        self.allType = (obj["allType"] as? Bool) ?? false
        self.success = obj["success"] as! HideToastSuccessCallback?
        self.fail = obj["fail"] as! HideToastFailCallback?
        self.complete = obj["complete"] as! HideToastCompleteCallback?
    }
}
public typealias HideToast = (_ options: HideToastOptions?) -> Void
@objc(UTSSDKModulesDCloudUniPromptShowLoadingSuccess)
@objcMembers
public class ShowLoadingSuccess : NSObject, UTSObject {
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
public typealias ShowLoadingFail = IPromptError
public typealias ShowLoadingSuccessCallback = (_ res: ShowLoadingSuccess) -> Void
public typealias ShowLoadingFailCallback = (_ res: ShowLoadingFail) -> Void
public typealias ShowLoadingCompleteCallback = (_ res: Any) -> Void
@objc(UTSSDKModulesDCloudUniPromptShowLoadingOptions)
@objcMembers
public class ShowLoadingOptions : NSObject, UTSObject {
    public var title: String!
    public var mask: Bool = false
    public var success: ShowLoadingSuccessCallback?
    public var fail: ShowLoadingFailCallback?
    public var complete: ShowLoadingCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "title":
                    self.title = try! utsSubscriptCheckValue(newValue)
                case "mask":
                    self.mask = try! utsSubscriptCheckValue(newValue)
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
        self.title = obj["title"] as! String
        self.mask = (obj["mask"] as? Bool) ?? false
        self.success = obj["success"] as! ShowLoadingSuccessCallback?
        self.fail = obj["fail"] as! ShowLoadingFailCallback?
        self.complete = obj["complete"] as! ShowLoadingCompleteCallback?
    }
}
public typealias ShowLoading = (_ options: ShowLoadingOptions) -> Void
public typealias HideLoading = () -> Void
@objc(UTSSDKModulesDCloudUniPromptShowModalSuccess)
@objcMembers
public class ShowModalSuccess : NSObject, UTSObject {
    public var confirm: Bool = false
    public var cancel: Bool = false
    public var content: String?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "confirm":
                    self.confirm = try! utsSubscriptCheckValue(newValue)
                case "cancel":
                    self.cancel = try! utsSubscriptCheckValue(newValue)
                case "content":
                    self.content = try! utsSubscriptCheckValueIfPresent(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.confirm = obj["confirm"] as! Bool
        self.cancel = obj["cancel"] as! Bool
        self.content = obj["content"] as! String?
    }
}
public typealias ShowModalFail = IPromptError
public typealias ShowModalSuccessCallback = (_ res: ShowModalSuccess) -> Void
public typealias ShowModalFailCallback = (_ res: ShowModalFail) -> Void
public typealias ShowModalCompleteCallback = (_ res: Any) -> Void
@objc(UTSSDKModulesDCloudUniPromptShowModalOptions)
@objcMembers
public class ShowModalOptions : NSObject, UTSObject {
    public var title: String?
    public var content: String?
    public var showCancel: Bool = true
    public var cancelText: String?
    public var cancelColor: String?
    public var confirmText: String?
    public var confirmColor: String?
    public var editable: Bool = false
    public var placeholderText: String?
    public var success: ShowModalSuccessCallback?
    public var fail: ShowModalFailCallback?
    public var complete: ShowModalCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "title":
                    self.title = try! utsSubscriptCheckValueIfPresent(newValue)
                case "content":
                    self.content = try! utsSubscriptCheckValueIfPresent(newValue)
                case "showCancel":
                    self.showCancel = try! utsSubscriptCheckValue(newValue)
                case "cancelText":
                    self.cancelText = try! utsSubscriptCheckValueIfPresent(newValue)
                case "cancelColor":
                    self.cancelColor = try! utsSubscriptCheckValueIfPresent(newValue)
                case "confirmText":
                    self.confirmText = try! utsSubscriptCheckValueIfPresent(newValue)
                case "confirmColor":
                    self.confirmColor = try! utsSubscriptCheckValueIfPresent(newValue)
                case "editable":
                    self.editable = try! utsSubscriptCheckValue(newValue)
                case "placeholderText":
                    self.placeholderText = try! utsSubscriptCheckValueIfPresent(newValue)
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
        self.title = obj["title"] as! String?
        self.content = obj["content"] as! String?
        self.showCancel = (obj["showCancel"] as? Bool) ?? true
        self.cancelText = obj["cancelText"] as! String?
        self.cancelColor = obj["cancelColor"] as! String?
        self.confirmText = obj["confirmText"] as! String?
        self.confirmColor = obj["confirmColor"] as! String?
        self.editable = (obj["editable"] as? Bool) ?? false
        self.placeholderText = obj["placeholderText"] as! String?
        self.success = obj["success"] as! ShowModalSuccessCallback?
        self.fail = obj["fail"] as! ShowModalFailCallback?
        self.complete = obj["complete"] as! ShowModalCompleteCallback?
    }
}
public typealias ShowModal = (_ options: ShowModalOptions) -> Void
@objc(UTSSDKModulesDCloudUniPromptShowActionSheetSuccess)
@objcMembers
public class ShowActionSheetSuccess : NSObject, UTSObject {
    public var tapIndex: NSNumber!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "tapIndex":
                    self.tapIndex = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.tapIndex = obj["tapIndex"] as! NSNumber
    }
}
@objc(UTSSDKModulesDCloudUniPromptPopover)
@objcMembers
public class Popover : NSObject, UTSObject {
    public var top: NSNumber!
    public var left: NSNumber!
    public var width: NSNumber!
    public var height: NSNumber!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "top":
                    self.top = try! utsSubscriptCheckValue(newValue)
                case "left":
                    self.left = try! utsSubscriptCheckValue(newValue)
                case "width":
                    self.width = try! utsSubscriptCheckValue(newValue)
                case "height":
                    self.height = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.top = obj["top"] as! NSNumber
        self.left = obj["left"] as! NSNumber
        self.width = obj["width"] as! NSNumber
        self.height = obj["height"] as! NSNumber
    }
}
public typealias ShowActionSheetFail = IPromptError
public typealias ShowActionSheetSuccessCallback = (_ res: ShowActionSheetSuccess) -> Void
public typealias ShowActionSheetFailCallback = (_ res: ShowActionSheetFail) -> Void
public typealias ShowActionSheetCompleteCallback = (_ res: Any) -> Void
@objc(UTSSDKModulesDCloudUniPromptShowActionSheetOptions)
@objcMembers
public class ShowActionSheetOptions : NSObject, UTSObject {
    public var title: String?
    public var alertText: String?
    public var itemList: [String]!
    public var itemColor: String?
    public var popover: Popover?
    public var success: ShowActionSheetSuccessCallback?
    public var fail: ShowActionSheetFailCallback?
    public var complete: ShowActionSheetCompleteCallback?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "title":
                    self.title = try! utsSubscriptCheckValueIfPresent(newValue)
                case "alertText":
                    self.alertText = try! utsSubscriptCheckValueIfPresent(newValue)
                case "itemList":
                    self.itemList = try! utsSubscriptCheckValue(newValue)
                case "itemColor":
                    self.itemColor = try! utsSubscriptCheckValueIfPresent(newValue)
                case "popover":
                    self.popover = try! utsSubscriptCheckValueIfPresent(newValue)
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
        self.title = obj["title"] as! String?
        self.alertText = obj["alertText"] as! String?
        self.itemList = obj["itemList"] as! [String]
        self.itemColor = obj["itemColor"] as! String?
        self.popover = obj["popover"] as! Popover?
        self.success = obj["success"] as! ShowActionSheetSuccessCallback?
        self.fail = obj["fail"] as! ShowActionSheetFailCallback?
        self.complete = obj["complete"] as! ShowActionSheetCompleteCallback?
    }
}
public typealias ShowActionSheet = (_ options: ShowActionSheetOptions) -> Void
@objc(UTSSDKModulesDCloudUniPromptPromptErrorImpl)
@objcMembers
public class PromptErrorImpl : UniError, IPromptError {
    public init(_ errCode: PromptErrorCode, _ errMsg: String){
        super.init()
        self.errSubject = "uni-prompt"
        self.errCode = errCode
        self.errMsg = errMsg
    }
}
public func toShowToast(_ options: ShowToastOptions) {
    if (options.title == nil || options.title.length == 0) {
        var res = PromptErrorImpl(1001, "showToast:title is null")
        options.fail?(res)
        options.complete?(res)
    } else {
        var duration: NSNumber = 2.5
        if (options.duration != nil) {
            duration = options.duration! / 1000
        }
        var mask = MCToast.MCToastRespond.default
        if (options.mask == true) {
            mask = MCToast.MCToastRespond.noRespond
        }
        MCToastConfig.shared.background.size = CGSize.init(width: 135, height: 120)
        if (options.position != nil) {
            var interval = Float(UIScreen.main.bounds.height * 0.25)
            var centerPoint: NSNumber = 0.0
            if (options.position == "top") {
                centerPoint = 0 - interval
            } else if (options.position == "center") {
                centerPoint = 0.0
            } else {
                centerPoint = NSNumber(interval)
            }
            UniApplicationToastPresenter.show(text: options.title, offset: CGFloat(centerPoint.toFloat()), duration: CGFloat(duration.toFloat()), mask: options.mask == true)
        } else {
            var successImage = UIImage(named: "uni_uts_toast_success.png")
            var failureImage = UIImage(named: "uni_uts_toast_error.png")
            var bundleUrl = Bundle.main.url(forResource: "uni-prompt", withExtension: "bundle")
            if (bundleUrl != nil) {
                var bundle = Bundle(url: bundleUrl!)
                if (bundle != nil) {
                    var success_img = UIImage(named: "uni_uts_toast_success.png", in: bundle!, compatibleWith: nil)
                    if (success_img != nil) {
                        successImage = success_img
                    }
                    var failure_img = UIImage(named: "uni_uts_toast_error.png", in: bundle!, compatibleWith: nil)
                    if (failure_img != nil) {
                        failureImage = failure_img
                    }
                }
            }
            MCToastConfig.shared.icon.successImage = successImage
            MCToastConfig.shared.icon.failureImage = failureImage
            if (options.image != nil) {
                var imagePath = UTSiOS.getResourcePath(options.image!)
                var image = UIImage(contentsOfFile: imagePath)
                MCToast.showStatus(MCToast.MCToastType.success, text: options.title, iconImage: image, duration: CGFloat(duration.toFloat()), respond: mask)
            } else if (options.icon != nil) {
                if (options.icon == "success") {
                    MCToast.mc_success(options.title, duration: CGFloat(duration.toFloat()), respond: mask)
                } else if (options.icon == "error") {
                    MCToast.mc_failure(options.title, duration: CGFloat(duration.toFloat()), respond: mask)
                } else if (options.icon == "loading") {
                    MCToast.mc_loading(text: options.title, duration: CGFloat(duration.toFloat()), respond: mask)
                } else {
                    MCToast.mc_text(options.title, offset: 0, duration: CGFloat(duration.toFloat()), respond: mask)
                }
            } else {
                MCToast.mc_success(options.title, duration: CGFloat(duration.toFloat()), respond: mask)
            }
        }
        var res = ShowToastSuccess(UTSJSONObject([:]))
        options.success?(res)
        options.complete?(res)
    }
}
public func toHideToast(_ options: HideToastOptions?) {
    do {
        MCToast.mc_remove()
        if (options?.allType == true) {
            UniApplicationToastPresenter.remove()
        }
        var res = HideToastSuccess(UTSJSONObject([
            "errMsg": "hideToast:ok"
        ]))
        options?.success?(res)
        options?.complete?(res)
    }
     catch let e {
        var e = UTSError(e)
        var err = PromptErrorImpl(1001, "hideToast:fail")
        options?.fail?(err)
        options?.complete?(err)
    }
}
public func toShowLoading(_ options: ShowLoadingOptions) {
    var mask = MCToast.MCToastRespond.default
    if (options.mask == true) {
        mask = MCToast.MCToastRespond.noRespond
    }
    MCToastConfig.shared.background.size = CGSize.init(width: 135, height: 120)
    MCToast.mc_loading(text: options.title, respond: mask)
    var res = ShowLoadingSuccess(UTSJSONObject([:]))
    options.success?(res)
    options.complete?(res)
}
public func toHideLoading() {
    MCToast.mc_remove()
}
public func toShowModal(_ options: ShowModalOptions) {
    var title = options.title == nil ? "" : options.title!
    var message = options.content == nil ? "" : options.content!
    var showCancel = options.showCancel == nil ? true : (options.showCancel != false)
    var cancelText = options.cancelText == nil ? "取消" : options.cancelText!
    var confirmText = options.confirmText == nil ? "确定" : options.confirmText!
    var canEidt = options.editable == nil ? false : (options.editable != false)
    var placeholderText = options.placeholderText == nil ? "" : options.placeholderText!
    DispatchQueue.main.async(execute: {
    () -> Void in
    var style: DCAlertViewControllerStyle = canEidt ? DCAlertViewControllerStyle.textViewAlert : DCAlertViewControllerStyle.alert
    var alert = DCAlertView.init(title, message, style, placeholderText)
    if (showCancel) {
        var cancelAction = DCAlertAction.init(title: cancelText, style: DCAlertActionStyle.cancelStyle, handler: {
        (_ action: DCAlertAction) -> Void in
        var inputText = ""
        if (canEidt == true) {
            inputText = alert.textView?.text ?? ""
        }
        var res = ShowModalSuccess(UTSJSONObject([
            "confirm": false,
            "cancel": true,
            "content": inputText
        ]))
        options.success?(res)
        options.complete?(res)
        })
        if (options.cancelColor != nil && options.cancelColor != "") {
            var color = UTSiOS.colorWithString(options.cancelColor!)
            cancelAction.titleColor = color
        }
        alert.addAction(cancelAction)
    }
    var okAction = DCAlertAction.init(title: confirmText, style: DCAlertActionStyle.preferredStyle, handler: {
    (_ action: DCAlertAction) -> Void in
    var inputText = ""
    if (canEidt == true) {
        inputText = alert.textView?.text ?? ""
    }
    var res = ShowModalSuccess(UTSJSONObject([
        "confirm": true,
        "cancel": false,
        "content": inputText
    ]))
    options.success?(res)
    options.complete?(res)
    })
    if (options.confirmColor != nil && options.confirmColor != "") {
        var color = UTSiOS.colorWithString(options.confirmColor!)
        okAction.titleColor = color
    }
    alert.addAction(okAction)
    alert.show()
    })
}
public func actionSheet(_ options: ShowActionSheetOptions) {
    var itemList = options.itemList!
    if (itemList.length < 1) {
        var res = PromptErrorImpl(1001, "showActionSheet:fail parameter error: parameter.itemList should have at least 1 item")
        options.fail?(res)
        options.complete?(res)
        return
    }
    if (options.itemList.count > 6) {
        var res = PromptErrorImpl(1001, "showActionSheet:fail parameter error: itemList should not be large than 6")
        options.fail?(res)
        options.complete?(res)
        return
    }
    DispatchQueue.main.async(execute: {
    () -> Void in
    var supportedInterfaceOrientations: UIInterfaceOrientationMask? = nil
    var actionSheet = DCActionSheetController.init(noticeTitle: options.title ?? "", supportedInterfaceOrientations: supportedInterfaceOrientations)
    itemList.forEach({
    (item: String, index: NSNumber) -> Void in
    var action = DCAlertAction.init(title: item, style: DCAlertActionStyle.defaultStyle, handler: {
    (_ action: DCAlertAction) -> Void in
    var res = ShowActionSheetSuccess(UTSJSONObject([
        "tapIndex": index
    ]))
    options.success?(res)
    options.complete?(res)
    })
    if (options.itemColor != nil) {
        var color = UTSiOS.colorWithString(options.itemColor!)
        action.titleColor = color
    }
    actionSheet.addAction(action)
    })
    var cancelAction = DCAlertAction.init(title: "取消", style: DCAlertActionStyle.cancelStyle, handler: {
    (_ action: DCAlertAction) -> Void in
    var res = PromptErrorImpl(1, "showActionSheet:fail cancel")
    options.fail?(res)
    options.complete?(res)
    })
    if (options.itemColor != nil) {
        var color = UTSiOS.colorWithString(options.itemColor!)
        cancelAction.titleColor = color
    }
    actionSheet.addAction(cancelAction)
    var isPad = UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad
    if (options.popover != nil && isPad == true) {
        var popoverController = actionSheet.popoverPresentationController
        if (popoverController != nil) {
            var sourceView = UTSiOS.getCurrentViewController().view
            if (sourceView != nil) {
                var sourceRect = CGRect(x: options.popover!.left.toDouble(), y: options.popover!.top.toDouble(), width: options.popover!.width.toDouble(), height: options.popover!.height.toDouble())
                if (options.popover!.height == -1) {
                    sourceRect = CGRect(x: sourceView!.bounds.midX, y: sourceView!.bounds.maxY, width: 1.0, height: 1.0)
                }
                popoverController!.sourceView = sourceView
                popoverController!.sourceRect = sourceRect
                popoverController!.permittedArrowDirections = UIPopoverArrowDirection.any
            }
        }
    }
    actionSheet.show()
    })
}
public var showToast: ShowToast = {
(_ options: ShowToastOptions) -> Void in
toShowToast(options)
}
public var hideToast: HideToast = {
(_ options: HideToastOptions?) -> Void in
toHideToast(options)
}
public var showLoading: ShowLoading = {
(_ options: ShowLoadingOptions) -> Void in
toShowLoading(options)
}
public var hideLoading: HideLoading = {
() -> Void in
toHideLoading()
}
public var showModal: ShowModal = {
(_ options: ShowModalOptions) -> Void in
toShowModal(options)
}
public var showActionSheet: ShowActionSheet = {
(_ options: ShowActionSheetOptions) -> Void in
actionSheet(options)
}
@objc(UTSSDKModulesDCloudUniPromptShowToastOptionsJSONObject)
@objcMembers
public class ShowToastOptionsJSONObject : NSObject {
    public var title: String!
    public var icon: Icon?
    public var image: String?
    public var mask: Bool = false
    public var duration: NSNumber?
    public var position: ShowToastPosition?
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniPromptHideToastOptionsJSONObject)
@objcMembers
public class HideToastOptionsJSONObject : NSObject {
    public var allType: Bool = false
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniPromptShowLoadingOptionsJSONObject)
@objcMembers
public class ShowLoadingOptionsJSONObject : NSObject {
    public var title: String!
    public var mask: Bool = false
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniPromptShowModalOptionsJSONObject)
@objcMembers
public class ShowModalOptionsJSONObject : NSObject {
    public var title: String?
    public var content: String?
    public var showCancel: Bool = true
    public var cancelText: String?
    public var cancelColor: String?
    public var confirmText: String?
    public var confirmColor: String?
    public var editable: Bool = false
    public var placeholderText: String?
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniPromptShowActionSheetOptionsJSONObject)
@objcMembers
public class ShowActionSheetOptionsJSONObject : NSObject {
    public var title: String?
    public var alertText: String?
    public var itemList: [String]!
    public var itemColor: String?
    public var popover: Popover?
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
public func showToastByJs(_ options: ShowToastOptionsJSONObject) -> Void {
    return showToast(ShowToastOptions(UTSJSONObject([
        "title": options.title,
        "icon": options.icon,
        "image": options.image,
        "mask": options.mask,
        "duration": options.duration,
        "position": options.position,
        "success": {
        (res: ShowToastSuccess) -> Void in
        options.success?(res)
        },
        "fail": {
        (res: ShowToastFail) -> Void in
        options.fail?(res)
        },
        "complete": {
        (res: Any) -> Void in
        options.complete?(res)
        }
    ])))
}
public func hideToastByJs(_ options: HideToastOptionsJSONObject?) -> Void {
    return hideToast(options != nil ? HideToastOptions(UTSJSONObject([
        "allType": options!.allType,
        "success": {
        (res: HideToastSuccess) -> Void in
        options!.success?(res)
        },
        "fail": {
        (res: HideToastFail) -> Void in
        options!.fail?(res)
        },
        "complete": {
        (res: Any) -> Void in
        options!.complete?(res)
        }
    ])) : nil)
}
public func showLoadingByJs(_ options: ShowLoadingOptionsJSONObject) -> Void {
    return showLoading(ShowLoadingOptions(UTSJSONObject([
        "title": options.title,
        "mask": options.mask,
        "success": {
        (res: ShowLoadingSuccess) -> Void in
        options.success?(res)
        },
        "fail": {
        (res: ShowLoadingFail) -> Void in
        options.fail?(res)
        },
        "complete": {
        (res: Any) -> Void in
        options.complete?(res)
        }
    ])))
}
public func hideLoadingByJs() -> Void {
    return hideLoading()
}
public func showModalByJs(_ options: ShowModalOptionsJSONObject) -> Void {
    return showModal(ShowModalOptions(UTSJSONObject([
        "title": options.title,
        "content": options.content,
        "showCancel": options.showCancel,
        "cancelText": options.cancelText,
        "cancelColor": options.cancelColor,
        "confirmText": options.confirmText,
        "confirmColor": options.confirmColor,
        "editable": options.editable,
        "placeholderText": options.placeholderText,
        "success": {
        (res: ShowModalSuccess) -> Void in
        options.success?(res)
        },
        "fail": {
        (res: ShowModalFail) -> Void in
        options.fail?(res)
        },
        "complete": {
        (res: Any) -> Void in
        options.complete?(res)
        }
    ])))
}
public func showActionSheetByJs(_ options: ShowActionSheetOptionsJSONObject) -> Void {
    return showActionSheet(ShowActionSheetOptions(UTSJSONObject([
        "title": options.title,
        "alertText": options.alertText,
        "itemList": options.itemList,
        "itemColor": options.itemColor,
        "popover": options.popover,
        "success": {
        (res: ShowActionSheetSuccess) -> Void in
        options.success?(res)
        },
        "fail": {
        (res: ShowActionSheetFail) -> Void in
        options.fail?(res)
        },
        "complete": {
        (res: Any) -> Void in
        options.complete?(res)
        }
    ])))
}
@objc(UTSSDKModulesDCloudUniPromptIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniPromptIndexSwift : NSObject {
    public static func s_showToastByJs(_ options: ShowToastOptionsJSONObject) -> Void {
        return showToastByJs(options)
    }
    public static func s_hideToastByJs(_ options: HideToastOptionsJSONObject?) -> Void {
        return hideToastByJs(options)
    }
    public static func s_showLoadingByJs(_ options: ShowLoadingOptionsJSONObject) -> Void {
        return showLoadingByJs(options)
    }
    public static func s_hideLoadingByJs() -> Void {
        return hideLoadingByJs()
    }
    public static func s_showModalByJs(_ options: ShowModalOptionsJSONObject) -> Void {
        return showModalByJs(options)
    }
    public static func s_showActionSheetByJs(_ options: ShowActionSheetOptionsJSONObject) -> Void {
        return showActionSheetByJs(options)
    }
}
