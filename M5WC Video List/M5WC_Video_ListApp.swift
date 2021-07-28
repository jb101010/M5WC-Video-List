//
//  M5WC_Video_ListApp.swift
//  M5WC Video List
//
//  Created by JB on 2021-07-28.
//

import SwiftUI

@main
struct M5WC_Video_ListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ContentModel())
        }
    }
}
