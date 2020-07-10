//
//  AthletyAppDelegate.swift
//  Athlety
//
//  Created by Stefan Cimander on 10.07.20.
//

import Firebase
import SwiftUI

class AthletyAppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions
                     launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        
        return true
    }
}
