//
//  molkkyappApp.swift
//  molkkyapp
//
//  Created by 井久保春雅 on 2024/07/24.
//

import SwiftUI

@main
struct molkkyappApp: App {
    
    var shareData = ShareData()
    
    var body: some Scene {
        
        WindowGroup {
            ContentView()
                .environmentObject(shareData)
        }
    }
}
