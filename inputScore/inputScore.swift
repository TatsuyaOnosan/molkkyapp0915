//
//  inputScore.swift
//  molkkyapp
//
//  Created by 井久保春雅 on 2024/08/21.
//

import SwiftUI

struct inputScore: View {
    
    @EnvironmentObject var shareData: ShareData
    
    let skittleCount = [3,4,3,2]
    
    let skittleNumber = [
        [7,9,8],
        [5,11,12,6],
        [3,10,4],
        [1,2]
    ]
    
    @State private var ButtonStates = [
        [false,false,false],
        [false,false,false,false],
        [false,false,false],
        [false,false]
    ]
        
    @State private var ippon = 0
    @State private var fukusu = 0
    @State private var delete = 0
    
    @Binding var numberOfTeams:Int
    
    @Binding var showWinView:Bool

    @Binding var turnSelect:Int
    
    @State var currentTeam = []
    
//    @Binding var missShot:[[Bool]]
    
    var body: some View {
        VStack {
            VStack(spacing:0) {
                ForEach(0...3, id:\.self) {tate in
                    HStack {
                        ForEach(0..<skittleCount[tate], id:\.self) { yoko in
                            Button(action: {
                                    skittleSelect(tate: tate, yoko: yoko)
                            }, label: {
                                ZStack {
                                    Circle()
                                        .frame(width: 80, height: 80)
                                        .foregroundColor(.yellow)
                                    Text("\(skittleNumber[tate][yoko])")
                                        .font(.system(size: 60))
                                        .foregroundStyle(ButtonStates[tate][yoko] ? .black : .white)
                                }
                            })
                        }
                    }
                }
            }
            HStack {
                Button(action: {
                    returnAction()
                    print("turnSelectは\(turnSelect)")
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25.0)
                            .stroke(Color.black,lineWidth: 1.0)
                            .frame(width: 150, height: 50)
                            .foregroundColor(.white)
                        Text("戻る")
                            .foregroundColor(.black)
                    }
                            .padding()
                            .padding(.leading,10)
                })
                Spacer()
                Button(action: {
                    confirmAction()
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25.0)
                            .frame(width: 150, height: 50)
                            .foregroundColor(.green)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25.0).stroke(Color.black,lineWidth:1.0))
                        Text("決定")
                            .foregroundColor(.black)
                    }
                        .padding()
                        .padding(.trailing,10)

                })
            }
        }
    }
    
    func skittleSelect(tate: Int,yoko: Int) {
        if ButtonStates[tate][yoko] == false {
            fukusu += 1
            ButtonStates[tate][yoko].toggle()
        } else if ButtonStates[tate][yoko] == true {
            fukusu -= 1
            ButtonStates[tate][yoko].toggle()
        }
    }
    
    func confirmAction() {
        
        var currentTeam = shareData.teams[turnSelect]
        
        if fukusu >= 2 {
            currentTeam.nowScore += fukusu
            currentTeam.resultScore += [fukusu]
            fukusu = 0
            for tate in 0..<ButtonStates.count {
                for yoko in 0..<ButtonStates[tate].count {
                    ButtonStates[tate][yoko] = false
                }
            }
            print(currentTeam.nowScore)
            missShotReset()
            scoreCheck()
            turnSelectCount()
        } else if fukusu == 1 {
            for tate in 0..<ButtonStates.count {
                for yoko in 0..<ButtonStates[tate].count {
                    if ButtonStates[tate][yoko] == true {
                        ippon = skittleNumber[tate][yoko]
                        ButtonStates[tate][yoko] = false
                    }
                }
            }
            currentTeam.nowScore += ippon
            currentTeam.resultScore.append(ippon)
            ippon = 0
            fukusu = 0
            print(currentTeam.nowScore)
            missShotReset()
            scoreCheck()
            turnSelectCount()
        } else {
            if let firstFalseIndex = currentTeam.missShot.firstIndex(where: {$0 == false}) {
                currentTeam.missShot[firstFalseIndex] = true
                
                if currentTeam.missShot.allSatisfy({ $0 == true}) {
                    if currentTeam.nowScore <= 10 {
                        currentTeam.resultScore.append(-currentTeam.nowScore)
                        currentTeam.nowScore = 0
                        for missReset in 0...2 {
                            currentTeam.missShot[missReset] = false
                        }
                    } else {
                        currentTeam.nowScore -= 10
                        currentTeam.resultScore.append(-10)
                        for missReset in 0...2 {
                            currentTeam.missShot[missReset] = false
                        }
                }
                turnSelectCount()
                } else {
                    currentTeam.resultScore += [0]
                    turnSelectCount()
                }
            } else {

            }
//            missShot[turnSelect][0] = true
//            turnSelectCount()
        }
    }
    
    func returnAction() {
        
        if turnSelect == 0 && shareData.teams[numberOfTeams].resultScore.count > 0 {
            
            var resultScore = shareData.teams[numberOfTeams].resultScore
            var nowScore = shareData.teams[numberOfTeams].nowScore
            var missShot = shareData.teams[numberOfTeams].missShot
            
            nowScore -= resultScore[resultScore.count - 1]
            
            if let lastScore = resultScore.last, lastScore <= -25 {
                delete = resultScore.removeLast()
                nowScore -= resultScore[resultScore.count - 1]
            }
            
            if let lastScore = resultScore.last, lastScore <= 0 {
                
                if missShot.allSatisfy({$0 == false}) {
                    missShot = [true,true,false]
                    
                } else if let firstFalseIndex = missShot.firstIndex(where: {$0 == false}) {
                    missShot[firstFalseIndex - 1] = false
                }
            } else {
                
            }
            
            delete = resultScore.removeLast()
            turnSelect = numberOfTeams
            
        } else if turnSelect >= 1 && shareData.teams[turnSelect - 1].resultScore.count > 0 {
            
            var nowScore = shareData.teams[turnSelect - 1].nowScore
            var resultScore = shareData.teams[turnSelect - 1].resultScore
            var missShot = shareData.teams[turnSelect - 1].missShot
            
            nowScore -= resultScore[resultScore.count - 1]
            
            if let lastScore = resultScore.last, lastScore <= -25 {
                delete = resultScore.removeLast()
                nowScore -= resultScore[resultScore.count - 1]
            }

            
            if let lastScore = resultScore.last, lastScore <= 0 && -10 <= lastScore {
                
                if missShot.allSatisfy({$0 == false}) {
                    missShot = [true,true,false]
                    
                } else if let firstFalseIndex = missShot.firstIndex(where: {$0 == false}) {
                    missShot[firstFalseIndex - 1] = false
                }
            } else {
                
            }
            delete = resultScore.removeLast()
            turnSelect -= 1
            
        } else {
            print("なんもないよ")
        }
    }
    
    
    func turnSelectCount() {
        if turnSelect == numberOfTeams {
            turnSelect = 0
            print("turnSelectは\(turnSelect)")
        } else if numberOfTeams > turnSelect {
            turnSelect += 1
            print("turnSelectは\(turnSelect)")
        }
    }
    
    func scoreCheck() {
        if shareData.teams[turnSelect].nowScore == 50 {
            showWinView.toggle()
        } else if shareData.teams[turnSelect].nowScore >= 51 {
            shareData.teams[turnSelect].resultScore += [25 - shareData.teams[turnSelect].nowScore]
            shareData.teams[turnSelect].nowScore = 25
        } else {
            
        }
    }
    
    func missShotReset() {
        for reset in 0...2 {
            shareData.teams[turnSelect].missShot[reset] = false
        }
    }
    
}

#Preview {
    inputScore(numberOfTeams: .constant(1),
               showWinView: .constant(false),
               turnSelect: .constant(2)
//               nowScore: .constant([0,0]),
//               totalScore: .constant([0,0]),
//               resultScore: .constant([[0],[0]]),
//               missShot: .constant([[false,false,false],[false,false,false]])
    )
    .environmentObject(ShareData())
}
