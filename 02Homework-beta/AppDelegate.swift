//
//  AppDelegate.swift
//  02Homework-beta
//
//  Created by albertoc on 6/14/14.
//  Copyright (c) 2014 AC. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var formatter: NSDateFormatter!
  var window: UIWindow?


  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: NSDictionary?) -> Bool {

    formatter = NSDateFormatter()
    formatter.dateStyle = NSDateFormatterStyle.ShortStyle
    formatter.timeStyle = NSDateFormatterStyle.ShortStyle


    let color = UIColor(red: 59.0/255.0, green: 89.0/255.0, blue: 152.0/255.0, alpha: 1.0)
    // let color = UIColor(red: 0.31, green: 0.42, blue: 0.64, alpha: 1.0) // paler
    UINavigationBar.appearance().barTintColor = color
    UINavigationBar.appearance().tintColor = UIColor.whiteColor()
    UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
    
    self.window = UIWindow(frame: UIScreen.mainScreen().bounds)

    // Override point for customization after application launch.

    let nfvc = NewsFeedViewController(nibName: nil, bundle: nil)
    let more = MoreViewController(nibName: nil, bundle: nil)
    let tab = UITabBarController()
    tab.tabBar.translucent = false
    tab.tabBar.barTintColor = UIColor.whiteColor()
    tab.tabBar.tintColor = UIColor(red: 59.0/255.0, green: 89.0/255.0, blue: 152.0/255.0, alpha: 1.0)

    let navFeed = UINavigationController(rootViewController: nfvc)
    navFeed.navigationBar.translucent = false

    let note = NotificationViewController(nibName: nil, bundle: nil)
    let navNote = UINavigationController(rootViewController: note)

    tab.viewControllers = [
      navFeed,
      FriendRequestViewController(nibName: nil, bundle: nil),
      MessageViewController(nibName: nil, bundle: nil),
      navNote,
      more
    ]

    tab.selectedIndex = 3

    self.window!.rootViewController = tab

    self.window!.backgroundColor = UIColor.whiteColor()
    self.window!.makeKeyAndVisible()
    return true
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

