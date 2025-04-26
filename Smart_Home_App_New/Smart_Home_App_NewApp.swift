//
//  Smart_Home_App_NewApp.swift
//  Smart_Home_App_New
//
//  Created by Sachithra on 2025-04-25.
//

import SwiftUI
import Firebase


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}


@main
struct Smart_Home_App_NewApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            //Login()
            //Signup()
            //AirConditionView()
            //AutomationView()
            //ControlView()
            //SmartLightView()
        }
    }
}
