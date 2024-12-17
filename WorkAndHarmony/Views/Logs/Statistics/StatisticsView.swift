//
//  HomeStatisticsView.swift
//  WorkAndHarmony
//
//  Created by Apprenant 39 on 11/12/2024.
//

import Charts
import Foundation
import SwiftData
import SwiftUI

struct StatisticsView: View {
    @Binding var result: Result?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 25) {
            StatisticsHeaderView(result: $result)
            
            if let result {
                VStack(alignment: .leading) {
                    ForEach(result.values.sorted(by: {$0.value > $1.value}), id: \.type) { resultValue in
                        switch(resultValue.value) {
                        case 0...50:
                            StatisticsLegendView(legend: resultValue.type)
                        case 50...150:
                            StatisticsLegendView(legend: resultValue.type, comment: "Élevé(e)")
                        default:
                            StatisticsLegendView(legend: resultValue.type, comment: "Très élevé(e)")
                        }
                    }
                }
                
                Chart(result.values, id: \.type) {
                    BarMark(
                        x: .value("Emotion", $0.type.label),
                        y: .value("Value", $0.value)
                    )
                    .foregroundStyle($0.type.color)
                }
                .frame(minHeight: 200, maxHeight: 250)
            } else {
                Image("statistics-undefined")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    StatisticsView(result: .constant(Result.emptyResult))
        .modelContainer(for: Result.self)
        .padding()
}
