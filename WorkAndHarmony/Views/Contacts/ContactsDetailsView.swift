//
//  vueprofeView.swift
//  WorkAndHarmony
//
//  Created by Apprenant 50 on 13/12/2024.
//

import SwiftUI

struct ContactsDetailsView: View {
    var contact: Contact
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ScrollView {
                HStack {
                    Image(contact.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 70, height: 70)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading) {
                        Text("\(contact.firstName) \(contact.lastName)")
                            .fontWeight(.bold)
                        
                        Text(contact.speciality)
                    }
                }
                .padding(10)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                
                ContactsDetailsCardView(headerIcon: "map", headerTitle: "Adresse", contentLines: [contact.address])
                ContactsDetailsCardView(headerIcon: "brain.head.profile", headerTitle: "Spécialités", contentLines: contact.skills)
                ContactsDetailsCardView(headerIcon: "eurosign.circle", headerTitle: "Frais", contentLines: contact.fees)
                ContactsDetailsCardView(headerIcon: "clock", headerTitle: "Horaires", contentLines: contact.schedules)
            }
        }
        .padding()
        .background(Color("Background"))
        .toolbarBackground(.clear, for: .tabBar)
        .toolbarBackgroundVisibility(.visible, for: .tabBar)
    }
}
#Preview {
    ContactsDetailsView(contact: Contact.sampleData[0])
}
