//
//  QuestionView.swift
//  WorkAndHarmony
//
//  Created by Apprenant 39 on 11/12/2024.
//

import SwiftData
import SwiftUI

struct LogsView: View {
    @Query var results: [Result] = Result.sampleData
    
    @State var result: Result?
    @State var questions: [Question] = Question.sampleData
    @State var selectedDate: Date = Date()
    @State var selectedResult: Result = Result.emptyResult
    @State var streaksCount: Int = 0
    
    func updateResult() {
        print("")
        print("Selected: \(selectedDate)")
        let calendar = Calendar.current
        
        for result in results {
            print("Available: \(result.date)")
        }
        
        result = results.first {
            calendar.isDate($0.date, equalTo: selectedDate, toGranularity: .dayOfYear)
        } ?? nil
    }
    
    func calculateStreaks() {
        var lastDate: Date? = nil
        
        if results.contains(where: { Calendar.current.isDateInToday($0.date) }) {
            streaksCount = 1
            
            for result in results.sorted(by: { $0.date > $1.date }) {
                let resultDate = Calendar.current.date(byAdding: .day, value: -1, to: result.date)
                
                if let last = lastDate, let resultDate = resultDate, Calendar.current.isDate(last, inSameDayAs: resultDate) {
                    streaksCount += 1
                } else {
                    break
                }
                
                lastDate = result.date
            }
        } else {
            streaksCount = 0
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    DateSelectorView(selectedDate: $selectedDate)
                        .onChange(of: selectedDate) {
                            updateResult()
                        }
                    
                    if let result {
                        StatisticsView(result: $result)
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.regularMaterial)
                            
                            switch(result.total) {
                            case 0...50:
                                Text("**Votre santé mentale est globalement bonne, mais il est toujours important de rester vigilant.** Le stress, les petites inquiétudes ou les moments de doute peuvent survenir à tout moment. Même si vous ne ressentez pas de difficultés majeures, il est essentiel de prêter attention à votre bien-être mental. Assurez-vous de prendre des pauses, de parler de vos émotions, et de pratiquer des activités qui vous apportent du calme et de la sérénité. Rester attentif à votre état émotionnel vous permettra de détecter tout changement à temps et de prévenir de potentielles difficultés.")
                                    .padding()
                            case 50...150:
                                Text("**Votre santé mentale semble actuellement en difficulté et il serait fortement conseillé de consulter un professionnel.** Vous traversez une période où des symptômes de stress, d'anxiété, ou de tristesse persistants peuvent affecter votre quotidien. Ces signes ne doivent pas être ignorés, car ils peuvent se transformer en troubles plus graves si non pris en charge. Consulter un psychologue, un psychiatre ou un autre spécialiste de la santé mentale pourrait vous offrir des outils et un soutien adaptés pour traverser cette période difficile. Prendre soin de vous maintenant peut prévenir des complications futures.")
                                    .padding()
                            default:
                                Text("**Votre santé mentale est actuellement en danger et nécessite une consultation urgente.** Si vous ressentez une détresse émotionnelle intense, des pensées sombres ou un sentiment accablant de ne plus pouvoir faire face, il est crucial d'agir rapidement. Vous devez consulter un professionnel de santé dès que possible. En attendant, il est également important de vous accorder un véritable temps de repos, loin des sources de stress, afin de préserver votre équilibre. Ne laissez pas ces signaux d'alerte passer inaperçus : votre bien-être est la priorité, et des ressources existent pour vous soutenir.")
                                    .padding()
                            }
                        }
                    } else if Calendar.current.isDateInToday(selectedDate) {
                        QuestionsView(questions: $questions, result: $result)
                        QuestionsEmptyView()
                    } else {
                        StatisticsView(result: .constant(nil))
                    }
                    
                    Spacer()
                }
            }
            .padding(.horizontal)
            .background(Color("Background"))
            .toolbarBackground(.clear, for: .tabBar)
            .toolbarBackgroundVisibility(.visible, for: .tabBar)
            .toolbar() {
                LogsStreaksView(streaksCount: $streaksCount)
            }
            .navigationTitle("JOURNAL")
            .onAppear() {
                updateResult()
                calculateStreaks()
            }
        }
    }
}

#Preview {
    LogsView()
        .modelContainer(for: Result.self)
}
