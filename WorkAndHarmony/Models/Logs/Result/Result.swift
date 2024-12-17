//
//  QuestionResult.swift
//  WorkAndHarmony
//
//  Created by Apprenant 39 on 11/12/2024.
//

import Foundation
import SwiftData

@Model
class Result: Identifiable {
    var id: UUID
    var date: Date
    var values: [ResultValue]
    
    var total: Int {
        values.reduce(0) { $0 + $1.value }
    }
    
    init(id: UUID = UUID(), date: Date, values: [ResultValue]) {
        self.id = id
        self.date = date
        self.values = values
    }
}

extension Result {
    static let emptyResult: Result = Result(date: Date(), values: [
        ResultValue(type: .stress, value: 0),
        ResultValue(type: .mentalLoad, value: 0),
        ResultValue(type: .anxiety, value: 0)
    ])
    
    static let sampleData: [Result] = [
        Result(date: Date(), values: [
            ResultValue(type: .stress, value: 80),
            ResultValue(type: .mentalLoad, value: 70),
            ResultValue(type: .anxiety, value: 60)
        ]),
        Result(date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!, values: [
            ResultValue(type: .stress, value: 100),
            ResultValue(type: .mentalLoad, value: 100),
            ResultValue(type: .anxiety, value: 200)
        ]),
        Result(date: Calendar.current.date(byAdding: .day, value: -2, to: Date())!, values: [
            ResultValue(type: .stress, value: 100),
            ResultValue(type: .mentalLoad, value: 100),
            ResultValue(type: .anxiety, value: 200)
        ]),
        Result(date: Calendar.current.date(byAdding: .day, value: -4, to: Date())!, values: [
            ResultValue(type: .stress, value: 10),
            ResultValue(type: .mentalLoad, value: 20),
            ResultValue(type: .anxiety, value: 30)
        ])
    ]
}
