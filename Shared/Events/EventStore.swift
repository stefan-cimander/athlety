//
//  EventStore.swift
//  Athlety
//
//  Created by Stefan Cimander on 11.07.20.
//

import FirebaseFirestore
import FirebaseFirestoreSwift

class EventStore: ObservableObject {
    
    @Published var events: [Event] = []
    
    let eventsCollection = Firestore.firestore().collection("events")
    
    func loadAll() {
        eventsCollection.addSnapshotListener { (querySnapshot, error) in
            if let error = error {
                print("Could not load events - \(error.localizedDescription)")
                return
            }
            guard let snapshot = querySnapshot else { return }
            self.events = snapshot.documents.compactMap(self.toEvent)
        }
    }
    
    
    private func toEvent(snapshot: QueryDocumentSnapshot) -> Event? {
        do {
            return try snapshot.data(as: Event.self)
        } catch {
            print("Could not parse snapshot data \(snapshot.data()) as event instance - \(error.localizedDescription)")
            return nil
        }
    }
}
