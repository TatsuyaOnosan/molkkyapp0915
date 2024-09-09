//
//  scoreDisplay.swift
//  molkkyapp
//
//  Created by 井久保春雅 on 2024/08/19.
//

import SwiftUI

struct scoreDisplay: View {
    
    @EnvironmentObject var shareData: ShareData

    let numberOfTeams:Int
    let turnSelect:Int
    
//    let teamNames: [String]
//
//    let nowScore:[Int]
//    let totalScore:[Int]
//    let missShot:[[Bool]]
    
    @State var gameCount = 1
    
    
    var body: some View {
        
        VStack(spacing:-5) {
            HStack {
                Text("チーム名")
                    .padding(.leading,1)
              
                Spacer()
                
                Text("ゲーム\(gameCount)")
                    .padding(.trailing, 15)

                Text("合計")
                    .padding(.trailing, 10)
            }
            .padding()
            
            if shareData.teams.count > 0 {
                ForEach(0...numberOfTeams,id:\.self) { team in
                    HStack {
                        VStack(alignment:.leading,spacing:5){
                            Text(shareData.teams[team].name)
                                .font(.system(size: 24))
                                .foregroundColor(turnSelect == team ? .yellow : .blue)

                            HStack{
                                ForEach(0...2,id:\.self) { miss in
                                    Circle()
                                        .frame(width: 10)
                                        .foregroundColor(shareData.teams[team].missShot[miss] == true ? .red : .white)
                                        .overlay(
                                            Circle().stroke(Color.black,lineWidth: 0.1)
                                        )
                                }
                            }
                            .padding(.leading,5)
                        }
                        .padding(.leading,20)
                        .frame(width: 240,alignment:.leading)
                        
//                        Spacer()
                        
                        Text("\(shareData.teams[team].nowScore)")
                            .padding(.trailing,10)
                            .font(.largeTitle)
                            .frame(width:70,alignment:.trailing)
                        
    //                    Spacer()
                        
                        Text("\(shareData.teams[team].totalScore)")
                            .padding(.trailing,20)
                            .font(.largeTitle)
                            .frame(width:70,alignment:.trailing)
                    }
                    Divider()
                        .padding()
                }
            } else {
                
            }
        }
        
        Spacer()
        
    }
}

#Preview {
    scoreDisplay(numberOfTeams:1,
                 turnSelect: 0
//                 teamNames: ["キングオブモルック","コンクルスス"],
//                 nowScore: [44,44],
//                 totalScore: [44,44],
//                 missShot: [[true,false,false],[false,false,false]]
    )
    .environmentObject(ShareData())
}

