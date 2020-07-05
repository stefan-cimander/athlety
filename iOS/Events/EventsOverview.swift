//
//  EventsOverview.swift
//  Athlety
//
//  Created by Stefan Cimander on 05.07.20.
//

import SwiftUI

struct EventsOverview: View {
    
    @State
    private var showAddEventModal = false
    
    var body: some View {
        NavigationView {
            Text("")
                .navigationBarTitle("Events")
                .navigationBarItems(trailing: addButton)
        }
    }
    
    private var addButton: some View {
        return Button("Add") { self.showAddEventModal.toggle() }
    }
}

struct EventsOverview_Previews: PreviewProvider {
    static var previews: some View {
        EventsOverview()
    }
}
