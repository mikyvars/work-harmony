//
//  LogsDateSelectorIconView.swift
//  WorkAndHarmony
//
//  Created by Apprenant 39 on 13/12/2024.
//

import SwiftUI

struct DateSelectorIconView: View {
    var icon: String
    var label: String
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(Color("Pear"))
                    .stroke(.gray.opacity(0.5), lineWidth: 1)
                    .frame(width: 55)
                
                Image(systemName: icon)
                    .font(.system(size: 28))
                    .foregroundStyle(.black)
            }
            
            Text(label)
        }
    }
}

#Preview {
    DateSelectorIconView(icon: "heart", label: "13/10")
}
