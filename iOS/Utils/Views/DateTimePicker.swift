//
//  DateTimePicker.swift
//  iOS
//
//  Created by Stefan Cimander on 27.12.20.
//

import SwiftUI

struct DateTimePicker: View {
    
    @Binding var dateTime: Date
    
    var body: some View {
        VStack(alignment: .leading) { timePicker; datePicker }
    }
    
    private var timePicker: some View {
        DatePicker("Time", selection: $dateTime, displayedComponents: [.hourAndMinute])
            .datePickerStyle(GraphicalDatePickerStyle())
            .padding([.leading], 8)
            .font(.headline)
    }
    
    private var datePicker: some View {
        DatePicker("Date", selection: $dateTime, displayedComponents: [.date])
            .datePickerStyle(GraphicalDatePickerStyle())
    }
}


// MARK: - Previews

struct DateTimePicker_Previews: PreviewProvider {
    
    @State static var dateTime = Date()
    
    static var previews: some View {
        DateTimePicker(dateTime: $dateTime)
    }
}
