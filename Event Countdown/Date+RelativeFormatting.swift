//
//  Date+RelativeFormatting.swift
//  Event Countdown
//
//  Created by Brian Surface on 11/15/26.
//

import Foundation

extension Date {
    var relativeFormatter: String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        formatter.dateTimeStyle = .named
        
        return formatter.localizedString(for: self, relativeTo: Date())
    }
}
