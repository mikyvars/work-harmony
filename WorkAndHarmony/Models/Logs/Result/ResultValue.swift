//
//  ResultValue.swift
//  WorkAndHarmony
//
//  Created by Apprenant 39 on 12/12/2024.
//

class ResultValue: Codable {
    var type: Emotion
    var value: Int
    
    init(type: Emotion, value: Int) {
        self.type = type
        self.value = value
    }
}
