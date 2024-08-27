//
//  VS_View.swift
//  molkkyapp
//
//  Created by 井久保春雅 on 2024/08/22.
//

import SwiftUI

struct VS_View: View {
    
    @Binding var teamNames: [String]
    
    var body: some View {
        VStack {
            scoreDisplay(teamNames:$teamNames)
            inputScore()
        }
    }
}

#Preview {
    VS_View(teamNames: .constant(["キングオブモルック","俺"]))
}
