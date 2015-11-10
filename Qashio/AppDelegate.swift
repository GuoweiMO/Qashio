//
//  AppDelegate.swift
//  Raketten
//
//  Created by Guowei Mo on 21/07/2015.
//  Copyright (c) 2015 Guowei Mo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var userLoggedIn:Bool!


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        //control the initial viewController
        self.userLoggedIn = self.verifyuserInfo()
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        let storyboard: UIStoryboard = UIStoryboard( name: "Main", bundle: nil)
        var viewController: UIViewController = storyboard.instantiateViewControllerWithIdentifier("Landing") ;
        
        if self.userLoggedIn == true {
            viewController = storyboard.instantiateViewControllerWithIdentifier("mainNav") ;
        }
        self.window!.rootViewController = viewController
        self.window!.makeKeyAndVisible()
        
        return true
    }
    
    func verifyuserInfo() -> Bool{
        var userLoggedIn:Bool = false
        let localData = NSUserDefaults.standardUserDefaults()
        let userName = localData.valueForKey("USER_NAME") as? String
        let userPassword = localData.valueForKey("PASSWORD") as? String
        
        if userName != nil && userPassword != nil {
            //send the user credentials to the server DB
            userLoggedIn = true;
        }
        
        return userLoggedIn
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

