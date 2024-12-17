//
//  WorkAndHarmonyApp.swift
//  WorkAndHarmony
//
//  Created by Apprenant 39 on 11/12/2024.
//

import SwiftUI
import SwiftData

@main
struct WorkAndHarmonyApp: App {
    var body: some Scene {
        WindowGroup {
            WorkAndHarmonyView()
                .modelContainer(for: Result.self)
        }
    }
    init() {
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
}

extension View {
    func Print(_ vars: Any...) -> some View {
        for v in vars { print(v) }
        return EmptyView()
    }
}
