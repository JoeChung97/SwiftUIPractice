//
//  suiApp.swift
//  sui
//
//  Created by Joseph Chung on 5/24/21.
//

import SwiftUI

@main
struct suiApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                CardStack()
                ContentView()
                Tester123()
            }
        }
    }
}
