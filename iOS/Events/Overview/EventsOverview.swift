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
        let addEventView = AddEventView() { _ in }
        return Button("Add") { self.showAddEventModal.toggle() }
            .sheet(isPresented: self.$showAddEventModal) { addEventView }
    }
}

struct EventsOverview_Previews: PreviewProvider {
    static var previews: some View {
        EventsOverview()
    }
}
