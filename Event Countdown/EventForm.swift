//
//  EventForm.swift
//  Event Countdown
//
//  Created by Brian Surface on 11/15/26.
//

import SwiftUI

struct EventForm: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var events: [Event]
    @State private var event: Event

    init(events: Binding<[Event]>, eventToEdit: Event? = nil) {
        _events = events
        _event = State(initialValue: eventToEdit ?? Event(
            title: "",
            date: .now,
            textColor: .red
        ))
    }

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Event Details")) {
                    TextField("Event Title", text: $event.title)
                    DatePicker(selection: $event.date) {
                        Text("Select the date")
                    }
                    ColorPicker("Select the event color", selection: $event.textColor)
                }
            }
            .toolbar{
                ToolbarItem(placement: .title) {
                    Text(event.title.isEmpty ? "Add event": "editing \(event.title)")
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save", systemImage: "checkmark") {
                       onSave()
                    }
                }
            }
        }
    }
    
    private func onSave(){
        if let index = events.firstIndex(where: { $0.id == event.id }) {
            events[index] = event
        } else {
            events.append(event)
        }
        dismiss()
    }
}

#Preview {
    @Previewable @State var events: [Event] = []
    EventForm(events: $events)
}
