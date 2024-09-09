////
////  molkkyScore.swift
////  molkkyapp
////
////  Created by 井久保春雅 on 2024/08/02.
////
//
//import SwiftUI
//
//struct molkkyScore: View {
//    @State private var teamA = 0
//    @State private var teamB = 0
//
//    @State private var ippon = 0
//    @State private var fukusu = 0
//    @State private var delete = 0
//    @State private var teamArireki : [Int] = [0]
//    @State private var teamBrireki : [Int] = [0]
//    
//    @State private var showWinView = false
//
//    let lane1All = [1,2]
//    let lane2All = [3,10,4]
//    let lane3All = [5,11,12,6]
//    let lane4All = [7,9,8,]
//    
//    @State private var lane1ButtonStates =  [false,false,]
//    @State private var lane2ButtonStates =  [false,false,false]
//    @State private var lane3ButtonStates =  [false,false,false,false]
//    @State private var lane4ButtonStates =  [false,false,false]
//    
//    @State var teamSelect: Int = 1
//
//    var body: some View {
//        if showWinView {
////            You_are_win(winner: $teamSelect)
//        } else {
//            VStack(spacing:-15) {
//                HStack {
//                    ForEach(0..<lane4ButtonStates.count,id:\.self) { index in
//                        Button(action: {
//                            if lane4ButtonStates[index] == false {
//                                fukusu += 1
//                                lane4ButtonStates[index] = true
//                            } else {
//                                fukusu -= 1
//                                lane4ButtonStates[index] = false
//                            }
//                        }, label: {
//                            ZStack{
//                                Circle()
//                                    .frame(width: 80, height: 80)
//                                    .foregroundColor(.yellow)
//                                Text("\(lane4All[index])")
//                                    .padding()
//                                    .font(.system(size: 60))
//                                    .background(lane4ButtonStates[index] ? .yellow : .yellow)
//                                    .foregroundColor(lane4ButtonStates[index] ? .black : .white)
//                                    .clipShape(Circle())
//                            }
//                                                    })
//                    }
//                }
//                
//                HStack {
//                    ForEach(0..<lane3ButtonStates.count,id:\.self) { index in
//                        Button(action: {
//                            if lane3ButtonStates[index] == false {
//                                fukusu += 1
//                                lane3ButtonStates[index] = true
//                            } else {
//                                fukusu -= 1
//                                lane3ButtonStates[index] = false
//                            }
//                        }, label: {
//                            ZStack {
//                                Circle()
//                                    .frame(width: 80, height: 80)
//                                    .foregroundColor(.yellow)
//                                Text("\(lane3All[index])")
//                                    .padding()
//                                    .font(.system(size: 50))
//                                    .foregroundColor(lane3ButtonStates[index] ? .black : .white)
//                            }
//                                               })
//                    }
//                }
//                
//                HStack {
//                    ForEach(0..<lane2ButtonStates.count,id:\.self) { index in
//                        Button(action: {
//                            if lane2ButtonStates[index] == false {
//                                fukusu += 1
//                                lane2ButtonStates[index].toggle()
//                            } else {
//                                fukusu -= 1
//                                lane2ButtonStates[index].toggle()
//                            }
//                        }, label: {
//                            ZStack {
//                                Circle()
//                                    .frame(width: 80, height: 80)
//                                    .foregroundColor(.yellow)
//                                Text("\(lane2All[index])")
//                                    .padding()
//                                    .font(.system(size:60))
//                                    .foregroundColor(lane2ButtonStates[index] ? .black : .white)
//                            }
//                        })}
//                }
//                
//                HStack {
//                    ForEach(0..<lane1ButtonStates.count, id:\.self) { index in
//                        Button(action: {
//                            if lane1ButtonStates[index] == false {
//                                fukusu += 1
//                                lane1ButtonStates[index].toggle()
//                            } else {
//                                fukusu -= 1
//                                lane1ButtonStates[index].toggle()
//                            }
//                        }, label: {
//                            ZStack {
//                                Circle()
//                                    .frame(width: 80, height: 80)
//                                    .foregroundColor(.yellow)
//                                Text(lane1ButtonStates[index] ? "\(lane1All[index])" : "\(lane1All[index])")
//                                    .padding()
//                                    .font(.system(size: 60))
//                                    .foregroundColor(lane1ButtonStates[index] ? .black : .white)
//
//                            }
//                        })
//                    }
//                }
//              
//                VStack {
//                    Spacer()
//                        .frame(width: 60, height: 60)
//
//                    HStack(spacing:30) {
//                        Button(action: {
//                            for lane1 in 0..<lane1ButtonStates.count {
//                                if teamSelect == 1 {
//                                    if fukusu >= 2 {
//                                        teamArireki += [fukusu]
//                                        teamA += fukusu
//                                        fukusu = 0
//                                        lane1ButtonStates[lane1] = false
//                                        teamSelect += 1
//                                        if teamA == 50 {
//                                            showWinView = true
//                                        } else if teamA >= 51 {
//                                            teamA = 25
//                                        }
//                                    } else if lane1ButtonStates[lane1] == true && fukusu == 1 {
//                                        teamArireki += [lane1 + 1]
//                                        teamA += lane1 + 1
//                                        fukusu = 0
//                                        lane1ButtonStates[lane1] = false
//                                        teamSelect += 1
//                                        if teamA == 50 {
//                                            showWinView = true
//                                        } else if teamA >= 51 {
//                                            teamA = 25
//                                        }
//                                    } else {
//                                        lane1ButtonStates[lane1] = false
//                                    }
//                                } else if teamSelect == 2 {
//                                    if fukusu >= 2 {
//                                        teamBrireki += [fukusu]
//                                        teamB += fukusu
//                                        fukusu = 0
//                                        lane1ButtonStates[lane1] = false
//                                        teamSelect -= 1
//                                        if teamB == 50 {
//                                            showWinView = true
//                                        } else if teamB >= 51 {
//                                            teamB = 25
//                                        }
//                                    } else if lane1ButtonStates[lane1] == true && fukusu == 1 {
//                                        teamBrireki += [lane1 + 1]
//                                        teamB += lane1 + 1
//                                        fukusu = 0
//                                        lane1ButtonStates[lane1] = false
//                                        teamSelect -= 1
//                                        if teamB == 50 {
//                                            showWinView = true
//                                        } else if teamB >= 51 {
//                                            teamB = 25
//                                        }
//                                    } else {
//                                        lane1ButtonStates[lane1] = false
//                                    }
//                                }
//
//                                }
//                            
//                            for i in 0..<lane2ButtonStates.count {
//                                if teamSelect == 1 {
//                                    if fukusu >= 2 {
//                                        teamArireki += [fukusu]
//                                        teamA = fukusu
//                                        fukusu = 0
//                                        lane2ButtonStates[i] = false
//                                        teamSelect += 1
//                                        if teamA == 50 {
//                                            showWinView = true
//                                        } else if teamA >= 51 {
//                                            teamA = 25
//                                        }
//                                    } else if lane2ButtonStates[i] == true && fukusu == 1 {
//                                        teamArireki += [lane2All[i]]
//                                        teamA += lane2All[i]
//                                        fukusu = 0
//                                        lane2ButtonStates[i] = false
//                                        teamSelect += 1
//                                        if teamA == 50 {
//                                            showWinView = true
//                                        } else if teamA >= 51 {
//                                            teamA = 25
//                                        }
//                                    } else {
//                                        lane2ButtonStates[i] = false
//                                    }
//                                } else if teamSelect == 2 {
//                                    if fukusu >= 2 {
//                                        teamBrireki += [fukusu]
//                                        teamB = fukusu
//                                        fukusu = 0
//                                        lane2ButtonStates[i] = false
//                                        teamSelect -= 1
//                                        if teamB == 50 {
//                                            showWinView = true
//                                        } else if teamB >= 51 {
//                                            teamB = 25
//                                        }
//                                    } else if lane2ButtonStates[i] == true && fukusu == 1 {
//                                        teamBrireki += [lane2All[i]]
//                                        teamB += lane2All[i]
//                                        fukusu = 0
//                                        lane2ButtonStates[i] = false
//                                        teamSelect -= 1
//                                        if teamB == 50 {
//                                            showWinView = true
//                                        } else if teamA >= 51 {
//                                            teamB = 25
//                                        }
//                                    } else {
//                                        lane2ButtonStates[i] = false
//                                    }
//
//                                }
//                            }
//                             
//                            for i in 0..<lane3ButtonStates.count {
//                                if teamSelect == 1 {
//                                    if fukusu >= 2 {
//                                        teamArireki += [fukusu]
//                                        teamA += fukusu
//                                        lane3ButtonStates[i] = false
//                                        teamSelect += 1
//                                        if teamA == 50 {
//                                            showWinView = true
//                                        } else if teamA >= 51 {
//                                            teamA = 25
//                                        }
//                                    } else if lane3ButtonStates[i] == true && fukusu == 1 {
//                                        teamArireki += [lane3All[i]]
//                                        teamA += lane3All[i]
//                                        fukusu = 0
//                                        lane3ButtonStates[i] = false
//                                        teamSelect += 1
//                                        if teamA == 50 {
//                                            showWinView = true
//                                        } else if teamA >= 51 {
//                                            teamA = 25
//                                        }
//                                    } else {
//                                        lane3ButtonStates[i] = false
//                                    }
//                                } else if teamSelect == 2 {
//                                    if fukusu >= 2 {
//                                        teamBrireki += [fukusu]
//                                        teamB += fukusu
//                                        lane3ButtonStates[i] = false
//                                        teamSelect -= 1
//                                        if teamB == 50 {
//                                            showWinView = true
//                                        } else if teamA >= 51 {
//                                            teamB = 25
//                                        }
//                                    } else if lane3ButtonStates[i] == true && fukusu == 1 {
//                                        teamBrireki += [lane3All[i]]
//                                        teamB += lane3All[i]
//                                        fukusu = 0
//                                        lane3ButtonStates[i] = false
//                                        teamSelect -= 1
//                                        if teamB == 50 {
//                                            showWinView = true
//                                        } else if teamB >= 51 {
//                                            teamB = 25
//                                        }
//                                    } else {
//                                        lane3ButtonStates[i] = false
//                                    }
//
//                                }
//                            }
//                            
//                            for i in 0..<lane4ButtonStates.count {
//                                if teamSelect == 1 {
//                                    if fukusu >= 2 {
//                                        teamArireki += [fukusu]
//                                        teamA += fukusu
//                                        lane4ButtonStates[i] = false
//                                        teamSelect += 1
//                                        if teamA == 50 {
//                                            showWinView = true
//                                        } else if teamA >= 51 {
//                                            teamA = 25
//                                        }
//                                    } else if lane4ButtonStates[i] == true && fukusu == 1 {
//                                        teamArireki += [lane4All[i]]
//                                        teamA += lane4All[i]
//                                        fukusu = 0
//                                        lane4ButtonStates[i] = false
//                                        teamSelect += 1
//                                        if teamA == 50 {
//                                            showWinView = true
//                                        } else if teamA >= 51 {
//                                            teamA = 25
//                                        }
//                                    } else {
//                                        lane4ButtonStates[i] = false
//                                    }
//
//                                } else if teamSelect == 2{
//                                    if fukusu >= 2 {
//                                        teamBrireki += [fukusu]
//                                        teamB += fukusu
//                                        lane4ButtonStates[i] = false
//                                        teamSelect -= 1
//                                        if teamB == 50 {
//                                            showWinView = true
//                                        } else if teamB >= 51 {
//                                            teamB = 25
//                                        }
//                                    } else if lane4ButtonStates[i] == true && fukusu == 1 {
//                                        teamBrireki += [lane4All[i]]
//                                        teamB += lane4All[i]
//                                        fukusu = 0
//                                        lane4ButtonStates[i] = false
//                                        teamSelect -= 1
//                                        if teamB == 50 {
//                                            showWinView = true
//                                        } else if teamB >= 51 {
//                                            teamB = 25
//                                        }
//                                    } else {
//                                        lane4ButtonStates[i] = false
//                                    }
//
//                                }
//                            }
//                            
//                        }, label: {
//                            Text("実行")
//                                .padding()
//                                .background(.green)
//                                .foregroundColor(.white)
//                                .cornerRadius(10.0)
//                        })
//                        
//                        Button(action: {
//                            if teamSelect == 1 {
//                                if teamBrireki[teamBrireki.count - 1] >= 1 {
//                                    teamB -= teamBrireki[teamBrireki.count - 1]
//                                    delete = teamBrireki.removeLast()
//                                    teamSelect += 1
//                                } else {
//                                    
//                                }
//
//                            } else if teamSelect == 2 {
//                                if teamArireki[teamArireki.count - 1] >= 1 {
//                                    teamA -= teamArireki[teamArireki.count - 1]
//                                    delete = teamArireki.removeLast()
//                                    teamSelect -= 1
//                                } else {
//                                    
//                                }
//
//                            }
//                        }, label: {
//                            Text("取消")
//                                .padding()
//                                .background(.red)
//                                .foregroundColor(.white)
//                                .cornerRadius(10.0)
//                        })
//                    }
//                }
//                
//                VStack(spacing:20) {
//                    Spacer()
//                    
//                    if teamSelect == 1 {
//                        Text("先ほどのスコアは \(teamBrireki[teamBrireki.count - 1]) です")
//
//                    } else if teamSelect == 2 {
//                        Text("先ほどのスコアは \(teamArireki[teamArireki.count - 1]) です")
//                    }
//                    Text("今取り消したスコアは\(delete)です")
//                    
//                    if teamSelect == 1 {
//                        Text("今のターンはチームAです")
//                    } else if teamSelect == 2 {
//                        Text("今のターンはチームBです")
//                    } else {
//                        Text("今のteamSelectのなかみは\(teamSelect)です")
//                    }
//                    
//                    Text("チームAのスコアは\(teamA)です")
//                        .font(.largeTitle)
//                    
//                    Text("チームBのスコアは\(teamB)です")
//                        .font(.largeTitle)
//                    
//                    Spacer()
//                        .frame(width: 10, height: 10)
//                }
//            }
//        }
//    }
//}
//
//#Preview {
//    molkkyScore()
//}
