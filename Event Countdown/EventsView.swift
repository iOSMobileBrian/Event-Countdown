//
//  MainEventView.swift
//  Event Countdown
//
//  Created by Brian Surface on 11/15/26.
//

import SwiftUI

struct EventsView: View {
    @State private var events: [Event] = []

    var body: some View {
        NavigationStack {
            List {
                ForEach(events.sorted()) { event in
                    NavigationLink {
                        EventForm(events: $events, eventToEdit: event)
                    } label: {
                        EventRow(event: event)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .contentShape(Rectangle())
                    }
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button(role: .destructive) {
                            deleteEvent(event)
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                }
            }.toolbar {
                NavigationLink {
                    EventForm(events: $events)
                } label: {
                    Label("Add", systemImage: "plus")
                }
            }
        }
    }

    private func deleteEvent(_ event: Event) {
        events.removeAll { $0.id == event.id }
    }
}

#Preview {
    EventsView()
}
