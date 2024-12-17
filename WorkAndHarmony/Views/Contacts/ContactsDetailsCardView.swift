//
//  ContactsDetailsCardViex.swift
//  WorkAndHarmony
//
//  Created by Apprenant 39 on 16/12/2024.
//

import SwiftUI

struct ContactsDetailsCardView: View {
    var headerIcon: String
    var headerTitle: String
    var contentLines: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            HStack(alignment: .center){
                Image(systemName: headerIcon)
                    .font(.system(size: 18))
                    .foregroundColor(Color.blue)
                
                Text(headerTitle)
                    .font(.headline)
                    .fontWeight(.bold)
            }
            
            ForEach(contentLines, id: \.self){ line in
                Text("• \(line)")
            }
        }
        .padding(10)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    ContactsDetailsCardView(headerIcon: "eurosign.circle", headerTitle: "Frais", contentLines: ["Line 1", "Line 2"])
        .padding()
}
