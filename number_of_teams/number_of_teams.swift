//
//  number_of_teams.swift
//  molkkyapp
//
//  Created by 井久保春雅 on 2024/08/19.
//

import SwiftUI

struct number_of_teams: View {
    
    @EnvironmentObject var shareData: ShareData
    
    @State var numberOfTeams:Int = 0
    
    @State private var goToNextPage = false
    
//    @State var inputTeamNames:[String] = []
//    
//    @State var nowScore:[Int] = []
//    @State var totalScore:[Int] = []
//    @State var resultScore:[[Int]] = []
//    
//    @State var missShot:[[Bool]] = []
    
    
    @State var gameResult:[Int] = []
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                Text("何人で遊ぶんだい？")
                    .padding()

                ForEach(0...3,id:\.self) {team in
                    ZStack {
                        Button(action: {
                            numberOfTeams = team
                            
                            for edit in 0...team {
                                shareData.teams += [TeamData(name: "チーム\(edit + 1)", nowScore: 0, totalScore: 0, resultScore: [0], missShot: [false,false,false], setPoint: 0)]
                            }
                            
//                                nowScore = Array(repeating: 0, count: numberOfTeams)
//                                totalScore = Array(repeating: 0, count: numberOfTeams)
//                                missShot = Array(repeating: [false,false,false], count: numberOfTeams)
//                                resultScore = Array(repeating:[], count:numberOfTeams)
//                                inputTeamNames = Array(repeating: "モルック",count: numberOfTeams)
//                                gameResult = Array(repeating: 0, count: numberOfTeams)
                            
                            goToNextPage.toggle()
                        }, label: {
                            Text("\(team + 1)人で遊ぶ")
                                .padding()
                                .background(.green)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        })
                        .padding()
                        }
                }
            }
            .navigationDestination(isPresented: $goToNextPage) {
                input_team_names(numberOfTeams: $numberOfTeams,
                                    gameResult: $gameResult)
            }
            
            
//            NavigationLink(destination: input_team_names(numberOfTeams: $numberOfTeams,
//                                                         gameResult: $gameResult
//            ), isActive: $goToNextPage) {
//                
//            }
        }
        
//        VStack {
//            if goToNextPage {
//                input_team_names(numberOfTeams: $numberOfTeams,
////                                 inputTeamNames: $inputTeamNames,
////                                 nowScore: $nowScore,
////                                 totalScore: $totalScore,
////                                 resultScore: $resultScore,
////                                 missShot: $missShot,
//                                 gameResult: $gameResult
//                )
//            } else {
//                            
//              
//            }
//        }
    }
}


#Preview {
    number_of_teams()
        .environmentObject(ShareData())
}
