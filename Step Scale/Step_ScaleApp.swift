//
//  Step_ScaleApp.swift
//  Step Scale
//
//  Created by Marcello Gonzatto Birkan on 27/04/24.
//

import SwiftUI

@main
struct Step_ScaleApp: App {
  let hkManager = HealthKitManager()
  
    var body: some Scene {
        WindowGroup {
            DashboardView()
            .environment(hkManager)
        }
    }
}
