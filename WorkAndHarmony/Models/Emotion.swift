//
//  Type.swift
//  WorkAndHarmony
//
//  Created by Apprenant 39 on 11/12/2024.
//

import Foundation
import SwiftUI

enum Emotion: String, CaseIterable, Codable {
    case stress
    case mentalLoad
    case anxiety
    
    var label: String {
        switch self {
            case .stress: return "Stress"
            case .mentalLoad: return "Charge mentale"
            case .anxiety: return "Anxiété"
        }
    }
    
    var color: Color {
        switch self {
            case .stress: return Color("Crimson")
            case .mentalLoad: return Color("Marine")
            case .anxiety: return Color("Charcoal")
        }
    }
}
