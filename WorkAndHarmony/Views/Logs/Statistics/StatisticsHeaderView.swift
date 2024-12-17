//
//  StatisticsHeaderView.swift
//  WorkAndHarmony
//
//  Created by Apprenant 39 on 13/12/2024.
//

import SwiftUI

struct StatisticsHeaderView: View {
    @Binding var result: Result?
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        return formatter
    }()
    
    var body: some View {
        HStack(alignment: .top) {
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(style: StrokeStyle(lineWidth: 1, lineCap: .round))
                    .frame(width: 30, height: 30)
                    .foregroundStyle(.gray.opacity(0.5))
                Image(systemName: "chart.line.text.clipboard")
            }
            
            if let result {
                Text("Résultats du \(dateFormatter.string(from: result.date))")
                    .font(.system(size: 22))
                    .fontWeight(.bold)
            } else {
                VStack(alignment: .leading) {
                    Text("Résultats non trouvés")
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                        .frame(height: 30)
                    
                    Text("Aucun résultat disponible à cette date.")
                        .multilineTextAlignment(.center)
                }
            }
            
            Spacer()
        }
    }
}

#Preview {
    StatisticsHeaderView(result: .constant(Result.emptyResult))
        .padding()
}
