//
//  EventsOverview.swift
//  Athlety
//
//  Created by Stefan Cimander on 05.07.20.
//

import SwiftUI

struct EventsOverview: View {
    
    @EnvironmentObject
    private var eventStore: EventStore
    
    @State
    private var showAddEventModal = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(eventStore.events) { event in
                    EventCardView(event: event)
                }
            }
            .navigationBarTitle("Events")
            .navigationBarItems(trailing: addButton)
        }
        .onAppear { eventStore.loadAll() }
    }
    
    private var addButton: some View {
        let addEventView = AddEventView(onAdd: eventStore.add)
        return Button("Add") { self.showAddEventModal.toggle() }
            .sheet(isPresented: self.$showAddEventModal) { addEventView }
    }
}

struct EventsOverview_Previews: PreviewProvider {
    static var previews: some View {
        EventsOverview().environmentObject(EventTestData())
    }
}
