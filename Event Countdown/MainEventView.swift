//
//  MainEventView.swift
//  Event Countdown
//
//  Created by Brian Surface on 11/15/26.
//

import SwiftUI

struct MainEventView: View {
    @State private var isShowingEventForm = false
    @State private var currentEvent: Event?
    @State private var events: [Event] = []

    var body: some View {
        NavigationStack {
            List {
                ForEach(events) { event in
                    Button {
                        currentEvent = event
                        isShowingEventForm = true
                    } label: {
                        EventRow(event: event)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .contentShape(Rectangle())
                    }
                    .buttonStyle(.plain)
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button(role: .destructive) {
                            deleteEvent(event)
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                }
            }
            .toolbar {
                Button("Add Event") {
                    currentEvent = nil
                    isShowingEventForm = true
                }
            }
            .sheet(isPresented: $isShowingEventForm) {
                EventForm(events: $events, eventToEdit: currentEvent)
            }
        }
    }

    private func deleteEvent(_ event: Event) {
        events.removeAll { $0.id == event.id }
    }
}

#Preview {
    MainEventView()
}
