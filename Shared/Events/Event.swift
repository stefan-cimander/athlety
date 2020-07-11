//
//  Event.swift
//  Athlety
//
//  Created by Stefan Cimander on 05.07.20.
//

import FirebaseFirestoreSwift

struct Event: Identifiable, Decodable {
    
    @DocumentID
    var id: String?
    
    var name: String
    var location: String
    
}
