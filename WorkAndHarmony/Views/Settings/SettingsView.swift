//
//  SettingsView.swift
//  WorkAndHarmony
//
//  Created by Apprenant 39 on 11/12/2024.
//

import SwiftUI

struct SettingsView: View {
    @State var notifications: Bool = true
    
    @State var sheetHeight: CGFloat = .zero
    @State var sheetContent: String = "Content"
    @State var showSheet: Bool = false
    
    let settingsGeneral: [Setting] = [
        Setting(label: "À quoi sert cette application?", value: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec quis leo et purus elementum lobortis at at metus. Nulla maximus egestas turpis, et ultricies massa. Sed sed tellus pellentesque, malesuada tellus nec, malesuada quam. Cras non lectus ultrices, suscipit est eleifend, feugiat dui. In ac eleifend mi, ornare malesuada neque. Suspendisse non dignissim ipsum. Proin sollicitudin, augue in porta sodales, ex massa dictum ex, eu pharetra magna est interdum mi. Proin non interdum ipsum."),
        Setting(label: "À qui s'adresse cette application?", value: "Lorem Ipsum 2."),
        Setting(label: "Est-ce que l'application est gratuite?", value: "Lorem Ipsum 3."),
        Setting(label: "Puis-je utiliser l’application hors ligne?", value: "Lorem Ipsum 4.")
    ]
    
    let settingsConfidentiality: [Setting] = [
        Setting(label: "Mes données sont-elles sécurisées?", value: "Lorem Ipsum 1."),
        Setting(label: "Que faites-vous de mes données?", value: "Lorem Ipsum 2."),
        Setting(label: "Puis-je désactiver le suivi des données?", value: "Lorem Ipsum 3.")
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section(header: Text("notifications")) {
                        Toggle("A définir", isOn: $notifications)
                    }
                    
                    Section(header: Text("questions générales sur l'application")) {
                        ForEach(settingsGeneral) { setting in
                            Button(action: {
                                sheetContent = setting.value
                            }, label: {
                                HStack {
                                    Text(setting.label)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                }
                            })
                            .foregroundStyle(.black)
                        }
                    }
                    
                    Section(header: Text("sécurité et confidentialité")) {
                        ForEach(settingsConfidentiality) { setting in
                            Button(action: {
                                sheetContent = setting.value
                            }, label: {
                                HStack {
                                    Text(setting.label)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                }
                            })
                            .foregroundStyle(.black)
                        }
                    }
                }
                .scrollContentBackground(.hidden)
                .sheet(isPresented: $showSheet, content: {
                    Text(sheetContent)
                        .padding(.horizontal)
                        .padding(.vertical, 50)
                        .presentationDetents([.height(sheetHeight)])
                        .presentationDragIndicator(.visible)
                        .fixedSize(horizontal: false, vertical: true)
                        .modifier(GetHeightModifier(height: $sheetHeight))
                    
                })
                .onChange(of: sheetContent) {
                    showSheet = true
                }
                
            }
            .background(Color("Background"))
            .navigationTitle("PARAMETRES")
        }
    }
}

#Preview {
    SettingsView()
}
