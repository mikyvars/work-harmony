//
//  HomeStatisticsLegendView.swift
//  WorkAndHarmony
//
//  Created by Apprenant 39 on 11/12/2024.
//

import SwiftUI

struct StatisticsLegendView: View {
    var legend: Emotion
    var comment: String? // Commentaire optionnel
    
    var body: some View {
        HStack {
            Circle()
                .fill(legend.color)
                .frame(width: 10, height: 10)
            
            Text(legend.label)
                .fontWeight(.semibold)
            
            // Si un commentaire a été fourni
            if let comment {
                Text("(\(comment))")
            }
        }
    }
}

#Preview {
    StatisticsLegendView(legend: .stress, comment: "Trés élevé")
        .modelContainer(for: Result.self)
        .padding()
        .background(.gray.opacity(0.4))
}
