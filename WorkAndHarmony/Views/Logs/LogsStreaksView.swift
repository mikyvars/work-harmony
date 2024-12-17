//
//  LogsHeaderView.swift
//  WorkAndHarmony
//
//  Created by Apprenant 39 on 14/12/2024.
//

import SwiftUI

struct LogsStreaksView: View {
    @Binding var streaksCount: Int
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .stroke(.gray.opacity(0.5), lineWidth: 1)
                .fill(Color("Pear"))
                .frame(width: 60, height: 30)
            
            HStack {
                Text("\(streaksCount)")
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                
                Image(systemName: "bolt\(streaksCount == 0 ? "" : ".fill")")
                    .font(.system(size: 12))
            }
            .font(.system(size: 22))
        }
    }
}

#Preview {
    LogsStreaksView(streaksCount: .constant(0))
}
