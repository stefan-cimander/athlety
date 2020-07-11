//
//  EventCardView.swift
//  Athlety
//
//  Created by Stefan Cimander on 11.07.20.
//

import SwiftUI

struct EventCardView: View {
    
    var event: Event
    
    var body: some View {
        NavigationLink(destination: EventDetailsView(event: event)) {
            VStack(alignment: .leading) {
                Text(event.title)
                    .font(.headline)
                Text(event.location)
                    .font(.subheadline)
            }
        }
    }
}

struct EventCardView_Previews: PreviewProvider {
    static var previews: some View {
        let event = Event(title: "Nachtmeeting", location: "Rheinfelden")
        EventCardView(event: event)
    }
}
