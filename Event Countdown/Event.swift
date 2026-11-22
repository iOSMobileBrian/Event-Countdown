//
//  Event.swift
//  Event Countdown
//
//  Created by Brian Surface on 11/15/26.
//

import Foundation
import SwiftUI

struct Event: Comparable, Identifiable {
    static func < (lhs: borrowing Event, rhs: borrowing Event) -> Bool {
        lhs.date < rhs.date
    }
    
    let id: UUID = UUID()
    var title: String
    var date: Date
    var textColor: Color
    
}
