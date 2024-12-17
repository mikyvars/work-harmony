//
//  QuestionsEmptyView.swift
//  WorkAndHarmony
//
//  Created by Apprenant 39 on 14/12/2024.
//

import SwiftUI

struct QuestionsEmptyView: View {
    var body: some View {
        VStack {
            Text("Une fois ce questionnaire rempli, tu obtiendras des statistiques qui pourront t'aider à détecter des signes précoces de troubles mentaux. Cependant, il est important de noter que ces résultats ne remplacent en aucun cas un professionnel de santé. Ils sont uniquement destinés à des fins préventives et à sensibiliser sur ton bien-être mental.")
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    QuestionsEmptyView()
        .padding()
}
