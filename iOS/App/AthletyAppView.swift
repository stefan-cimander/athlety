//
//  AthletyAppView.swift
//  Athlety
//
//  Created by Stefan Cimander on 05.07.20.
//

import SwiftUI

struct AthletyAppView: View {
    
    @State
    private var selectedTab = 1
    
    var body: some View {
        TabView(selection: $selectedTab) {
            EventsOverview()
                .tabItem {
                    let imageName = selectedTab == 1 ? "bookmark.fill" : "bookmark"
                    Image(systemName: imageName).imageScale(.large)
                    Text("Events")
                }
                .tag(1)
            Text("Profile")
                .tabItem {
                    let imageName = selectedTab == 2 ? "person.fill" : "person"
                    Image(systemName: imageName).imageScale(.large)
                    Text("Profile")
                }
                .tag(2)
        }
    }
}

struct AthletyAppView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AthletyAppView().environmentObject(EventTestData())
        }
    }
}
