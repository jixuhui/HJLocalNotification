//
//  AppDelegate.swift
//  HJLocalNotificationDemo
//
//  Created by jixuhui on 14/11/10.
//  Copyright (c) 2014年 private. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        application.registerUserNotificationSettings(UIUserNotificationSettings(forTypes: UIUserNotificationType.Sound|UIUserNotificationType.Alert|UIUserNotificationType.Badge, categories: nil))
        self.createOneLocalNotification()
        return true
    }
    
    func createOneLocalNotification(){
        let localNotification = UILocalNotification()
        localNotification.fireDate = NSDate(timeIntervalSinceNow: 5);
        localNotification.repeatInterval = NSCalendarUnit.MinuteCalendarUnit
        localNotification.timeZone = NSTimeZone.defaultTimeZone()
        localNotification.soundName = UILocalNotificationDefaultSoundName
        localNotification.alertBody = "实之华之,兹乃兼求,逆风兮,顺风兮,无阻我飞扬!"
        localNotification.applicationIconBadgeNumber = 1
        let infoDic = NSDictionary(object: "name", forKey: "key")
        localNotification.userInfo = infoDic
        
        let app:UIApplication = UIApplication.sharedApplication()
        app.scheduleLocalNotification(localNotification)
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

    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
        let alert = UIAlertView(title: "接收到本地提醒 in app", message: notification.alertBody, delegate: nil, cancelButtonTitle: "确定")
        alert.show()
        application.applicationIconBadgeNumber -= 1
//        if application.applicationIconBadgeNumber>2{
//            let localArr:NSArray = application.scheduledLocalNotifications
//            var localNoti:UILocalNotification?
//            for local in localArr{
//                if (local.valueForKey("key")?.isEqualToString("name") != nil){
//                    application.cancelLocalNotification(notification)
//                    break
//                }
//            }
//        }
    }

}

