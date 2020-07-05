//
//  AddEventView.swift
//  Athlety
//
//  Created by Stefan Cimander on 05.07.20.
//

import SwiftUI

struct AddEventView: View {
    
    var onAdd: (Event) -> ()
    
    @State private var name = ""
    @State private var location = ""
    
    @State private var startDate = Date()
    @State private var endDate = Date().addingTimeInterval(3600)
    
    @Environment(\.presentationMode)
    private var presentationMode
    
    var body: some View {
        NavigationView {
            Form {

                Section(header: Text("General")) {
                    TextField("Name", text: $name)
                    TextField("Location", text: $location)
                }
                .padding(.vertical, 8)

                Section(header: Text("Dates")) {
                    HStack {
                        Text("Starts")
                        Spacer()
                        Text(Date(), style: .date)
                        Text(Date(), style: .time)
                    }

                    HStack {
                        Text("Ends")
                        Spacer()
                        Text(Date().addingTimeInterval(3600), style: .time)
                    }
                }
                .padding(.vertical, 8)
            }
            
            .navigationBarTitle("Add Event", displayMode: .inline)
            .navigationBarItems(leading: cancelButton, trailing: doneButton)
        }
        
    }
    
    private var cancelButton: some View {
        Button("Cancel") { dismiss() }
    }
    
    private var doneButton: some View {
        Button("Done") { addEvent(); dismiss() }
            .disabled(name.isEmpty)
            .font(.headline)
    }
    
    
    private func addEvent() {
        onAdd(Event(name: name, location: location))
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
