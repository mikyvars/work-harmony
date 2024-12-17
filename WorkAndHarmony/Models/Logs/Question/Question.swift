//
//  Question.swift
//  WorkAndHarmony
//
//  Created by Apprenant 39 on 11/12/2024.
//

import Foundation

struct Question: Identifiable {
    var id = UUID()
    var title: String
    var ranges: [String]
    var points: [QuestionPoint]
    var answer: Int = 0
}

extension Question {
    static let sampleData: [Question] = [
        Question(title: "À quel point ressentez-vous du stress au travail ?", ranges: ["Pas du tout", "Énormément"], points: [
            QuestionPoint(type: .stress, value: 2),
            QuestionPoint(type: .anxiety, value: 4)
        ]),
        Question(title: "Dans quelle mesure êtes-vous satisfait(e) de votre travail ?", ranges: ["Pas du tout", "Très satisfait(e)"], points: [
            QuestionPoint(type: .mentalLoad, value: 2)
        ]),
        Question(title: "À quel point trouvez-vous votre charge de travail adaptée ?", ranges: ["Pas du tout", "Parfaitement adaptée"], points: [
            QuestionPoint(type: .stress, value: 3),
            QuestionPoint(type: .mentalLoad, value: 4)
        ]),
        Question(title: "À quel point vous sentez-vous motivé(e) à accomplir vos tâches ?", ranges: ["Pas du tout", "Très motivé(e)"], points: [
            QuestionPoint(type: .mentalLoad, value: 2),
            QuestionPoint(type: .anxiety, value: 7)
        ]),
        Question(title: "À quel point sentez-vous que votre travail est reconnu et valorisé ?", ranges: ["Pas du tout", "Énormément"], points: [
            QuestionPoint(type: .stress, value: 1)
        ]),
        Question(title: "À quel point vous sentez-vous mentalement fatigué(e) par votre travail ?", ranges: ["Pas du tout", "Énormément"], points: [
            QuestionPoint(type: .stress, value: 2),
            QuestionPoint(type: .anxiety, value: 2)
        ]),
        Question(title: "Dans quelle mesure vos relations avec vos collègues sont-elles positives ?", ranges: ["Très négatives", "Très positives"], points: [
            QuestionPoint(type: .mentalLoad, value: 3)
        ])
    ]
}
