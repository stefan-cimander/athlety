//
//  Event.swift
//  Athlety
//
//  Created by Stefan Cimander on 05.07.20.
//

import FirebaseFirestoreSwift

struct Event: Identifiable, Codable {
    
    @DocumentID
    var id: String?
    
    var title: String
    var location: String
    var startsAt: Date
    var endsAt: Date
    
    var isFavorite: Bool = false
    
}
