//
//  AppDelegate.swift
//  VideoPlayer
//
//  Created by Ron Yi on 2019/1/16.
//  Copyright © 2019 Ron Yi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white

        let rootViewController = ViewController()

        if let window = self.window {

            window.rootViewController = rootViewController

        }

//        let navigationController = UINavigationController(rootViewController: ViewController())
//        window?.rootViewController = navigationController

//        let homeViewController = UIViewController()
//        homeViewController.view.backgroundColor = .yellow
//        window?.rootViewController = homeViewController

        window?.makeKeyAndVisible()

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {

    }

    func applicationDidEnterBackground(_ application: UIApplication) {

    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

