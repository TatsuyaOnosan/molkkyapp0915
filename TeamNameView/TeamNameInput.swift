//
//  ScoreView.swift
//  KingOfMolkky
//
//  Created by Tatsuya Ono on 2024/08/25.
//

import SwiftUI

struct ScoreView: View {
    @State var shareData = ShareData()
    
    @State private var teamInfo: [(TeamNumber: String, TeamName: String)] = [
        ("チーム1", "小野 竜弥"), ("チーム2", ""), ("チーム3", ""),
        ("チーム4", ""), ("チーム5", ""), ("チーム6", "")
    ]
    
    var body: some View {
        ZStack {
            Color("gray5")
                .ignoresSafeArea()
            
            VStack(spacing: 24) {
                
                VStack(spacing: 16) {
                    ForEach(0..<2) { team1 in
                        HStack(spacing: 16) {
                            ForEach(0..<3) { team2 in
                                ZStack {
                                    Color(teamInfo[team2 + team1 * 3].TeamName.isEmpty ? Color.white : Color("SkittleBackground"))
                                        .frame(width: 100, height: 54)
                                        .cornerRadius(8)
                                    
                                    Text(teamInfo[team2 + team1 * 3].TeamNumber)
                                        .foregroundColor(teamInfo[team2 + team1 * 3].TeamName.isEmpty ? Color("gray100") : Color("SkittleFont"))
                                }
                            }
                        }
                    }
                }
                .padding(.top, 16)
                
                VStack(spacing: 8) {
                    ForEach(0..<6) { index in
                        VStack(spacing: 0) {
                            if(index == 0) {
                                Text(teamInfo[index].TeamNumber + " (あなた)")
                                    .frame(maxWidth:.infinity, alignment: .leading)
                                    .font(.system(size: 17))
                                    .foregroundColor(Color("gray100"))
                                
                            } else {
                                Text(teamInfo[index].TeamNumber)
                                    .frame(maxWidth:.infinity, alignment: .leading)
                                    .font(.system(size: 17))
                                    .foregroundColor(Color("gray100"))
                            }
                                
                            
                            TextField("チーム名を入力してください", text: $teamInfo[index].TeamName)
                                .font(.system(size: 17))
                                .foregroundColor(Color("dark"))
                                .padding(8)
                                .frame(height: 47)
                                .background(Color.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color("gray100"), lineWidth: 0.5)
                                )
                        }
                        .padding([.leading, .trailing], 24)
                    }
                }
//                
//                NavigationLink(destination: VS_View()) {
//                    ZStack {
//                        Color("main")
//                            .frame(maxWidth:.infinity, minHeight: 47, maxHeight: 47)
//                            .cornerRadius(40)
//                            .padding([.leading, .trailing], 31)
//                        
//                        Text("対戦開始")
//                            .font(.system(size: 17))
//                            .bold()
//                            .foregroundColor(.white)
//                    }
//                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ScoreView()
        .environmentObject(ShareData())
}
