//
//  Contact.swift
//  WorkAndHarmony
//
//  Created by Apprenant 39 on 11/12/2024.
//
import Foundation

struct Contact: Identifiable, Hashable {
    var id = UUID()
    var firstName: String
    let lastName: String
    var speciality: String
    var phone: String
    var address: String
    var addressLatitude: Double
    var addressLongitude: Double
    var skills: [String]
    var schedules: [String]
    var fees: [String]
    var image: String
}

extension Contact {
    static let emptyContact: Contact = Contact(id: UUID(), firstName: "", lastName: "", speciality: "", phone: "", address: "", addressLatitude: 0, addressLongitude: 0, skills: [], schedules: [], fees: [], image: "")
    
    static let sampleData: [Contact] = [
        Contact (id: UUID(), firstName: "Jane", lastName: "Doe", speciality: "Psychiatrist" ,phone: "+33 689 55 87 55", address: "2 Rue Raymond Lizop, 31000, Toulouse", addressLatitude: 43.567259, addressLongitude: 1.398521, skills: ["Apnée du sommeil", "Insomnie", "Psychologie"], schedules: [
            "Lundi: 8h à 12h et 14h à 19h",
            "Mardi: 8h à 12h et 14h à 19h",
            "Mercredi: 8h à 12h",
            "Jeudi: 8h à 12h et 14h à 19h",
            "Vendredi: 8h à 12h et 14h à 19h",
            "Samedi: 8h à 12h et 14h à 19h"
        ], fees: ["Chèques, espèces et carte bancaire", "Secteur 1", "Carte vitale acceptée"], image: "doctor4"),
        
        Contact (id: UUID(), firstName: "Léo", lastName: "Rodriguez", speciality: "Psychologist", phone: "+33 656 55 45 56", address: "1 Rue de la Résistance, 31000, Toulouse", addressLatitude: 43.603895, addressLongitude: 1.443370, skills: ["Apnée du sommeil", "Insomnie", "Psychologie"], schedules: [
            "Lundi: 8h à 12h et 14h à 19h",
            "Mardi: 8h à 12h et 14h à 19h",
            "Mercredi: 8h à 12h",
            "Jeudi: 8h à 12h et 14h à 19h",
            "Vendredi: 8h à 12h et 14h à 19h",
            "Samedi: 8h à 12h et 14h à 19h"
        ], fees: ["Chèques, espèces et carte bancaire", "Secteur 1", "Carte vitale acceptée"], image: "doctor1"),
        
        Contact (id: UUID(), firstName: "Pascal", lastName: "Coutu", speciality: "Psychologist", phone: "+33 622 66 45 89", address: "20 rue de la république, 31500 Toulouse", addressLatitude: 43.598651, addressLongitude: 1.435646, skills: ["Apnée du sommeil", "Insomnie", "Psychologie"], schedules: [
            "Lundi: 8h à 12h et 14h à 19h",
            "Mardi: 8h à 12h et 14h à 19h",
            "Mercredi: 8h à 12h",
            "Jeudi: 8h à 12h et 14h à 19h",
            "Vendredi: 8h à 12h et 14h à 19h",
            "Samedi: 8h à 12h et 14h à 19h"
        ], fees: ["Chèques, espèces et carte bancaire", "Secteur 1", "Carte vitale acceptée"], image: "doctor2"),
        
        Contact (id: UUID(), firstName: "Vincent", lastName: "Boudinar", speciality: "Psychologist", phone: "+33 676 88 00 22", address: "12 Saint-Denis, 31200 Toulouse", addressLatitude: 43.585754, addressLongitude: 1.449213, skills: ["Apnée du sommeil", "Insomnie", "Psychologie"], schedules: [
            "Lundi: 8h à 12h et 14h à 19h",
            "Mardi: 8h à 12h et 14h à 19h",
            "Mercredi: 8h à 12h",
            "Jeudi: 8h à 12h et 14h à 19h",
            "Vendredi: 8h à 12h et 14h à 19h",
            "Samedi: 8h à 12h et 14h à 19h"
        ], fees: ["Chèques, espèces et carte bancaire", "Secteur 1", "Carte vitale acceptée"], image: "doctor6"),
        
        Contact (id: UUID(), firstName: "Morgane", lastName: "Floquart", speciality: "Psychiatrist", phone: "+33 234 22 45 99", address: "14 avenue des Champs-Élysées, 31300 Toulouse", addressLatitude: 43.6043, addressLongitude: 1.4437, skills: ["Apnée du sommeil", "Insomnie", "Psychologie"], schedules: [
            "Lundi: 8h à 12h et 14h à 19h",
            "Mardi: 8h à 12h et 14h à 19h",
            "Mercredi: 8h à 12h",
            "Jeudi: 8h à 12h et 14h à 19h",
            "Vendredi: 8h à 12h et 14h à 19h",
            "Samedi: 8h à 12h et 14h à 19h"
        ], fees: ["Chèques, espèces et carte bancaire", "Secteur 1", "Carte vitale acceptée"], image: "doctor3"),
    ]
}
