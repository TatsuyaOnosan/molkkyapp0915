//
//  number_of_teams.swift
//  molkkyapp
//
//  Created by 井久保春雅 on 2024/08/19.
//

import SwiftUI

struct input_team_names: View {
    
    @EnvironmentObject var shareData: ShareData
    
    @State private var teamNameLimit = 9
    
    @State private var startGame = false
    
    @Binding var numberOfTeams:Int
    
//    @Binding var inputTeamNames:[String]
    
//    @Binding var nowScore:[Int]
//    @Binding var totalScore:[Int]
//    @Binding var resultScore:[[Int]]
//    
//    @Binding var missShot:[[Bool]]
    
    @Binding var gameResult:[Int]
    
    var body: some View {
        
        VStack {
            if startGame {
                VS_View(numberOfTeams: $numberOfTeams,
//                        teamNames: $inputTeamNames,
//                        nowScore: $nowScore,
//                        totalScore: $totalScore,
//                        resultScore: $resultScore,
//                        missShot: $missShot,
                        gameResult: $gameResult
                )
            } else {
                if shareData.teams.count > 0 {
                    
                    VStack {
                        ForEach(0...numberOfTeams,id:\.self) { inputName in
                            TextField("チーム名を入力してください",text: $shareData.teams[inputName].name)
                                .padding()
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .onChange(of: shareData.teams[inputName].name) {
                                    if shareData.teams[inputName].name.count > teamNameLimit {
                                        shareData.teams[inputName].name = String(shareData.teams[inputName].name.prefix(teamNameLimit))
                                    }
                                }
                        }
                        
                        Button(action: {
                                if allFieldsFilled() {
                                    
                                    startGame.toggle()
                                } else {
                                    print("チーム名を入力してね")
                                }
                        }, label: {
                            Text("対戦開始")
                        })
                        .disabled(!allFieldsFilled())
                    }
                }
            }
        }
    }
    
    func allFieldsFilled() -> Bool {
        return shareData.teams.allSatisfy { !$0.name.isEmpty}
    }
    
}

#Preview {
    input_team_names(numberOfTeams: .constant(1),
//                     inputTeamNames: .constant(["キングオブモルック","コンクルスス"]),
//                     nowScore: .constant([0,0]),
//                     totalScore: .constant([0,0]),
//                     resultScore: .constant([[],[]]),
//                     missShot: .constant([[false,false,false,],[false,false,false]]),
                     gameResult: .constant([0,0])
    )
    .environmentObject(ShareData())
}
