//
//  EventRow.swift
//  Event Countdown
//
//  Created by Brian Surface on 11/15/26.
//

import SwiftUI

struct EventRow: View {
    let event: Event
    var body: some View {
        VStack {
            Text(event.title)
                .foregroundColor(event.textColor)
            Text(event.date.relativeFormatter)
        }
    }
}

#Preview {
    EventRow(event: Event(title: "Sample Event", date: .now, textColor: .red))
}
