//
//  Question.swift
//  WorkAndHarmony
//
//  Created by Apprenant 39 on 11/12/2024.
//

import Foundation

class Schedule: Identifiable {
    var id = UUID()
    var day: String
    var ranges: [[Int]]
    
    init(day: String, ranges: [[Int]]) {
        self.day = day
        self.ranges = ranges
    }
    static let sampleData: [Schedule] = [
        Schedule(day: "Lundi", ranges: [[08, 12], [14, 19]]),
        Schedule(day: "Mardi", ranges: [[08, 12], [14, 19]]),
        Schedule(day: "Mercredi", ranges: [[09, 12]]),
        Schedule(day: "Jeudi", ranges: [[08, 12], [14, 19]]),
        Schedule(day: "Vendredi", ranges: [[08, 12], [14, 19]]),
        Schedule(day: "Samedi", ranges: [[08, 12], [14, 19]])
    ]
}
