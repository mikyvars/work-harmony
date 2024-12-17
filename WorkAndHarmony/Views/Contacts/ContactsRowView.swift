//
//  ContactsRowView.swift
//  WorkAndHarmony
//
//  Created by Apprenant 39 on 16/12/2024.
//

import SwiftUI

struct ContactsRowView: View {
    var contact: Contact
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .bottom) {
                Image(contact.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 70, height: 70)
                    .clipShape(Circle())
                
                VStack(alignment: .leading) {
                    Text("\(contact.firstName) \(contact.lastName)")
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Text(contact.speciality)
                        .font(.subheadline)
                        .padding(.bottom)
                }
                Spacer()
            }
            
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "phone")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16, height: 16)
                        .foregroundColor(.blue)
                    Text(contact.phone)
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
            }
            
            HStack (alignment: .bottom){
                Image(systemName: "map")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                    .foregroundColor(.blue)
                Text(contact.address)
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
           
            
        }
        .padding(20)
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        
    }
}

#Preview {
    ContactsRowView(contact: Contact.sampleData[0])
        .padding()
}
