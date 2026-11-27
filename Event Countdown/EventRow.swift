//
//  EventRow.swift
//  Event Countdown
//
//  Created by Brian Surface on 11/15/26.
//

import SwiftUI

struct EventRow: View {
    @State var event: Event
    var body: some View {
        VStack(alignment: .leading) {
            Text(event.title)
                .foregroundColor(event.textColor)
            TimelineView(.periodic(from: .now, by: 1)) { _ in
                Text(event.date.relativeFormatter)
            }
        }
    }
}

#Preview {
    EventRow(event: Event(title: "Sample Event", date: .now, textColor: .red))
}
