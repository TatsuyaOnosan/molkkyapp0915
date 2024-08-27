//
//  ContentView.swift
//  molkkyapp
//
//  Created by 井久保春雅 on 2024/07/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        HStack {
//            Image(systemName:"house")
//            Image(systemName:"globe")
//            Rectangle ()
//                .frame(width: 5, height: 20)
//                .foregroundColor(.brown)
//            Rectangle ()
//                .frame(width: 5, height: 20)
//                .foregroundColor(.brown)
//            Image(systemName: "list.bullet.rectangle.portrait")
//            Image(systemName: "person.fill")
//        }
        
        TabView  {
            Text("HOME")
                .tabItem {
                    Image(systemName: "house")
                }
                .padding(.top,50)
            
            Text("MAP")
                .tabItem {
                    Image(systemName: "map")
                }
            
            number_of_teams()
                .tabItem {
                    Image(systemName: "square.fill")
                }
            
            Text("お前の歴史だ！")
                .tabItem {
                    Image(systemName: "list.bullet.rectangle.portrait")
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
}
