//
//  EventDetailsView.swift
//  Athlety
//
//  Created by Stefan Cimander on 11.07.20.
//

import SwiftUI

struct EventDetailsView: View {
    
    var event: Event
    
    @EnvironmentObject
    private var eventStore: EventStore
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(event.title)
                    .font(.title)
                Text(event.location)
                    .font(.subheadline)
                Spacer()
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: favoriteButton)
    }
    
    
    private var favoriteButton: some View {
        return Button(
            action: {
                var eventToUpdate = self.event
                eventToUpdate.isFavorite.toggle()
                eventStore.update(eventToUpdate)
            },
            label: {
                let imageName = event.isFavorite ? "heart.fill" : "heart"
                Image(systemName: imageName).imageScale(.large).padding()
            }
        )
    }
    
}

struct EventDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let event = Event(title: "Nachtmeeting", location: "Rheinfelden")
        NavigationView {
            EventDetailsView(event: event)
        }
        .environmentObject(EventTestData())
    }
}
