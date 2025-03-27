//
//  CoordinatorStackDemoApp.swift
//  CoordinatorStackDemo
//
//  Created by Yogesh Raj on 26/03/25.
//

import SwiftUI
import SwiftUICoordinator

@main
struct CoordinatorStackDemoApp: App {
    var body: some Scene {
        WindowGroup {
            CoordinatorStack(MainCoordinatorViews.root)
        }
    }
}
