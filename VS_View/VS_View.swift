//
//  VS_View.swift
//  molkkyapp
//
//  Created by 井久保春雅 on 2024/08/22.
//

import SwiftUI

struct VS_View: View {
    
    @EnvironmentObject var shareData: ShareData
    
    @State var showWinView = false
    
    @State var turnSelect = 0
    
    @Binding var numberOfTeams:Int
//    @Binding var teamNames: [String]
//    @Binding var nowScore: [Int]
//    @Binding var totalScore: [Int]
//    @Binding var resultScore: [[Int]]
//    @Binding var missShot: [[Bool]]
    @Binding var gameResult:[Int]

    
    var body: some View {
        VStack{
            if showWinView {
                You_are_win(numberOfTeams: numberOfTeams,
//                            teamNames: teamNames,
                            showWinView: $showWinView,
//                            nowScore: $nowScore,
//                            resultScore: $resultScore,
//                            missShot: $missShot,
                            gameResult: $gameResult
                )
            } else {
                VStack {
                    scoreDisplay(numberOfTeams: numberOfTeams,
                                 turnSelect: turnSelect
//                                 teamNames: teamNames,
//                                 nowScore: nowScore,
//                                 totalScore: totalScore,
//                                 missShot: missShot
                    )
                    inputScore(numberOfTeams: $numberOfTeams,
                               showWinView: $showWinView,
                               turnSelect: $turnSelect
//                               nowScore: $nowScore,
//                               totalScore: $totalScore,
//                               resultScore: $resultScore,
//                               missShot: $missShot
                    )
                }
            }
        }
    }
}

#Preview {
    VS_View(numberOfTeams: .constant(2),
//            teamNames: .constant(["キングオブモルック","俺"]),
//            nowScore: .constant([0,0]),
//            totalScore: .constant([0,0]),
//            resultScore: .constant([[0],[0]]),
//            missShot: .constant([[false,false,false],[false,false,false]]),
            gameResult: .constant([0,0])
    )
    .environmentObject(ShareData())
}
