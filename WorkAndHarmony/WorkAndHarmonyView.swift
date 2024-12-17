//
//  ContentView.swift
//  WorkAndHarmony
//
//  Created by Apprenant 39 on 11/12/2024.
//

import SwiftUI
import SwiftData

struct WorkAndHarmonyView: View {
    @State var isSplashActive: Bool = true
    @State var selectedTab: Int = 0
    
    var body: some View {
        Group {
            if isSplashActive {
                SplashView()
            } else {
                TabView(selection: $selectedTab) {
                    Tab("Journal", systemImage: "book", value: 0) {
                        LogsView()
                    }
                    
                    Tab("Documentation", systemImage: "text.document", value: 1) {
                        DocumentationView()
                    }
                    
                    Tab("Contacts", systemImage: "phone", value: 2) {
                        ContactsView()
                    }
                    
                    Tab("Paramètres", systemImage: "gearshape", value: 3) {
                        SettingsView()
                    }
                }
                .tint(.black)
                .preferredColorScheme(.light)
            }
        }
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation() {
                    isSplashActive = false
                }
            }
        }
    }
    
    init() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.largeTitleTextAttributes = [.font: UIFont(name: "PantonNarrow-Trial-ExtraBoldItalic", size: 42)!]
        navBarAppearance.titleTextAttributes = [.font: UIFont(name: "PantonNarrow-Trial-ExtraBoldItalic", size: 20)!]
        navBarAppearance.backgroundColor = .white
        
        let backButtonAppearance = UIBarButtonItemAppearance()
        backButtonAppearance.normal.titleTextAttributes = [.font: UIFont(name: "PantonNarrow-Trial-ExtraBoldItalic", size: 18)!]
        navBarAppearance.backButtonAppearance = backButtonAppearance

        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
    }
}

#Preview {
    WorkAndHarmonyView()
        .modelContainer(for: Result.self)
}
