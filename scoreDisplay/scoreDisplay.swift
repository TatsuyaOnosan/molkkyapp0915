//
//  scoreDisplay.swift
//  molkkyapp
//
//  Created by 井久保春雅 on 2024/08/19.
//

import SwiftUI

struct scoreDisplay: View {

    @Binding var teamNames: [String]

    @State var nowScore:[Int] = []
    @State var totalScore:[Int] = []
    @State var missShot:[Int] = []

    @State var gameCount = 1
    @State var turnSelect = 0
    
    var body: some View {
        
        VStack(spacing:-5) {
            HStack {
                Text("チーム名")
                    .padding(.leading,20)
              
                Spacer()
                
                Text("ゲーム\(gameCount)")
                    .padding(.trailing, 20)

                Text("合計")
                    .padding(.trailing, 20)
            }
            
            if teamNames.count > 0 && teamNames.count == nowScore.count {
                ForEach(0..<teamNames.count,id:\.self) { team in
                    HStack {
                        VStack(alignment:.leading,spacing:5){
                            Text(teamNames[team])
                                .font(.title)
                                .foregroundColor(turnSelect == team ? .yellow : .black)

                            HStack{
                                ForEach(0...2,id:\.self) { miss in
                                    Circle()
                                        .stroke(Color.black , lineWidth: 1)
                                        .frame(width: 10)
                                        .foregroundColor(.white)
                                }
                            }
                            .padding(.leading,5)
                        }
                        .padding(.leading,20)
                        .frame(width: 260,alignment:.leading)
                        
//                        Spacer()
                        
                        Text("\(nowScore[team])")
                            .padding()
                            .font(.largeTitle)
                        
    //                    Spacer()
                        
                        Text("\(totalScore[team])")
                            .padding(.trailing,20)
                            .font(.largeTitle)
                            .frame(width:60,alignment:.trailing)
                    }
                    Divider()
                }
            } else {
                
            }
        }
        
        Spacer()
        
        
        .onAppear {
            nowScore = Array(repeating: 0, count: teamNames.count)
            totalScore = Array(repeating: 0, count: teamNames.count)
            missShot = Array(repeating: 0, count: teamNames.count)
        }

    }
    
    
    
}

#Preview {
    scoreDisplay(teamNames: .constant(["キンクオブモルック","コンクルスス"]))
}

