//
//  AddEventViewModel.swift
//  Athlety
//
//  Created by Stefan Cimander on 01.01.21.
//

import SwiftUI

class AddEventViewModel: ObservableObject {
    
    @Published var title = ""
    @Published var location = ""
    
    @Published var startDate = Date() { didSet {
        guard oldValue <= endDate else { return }
        adjustEndDateToKeepPreviousTimeInterval(to: oldValue)
    }}
    
    @Published var endDate = Date().addingTimeInterval(3600)
    
    
    var hasInvalidTitle: Bool { title.isEmpty }
    var hasInvalidEndDate: Bool { endDate < startDate }
    
    var isStartAndEndDateAtSameDay: Bool { Calendar.current.isDate(startDate, inSameDayAs: endDate)}
    
    
    func toEvent() -> Event {
        Event(title: title, location: location, startsAt: startDate, endsAt: endDate)
    }
    
    
    private func adjustEndDateToKeepPreviousTimeInterval(to previousStartDate: Date) {
        let previousTimeInterval = endDate.timeIntervalSince(previousStartDate)
        endDate = startDate.addingTimeInterval(previousTimeInterval)
    }
    
}
