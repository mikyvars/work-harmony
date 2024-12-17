//
//  HomeQuestionView.swift
//  WorkAndHarmony
//
//  Created by Apprenant 39 on 11/12/2024.
//

import SwiftUI

struct QuestionsView: View {
    @Environment(\.modelContext) var modelContext
    
    @Binding var questions: [Question]
    @Binding var result: Result?
    
    @State var questionIndex: Int = 0
    @State var questionAnswer: Int = 0
    
    func prevQuestion() {
        questionIndex -= questionIndex > 0 ? 1 : 0
        questionAnswer = questions[questionIndex].answer == 0 ? 0 : questions[questionIndex].answer
    }
    
    func nextQuestion() {
        questionIndex += questionIndex < questions.count - 1 ? 1 : 0
        questionAnswer = questions[questionIndex].answer == 0 ? 0 : questions[questionIndex].answer
    }
    
    func saveAnswer() {
        questions[questionIndex].answer = questionAnswer
    }
    
    func saveResult() {
        var newValues: [ResultValue] = []
        
        for question in questions {
            for point in question.points {
                if let existingIndex = newValues.firstIndex(where: { $0.type == point.type }) {
                    newValues[existingIndex].value += point.value * question.answer
                } else {
                    newValues.append(ResultValue(type: point.type, value: point.value * question.answer))
                }
            }
        }
        
        result = Result(date: Date(), values: newValues)
        
        do {
            modelContext.insert(result!)
            try modelContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    var body: some View {
        VStack(spacing: 25) {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(style: StrokeStyle(lineWidth: 1, lineCap: .round))
                        .frame(width: 30, height: 30)
                        .foregroundStyle(.gray.opacity(0.5))
                    Image(systemName: "questionmark.text.page")
                }
                
                Text("Questionnaire")
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                
                Spacer()
            }
            
            Text(questions[questionIndex].title)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
            
            VStack {
                HStack {
                    Text(questions[questionIndex].ranges[0])
                    Spacer()
                    Text(questions[questionIndex].ranges[1])
                }
                
                Picker("Réponse", selection: $questionAnswer) {
                    Text("0").tag(0)
                    Text("1").tag(1)
                    Text("2").tag(2)
                    Text("3").tag(3)
                    Text("4").tag(4)
                    Text("5").tag(5)
                }
                .pickerStyle(.segmented)
            }
            
            HStack {
                Button(action: {
                    saveAnswer()
                    prevQuestion()
                }, label: {
                    Image(systemName: "arrow.left")
                })
                .disabled(questionIndex == 0)
                
                Spacer()
                Text("Question \(questionIndex + 1) / \(questions.count)")
                Spacer()
                
                if(questionIndex == questions.count - 1) {
                    Button(action: {
                        saveAnswer()
                        saveResult()
                    }, label: {
                        Image(systemName: "checkmark")
                    })
                } else {
                    Button(action: {
                        saveAnswer()
                        nextQuestion()
                    }, label: {
                        Image(systemName: "arrow.right")
                    })
                    .disabled(questionIndex == questions.count - 1)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    QuestionsView(questions: .constant(Question.sampleData), result: .constant(Result.sampleData[0]))
        .modelContainer(for: Result.self)
        .padding()
}
