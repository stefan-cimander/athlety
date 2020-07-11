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
            Event(id: "L9riyhPxH0ZqjtvXgmEm", title: "Munich Indoor", location: "München"),
            Event(id: "PXtToYDN4Q1GdquzMQgI", title: "Bayerische Meisterschaften", location: "Fürth")
        ]
    }
}
