//
//  You are win.swift
//  molkkyapp
//
//  Created by 井久保春雅 on 2024/08/10.
//

import SwiftUI

struct You_are_win: View {
    
    @State private var playNextGame = false
    @Binding var winner: Int
    @Binding var teamNames:[String]
    
    var body: some View {
        if playNextGame {
            VS_View(teamNames: $teamNames)
        } else {
            VStack {
                
                Spacer()
                    .padding()
                
                if winner == 1{
                    Text("チームBの勝利です！")
                            .font(.largeTitle)
                            .padding()
                } else if winner == 2 {
                    Text("チームAの勝利です！")
                            .font(.largeTitle)
                            .padding()
                } else {
                    Text("まだ勝負は終わっていない")
                }
                
                Spacer()
                    .padding()
                
                Button(action: {
                    playNextGame = true
                }, label: {
                    Text("次のゲームへ進む")
                        .padding()
                        .background(.green)
                        .foregroundColor(.white)
                        .cornerRadius(10.0)
                })
                Spacer()
                    .padding()
            }
            
        }
    }
}

#Preview {
    You_are_win(winner: .constant(1),
                teamNames: .constant(["キングオブモルック","おれ"])
    )
}
