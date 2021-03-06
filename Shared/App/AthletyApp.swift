//
//  AthletyApp.swift
//  Athlety
//
//  Created by Stefan Cimander on 03.07.20.
//

import SwiftUI

@main
struct AthletyApp: App {
    
    #if os(iOS)
    @UIApplicationDelegateAdaptor(AppDelegate.self)
    private var appDelegate
    #endif
    
    @StateObject
    private var eventStore = EventStore()
    
    var body: some Scene {
        WindowGroup {
            AppView().environmentObject(eventStore)
        }
    }
}
