//
//  SplashView.swift
//  WorkAndHarmony
//
//  Created by Apprenant 39 on 13/12/2024.
//

import SwiftUI

struct SplashView: View {
    @State private var showWork: Bool = false
    @State private var showHarmony: Bool = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("Pear"))
                .ignoresSafeArea()
            
            VStack(spacing: 25) {
                Image(systemName: "brain")
                    .font(.system(size: 142))
                    .foregroundStyle(.white)
                    .symbolEffect(.breathe, value: showWork || showHarmony)
                    .shadow(radius: 20)
                
                HStack(spacing: 8) {
                    if showWork {
                        Text("Work")
                            .transition(.opacity.combined(with: .move(edge: .trailing)))
                    }
                    
                    Text("&")
                        .opacity(showWork ? 1 : 0)
                        .animation(.easeInOut(duration: 1.0).delay(0.5), value: showWork)
                    
                    if showHarmony {
                        Text("Harmony")
                            .transition(.opacity.combined(with: .move(edge: .leading)))
                    }
                }
                .font(.system(size: 32))
                .fontWeight(.bold)
                .foregroundStyle(.white)
            }
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 1.0).delay(0.5)) {
                showWork = true
            }
            withAnimation(.easeInOut(duration: 1.0).delay(1.5)) {
                showHarmony = true
            }
        }
    }
}

#Preview {
    SplashView()
}
