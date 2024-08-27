//
//  inputScore.swift
//  molkkyapp
//
//  Created by 井久保春雅 on 2024/08/21.
//

import SwiftUI

struct inputScore: View {
    
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
    
    @State var turnSelect = 0
    @State var nowScore:[Int] = [0,0,0,0]
//    後からscoreDisplayからもらう変数にする
    @State private var resultScore:[[Int]] = [
        [],[],[],[]
    ]
    
    var body: some View {
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
                print(nowScore)
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
        if fukusu >= 2 {
            nowScore[turnSelect] += fukusu
            resultScore[turnSelect] += [fukusu]
            print(fukusu)
            fukusu = 0
            for tate in 0..<ButtonStates.count {
                for yoko in 0..<ButtonStates[tate].count {
                    ButtonStates[tate][yoko] = false
                }
            }
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
            nowScore[turnSelect] += ippon
            resultScore[turnSelect] += [ippon]
            print(ippon)
            print(resultScore[turnSelect])
            ippon = 0
            fukusu = 0
            turnSelectCount()
        } else {
            print("ボタンを押してね")
        }
    }
    
    func returnAction() {
        if turnSelect == 0 && nowScore[3] > 0 {
            nowScore[3] -= resultScore[3][resultScore[3].count - 1]
            turnSelect = 3
            print(nowScore)
            print("turnSelectは\(turnSelect)")
        } else if turnSelect >= 1 {
            nowScore[turnSelect - 1] -= resultScore[turnSelect - 1][resultScore[turnSelect - 1].count - 1]
            turnSelect -= 1
            print(nowScore)
            print("turnSelectは\(turnSelect)")
        } else {
            print("なんもないよ")
        }
    }
    
    
    func turnSelectCount() {
        if turnSelect >= 3 {
            turnSelect = 0
            print("turnSelectは\(turnSelect)")
        } else if 3 > turnSelect {
            turnSelect += 1
            print("turnSelectは\(turnSelect)")
        }
    }
    
}

#Preview {
    inputScore()
}
