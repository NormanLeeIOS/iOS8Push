//
//  ShareViewController.swift
//  WitmobPush
//
//  Created by 李亚坤 on 15/5/6.
//  Copyright (c) 2015年 李亚坤. All rights reserved.
//

import UIKit
import Social
import MobileCoreServices

class ShareViewController: SLComposeServiceViewController {

    
    override func viewDidLoad() {

        var imageItem = self.extensionContext?.inputItems.first as? NSExtensionItem
        var imageItemProvider = imageItem?.attachments?.first as? NSItemProvider
        
        if (imageItemProvider?.hasItemConformingToTypeIdentifier(kUTTypeURL as String) != nil) {
            imageItemProvider?.loadItemForTypeIdentifier(kUTTypeURL as String, options: nil, completionHandler: { (imageURL, error) in
                // 获取到当前要分享页面的URL
                var urlString = (imageURL as! NSURL).absoluteString
                
            })
        }
    }
    
    override func isContentValid() -> Bool {
        // Do validation of contentText and/or NSExtensionContext attachments here
//        var imageItem = self.extensionContext?.inputItems.first as? NSExtensionItem
//        if (imageItem != nil){
//            return false
//        }
//        var imageItemProvider = imageItem?.attachments?.first as? NSItemProvider
//        if (imageItemProvider != nil){
//            return false
//        }
//        if (imageItemProvider?.hasItemConformingToTypeIdentifier("public.url") != nil && self.contentText != nil) {
//            return true
//        }
        return true
    }

    override func didSelectPost() {
        // This is called after the user selects Post. Do the upload of contentText and/or NSExtensionContext attachments.
    
        // Inform the host that we're done, so it un-blocks its UI. Note: Alternatively you could call super's -didSelectPost, which will similarly complete the extension context.
        
        var imageItem = self.extensionContext?.inputItems.first as? NSExtensionItem
        //完成一些自己的操作 保存，添加 http请求
        var alter = UIAlertController(title: "11", message: "111", preferredStyle: UIAlertControllerStyle.Alert)
        self.presentViewController(alter, animated: true, completion: {
            () -> Void in
        })
        var outputItem = imageItem?.copy() as! NSExtensionItem
        outputItem.attributedContentText = NSAttributedString(string: self.contentText, attributes: nil)
        self.extensionContext!.completeRequestReturningItems([], completionHandler: nil)
    }

    override func configurationItems() -> [AnyObject]! {
        // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
        
        var oneItem = SLComposeSheetConfigurationItem() as SLComposeSheetConfigurationItem
        oneItem.title = "123"
        oneItem.valuePending = false
        oneItem.tapHandler = { () -> Void in
            
        }
        
        return []
    }

}
