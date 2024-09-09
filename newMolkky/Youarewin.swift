//
//  You are win.swift
//  molkkyapp
//
//  Created by 井久保春雅 on 2024/08/10.
//

import SwiftUI

struct You_are_win: View {
    
    @EnvironmentObject var shareData: ShareData
    
    @State private var playNextGame = false
    
    let numberOfTeams:Int
    
//    let teamNames:[String]
    
    @Binding var showWinView:Bool
//    @Binding var nowScore:[Int]
//    @Binding var resultScore:[[Int]]
//    @Binding var missShot:[[Bool]]
    @Binding var gameResult:[Int]
        
    var body: some View {
        
            VStack {
                
                Spacer()
                    .padding()
                
                if let first50 = shareData.teams.firstIndex(where:{$0.nowScore == 50}) {
                    
                    VStack(spacing:50) {
                        Text(shareData.teams[first50].name + "の勝利だ")
                        Text("本日の結果")
                        
                        ForEach(0...numberOfTeams,id:\.self) { display in
                            HStack {
                                Text(shareData.teams[display].name + "は\(gameResult[display])勝です")
                                    .font(.system(size:25))
                            }
                        }
                    }
                } else {
                    Text("まだ勝負は終わっていない")
                }
                
                Spacer()
                    .padding()
                
                Button(action: {
                    for reset in 0...numberOfTeams {
                        shareData.teams[reset].nowScore = 0
                        shareData.teams[reset].missShot = [false,false,false]
                        shareData.teams[reset].resultScore = []
                    }
                    showWinView = false
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
            .onAppear {
                if let first50 = shareData.teams.firstIndex(where:{ $0.nowScore == 50 }) {
                    gameResult[first50] += 1
                }
            }
    }
}

#Preview {
    You_are_win(numberOfTeams: 1,
//                teamNames: ["キングオブモルック","おれ"],
                showWinView: .constant(true),
//                nowScore: .constant([50,48]),
//                resultScore: .constant([[12,12,12,12,2],[12,12,12,12]]),
//                missShot: .constant([[false,false,false],[false,false,false]]),
                gameResult: .constant([3,2])
    )
    .environmentObject(ShareData())
}
