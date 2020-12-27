//
//  EventTestData.swift
//  Athlety
//
//  Created by Stefan Cimander on 11.07.20.
//

import Foundation

class EventTestData: EventStore {
    
    override func loadAll() {
        events = [
            Event(id: "L9riyhPxH0ZqjtvXgmEm", title: "Munich Indoor", location: "München", startsAt: Date(), endsAt: Date()),
            Event(id: "PXtToYDN4Q1GdquzMQgI", title: "Bayerische Meisterschaften", location: "Fürth", startsAt: Date(), endsAt: Date())
        ]
    }
    
    override func update(_ event: Event) {
        guard let index = events.firstIndex(where: { $0.id == event.id }) else { return }
        events[index] = event
    }
}
