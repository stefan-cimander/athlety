//
//  AddEventView.swift
//  Athlety
//
//  Created by Stefan Cimander on 05.07.20.
//

import SwiftUI

struct AddEventView: View {
    
    var onAdd: (Event) -> ()
    
    @State private var title = ""
    @State private var location = ""
    @State private var startDate = Date()
    @State private var endDate = Date().addingTimeInterval(3600)
    
    @State private var isStartDateTimePickerShown = false
    @State private var isEndDateTimePickerShown = false
    
    @Environment(\.presentationMode)
    private var presentationMode
    
    private let calendar = Calendar.current
    
    var body: some View {
        NavigationView {
            Form {

                Section(header: Text("General")) {
                    TextField("Title", text: $title)
                    TextField("Location", text: $location)
                }
                .padding(.vertical, 8)
                
                Section(header: Text("Dates")) {
                    
                    GeometryReader { _ in
                        ZStack {
                            Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.0001)
                            HStack {
                                Text("Begins")
                                Spacer()
                                Text(startDate, style: .date)
                                    .foregroundColor(isStartDateTimePickerShown ? Color.accentColor : Color.primary)
                                Text(startDate, style: .time)
                                    .foregroundColor(isStartDateTimePickerShown ? Color.accentColor : Color.primary)
                            }
                        }
                    }
                    .onTapGesture {
                        isEndDateTimePickerShown = false
                        isStartDateTimePickerShown.toggle()
                    }
                    
                    if (isStartDateTimePickerShown) {
                        DateTimePicker(dateTime: $startDate)
                    }
                    
                    GeometryReader { _ in
                        ZStack {
                            Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.0001)
                            HStack {
                                Text("Ends")
                                Spacer()
                                
                                if (!calendar.isDate(startDate, equalTo: endDate, toGranularity: .day)) {
                                    Text(endDate, style: .date)
                                        .foregroundColor(isEndDateTimePickerShown ? Color.accentColor : Color.primary)
                                }
                                Text(endDate, style: .time)
                                    .foregroundColor(isEndDateTimePickerShown ? Color.accentColor : Color.primary)
                            }
                        }
                    }
                    .onTapGesture {
                        isStartDateTimePickerShown = false
                        isEndDateTimePickerShown.toggle()
                    }
                    
                    if (isEndDateTimePickerShown) {
                        DateTimePicker(dateTime: $endDate)
                    }
                }
                .padding(.vertical, 8)
            }
            .font(.body)
            .navigationBarTitle("Add Event", displayMode: .inline)
            .navigationBarItems(leading: cancelButton, trailing: doneButton)
        }
        
    }
    
    private var cancelButton: some View {
        Button("Cancel") { dismiss() }
    }
    
    private var doneButton: some View {
        Button("Done") { addEvent(); dismiss() }
            .disabled(title.isEmpty)
            .font(.headline)
    }
    
    private func addEvent() {
        onAdd(Event(title: title, location: location, startsAt: startDate, endsAt: endDate))
    }
    
    private func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}


struct AddEventView_Previews: PreviewProvider {
    static var previews: some View {
        AddEventView() { _ in }
    }
}
