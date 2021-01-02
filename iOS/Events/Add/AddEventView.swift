//
//  AddEventView.swift
//  Athlety
//
//  Created by Stefan Cimander on 05.07.20.
//

import SwiftUI

struct AddEventView: View {
    
    var onAdd: (Event) -> ()
    
    @ObservedObject private var viewModel = AddEventViewModel()
    
    @State private var isStartDateTimePickerShown = false
    @State private var isEndDateTimePickerShown = false
    
    @Environment(\.presentationMode)
    private var presentationMode
    
    
    var body: some View {
        NavigationView {
            Form {

                Section(header: Text("General")) {
                    TextField("Title", text: $viewModel.title)
                    TextField("Location", text: $viewModel.location)
                }
                .padding(.vertical, 8)
                
                Section(header: Text("Dates")) {
                    
                    GeometryReader { _ in
                        ZStack {
                            Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.0001)
                            HStack {
                                Text("Begins")
                                Spacer()
                                Text(viewModel.startDate, style: .date)
                                    .foregroundColor(isStartDateTimePickerShown ? Color.accentColor : Color.primary)
                                Text(viewModel.startDate, style: .time)
                                    .foregroundColor(isStartDateTimePickerShown ? Color.accentColor : Color.primary)
                            }
                        }
                    }
                    .onTapGesture {
                        hideKeyboard()
                        isEndDateTimePickerShown = false
                        isStartDateTimePickerShown.toggle()
                    }
                    
                    if (isStartDateTimePickerShown) {
                        DateTimePicker(dateTime: $viewModel.startDate)
                    }
                    
                    GeometryReader { _ in
                        ZStack {
                            Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.0001)
                            HStack {
                                Text("Ends")
                                Spacer()
                                
                                if (!viewModel.isStartAndEndDateAtSameDay) {
                                    Text(viewModel.endDate, style: .date)
                                        .foregroundColor(isEndDateTimePickerShown ? Color.accentColor : Color.primary)
                                }
                                Text(viewModel.endDate, style: .time)
                                    .foregroundColor(isEndDateTimePickerShown ? Color.accentColor : Color.primary)
                            }
                        }
                    }
                    .onTapGesture {
                        hideKeyboard()
                        isStartDateTimePickerShown = false
                        isEndDateTimePickerShown.toggle()
                    }
                    
                    if (isEndDateTimePickerShown) {
                        DateTimePicker(dateTime: $viewModel.endDate)
                    }
                }
                .padding(.vertical, 8)
            }
            .font(.body)
            .navigationBarTitle("Event", displayMode: .inline)
            .navigationBarItems(leading: cancelButton, trailing: addButton)
        }
    }
    
    private var cancelButton: some View {
        Button("Cancel") { dismiss() }
    }
    
    private var addButton: some View {
        Button("Add") { onAdd(viewModel.toEvent()); dismiss() }
            .disabled(viewModel.hasInvalidTitle || viewModel.hasInvalidEndDate)
            .font(.headline)
    }
    
    private func hideKeyboard() {
        let resignFirstResponder = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resignFirstResponder, to: nil, from: nil, for: nil)
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
