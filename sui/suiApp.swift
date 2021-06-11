//
//  suiApp.swift
//  sui
//
//  Created by Joseph Chung on 5/24/21.
//

import SwiftUI

@main
struct suiApp: App {
    
    @State var pageIndex = 1
    
    var body: some Scene {
        WindowGroup {
            TabView(selection: $pageIndex) {
                TestCollection().tag(0)
                CardStack().tag(1)
                Tester123().tag(2)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
    }
}
