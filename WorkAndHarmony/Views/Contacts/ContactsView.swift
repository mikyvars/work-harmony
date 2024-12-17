//
//  ContactView.swift
//  WorkAndHarmony
//
//  Created by Apprenant 39 on 11/12/2024.
//

import SwiftUI

struct ContactsView: View {
    var contacts: [Contact] = Contact.sampleData
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                ScrollView {
                    HStack {
                        Text("\(contacts.count) résultats")
                        
                        Spacer()
                        
                        NavigationLink {
                            ContactsMapView()
                        } label: {
                            HStack {
                                Image(systemName: "map")
                                Text("Voir la carte")
                            }
                        }
                    }
                    .padding(.vertical)
                    
                    ForEach(contacts) { contact in
                        NavigationLink {
                            ContactsDetailsView(contact: contact)
                        } label: {
                            ContactsRowView(contact: contact)
                        }
                    }
                }
            }
            .padding()
            .background(Color("Background"))
            .toolbarBackground(.clear, for: .tabBar)
            .toolbarBackgroundVisibility(.visible, for: .tabBar)
            .navigationTitle("CONTACTS")
        }
    } 
}

#Preview {
    ContactsView()
}
