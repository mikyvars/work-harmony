//
//  MapView.swift
//  WorkAndHarmony
//
//  Created by Apprenant 39 on 16/12/2024.
//

import MapKit
import SwiftUI

struct ContactsMapView: View {
    @State var selectedContact: Contact?
    
    var body: some View {
        VStack {
            HStack {
                Text("\(Contact.sampleData.count) résultats")
                    .font(.system(size: 14))
                
                Spacer()
            }
            
            MapReader { proxy in
                Map(selection: $selectedContact) {
                    ForEach(Contact.sampleData) { contact in
                        Marker("\(contact.firstName) \(contact.lastName)", coordinate: CLLocationCoordinate2D(latitude: contact.addressLatitude, longitude: contact.addressLongitude))
                            .tag(contact)
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .mapControlVisibility(.visible)
                .mapControls() {
                    MapUserLocationButton()
                }
            }
            
            if let selectedContact {
                NavigationLink {
                    ContactsDetailsView(contact: selectedContact)
                } label: {
                    ContactsRowView(contact: selectedContact)
                }
            }
            
            Spacer()
        }
        .padding()
        .background(Color("Background"))
        .toolbarBackground(.clear, for: .tabBar)
        .toolbarBackgroundVisibility(.visible, for: .tabBar)
    }
}

#Preview {
    NavigationStack {
        ContactsMapView()
    }
}
