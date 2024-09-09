//
//  ContentView.swift
//  molkkyapp
//
//  Created by 井久保春雅 on 2024/07/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        @EnvironmentObject var shareData: ShareData
        
        TabView  {
            
            number_of_teams()
                .tabItem {
                    Image(systemName: "square.fill")
                }
            
            Text("Profile")
                .tabItem {
                    Image(systemName: "person.fill")
                }
        }

                .padding()
    }
}

#Preview {
    ContentView()
        .environmentObject(ShareData())
}
