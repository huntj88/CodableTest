//
//  AppDelegate.swift
//  codableTest
//
//  Created by James Hunt on 6/22/18.
//  Copyright © 2018 James Hunt. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        //DoStuff().start()
        DoTemplateStuff().doStuff()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

