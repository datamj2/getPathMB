//
//  AppDelegate.swift
//  getPathMB
//
//  Created by mj on 11/13/17.
//  Copyright © 2017 mj. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    
    @IBOutlet weak var filename_field: NSTextField!
    
    var path = "";
    var statusBar = NSStatusBar.systemStatusBar()
    var statusBarItem : NSStatusItem = NSStatusItem()
    var menu: NSMenu = NSMenu()
    var menuItem : NSMenuItem = NSMenuItem()
    var menuItem2 : NSMenuItem = NSMenuItem()
    var menuItem3 : NSMenuItem = NSMenuItem()
    
    override func awakeFromNib() {
        
        //Add statusBarItem
        statusBarItem = statusBar.statusItemWithLength(-1)
        statusBarItem.menu = menu
        statusBarItem.title = "getPath"
        
        //Add menuItem to menu
        menuItem.title = "GetWindow"
        menuItem.action = Selector("setWindowVisible:")
        menuItem.keyEquivalent = ""
        menu.addItem(menuItem)
        
        //        menuItem2.title = "Reset"
        //        menuItem2.action = Selector("resetButtonPresses:")
        //        menu.addItem(menuItem2)
        
        menuItem3.title = "Quit"
        //        menuItem3.action = Selector("applicationWillTerminate:")
        menuItem3.action = Selector("terminate:")
        menu.addItem(menuItem3)
    }


    @IBAction func browseFile(sender: AnyObject) {
        
        let dialog = NSOpenPanel();
        
        dialog.title                   = "Choose a file or folder";
        dialog.showsResizeIndicator    = true;
        dialog.showsHiddenFiles        = false;
        dialog.canChooseDirectories    = true;
        dialog.canCreateDirectories    = true;
        dialog.allowsMultipleSelection = false;
        //        dialog.allowedFileTypes        = ["txt", "pdf"];
        
        if (dialog.runModal() == NSModalResponseOK) {
            let result = dialog.URL // Pathname of the file
            
            if (result != nil) {
//                let path = result!.path!
                path = result!.path!
                print(path)
                filename_field.stringValue = path
//                filename_field.stringValue = "hey!"
            }
        } else {
            // User clicked on "Cancel"
            filename_field.stringValue = ""
            return
        }

    }

    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        //        window.backgroundColor = NSColor(red: 0.12, green: 0.12, blue: 0.12, alpha: 1)
                self.window!.orderOut(self)
    }

    func setWindowVisible(sender: AnyObject){
        self.window!.orderFront(self)
    }
    
//    func applicationDidFinishLaunching(aNotification: NSNotification) {
//        // Insert code here to initialize your application
//    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

