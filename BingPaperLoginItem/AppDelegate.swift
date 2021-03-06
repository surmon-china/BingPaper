//
//  AppDelegate.swift
//  BingPaperLoginItem
//
//  Created by Aspire on 2016-10-07.
//  Copyright © 2016 Peng Jingwen. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        var alreadyRunning = false
        let runningApplications = NSWorkspace.shared().runningApplications;
        for application in runningApplications {
            if application.bundleIdentifier == "com.prettyxw.mac.BingPaper" {
                alreadyRunning = true
            }
        }
        
        if (!alreadyRunning) {
            let path = Bundle.main.bundlePath
            var pathComponents = path.components(separatedBy: "/")
            pathComponents.removeLast(4)
            NSWorkspace.shared().launchApplication(pathComponents.joined(separator: "/"))
        }
        
        NSApp.terminate(nil)
    }
}

