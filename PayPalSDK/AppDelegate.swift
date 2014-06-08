//
//  AppDelegate.swift
//  PayPalSDK
//
//  Created by Messerschmidt, Tim on 08.06.14.
//  Copyright (c) 2014 Messerschmidt, Tim. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: NSDictionary?) -> Bool {
        PayPalMobile.initializeWithClientIdsForEnvironments([PayPalEnvironmentProduction: "ID1", PayPalEnvironmentSandbox: "ID2"])
        return true
    }
}

