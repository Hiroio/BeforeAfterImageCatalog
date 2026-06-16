//
//  TestImageDragApp.swift
//  TestImageDrag
//
//  Created by user on 15.06.2026.
//

import SwiftUI

@main
struct TestImageDragApp: App {
  @State private var navigatioManager = NavigationManager.shared
    var body: some Scene {
        WindowGroup {
            NavigationView()
				.environment(navigatioManager)
        }
    }
}
