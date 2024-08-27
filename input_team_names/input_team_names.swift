//
//  number_of_teams.swift
//  molkkyapp
//
//  Created by 井久保春雅 on 2024/08/19.
//

import SwiftUI

struct input_team_names: View {
    
    @Binding var numberOfTeams:Int
    @State var inputTeamNames:[String] = []
    @State private var teamNameLimit = 9
    
    @State private var startGame = false
    
    var body: some View {
        
        if startGame {
            VS_View(teamNames: $inputTeamNames)
        } else {
            VStack {
                ForEach(0..<inputTeamNames.count,id:\.self) { inputName in
                    TextField("チーム名を入力してください",text: $inputTeamNames[inputName])
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .onChange(of: inputTeamNames[inputName]) {
                            if inputTeamNames[inputName].count > teamNameLimit {
                                inputTeamNames[inputName] = String(inputTeamNames[inputName].prefix(teamNameLimit))
                            }
                        }
                }
                
                Button(action: {
                    startGame.toggle()
                    print(inputTeamNames)
                }, label: {
                    Text("対戦開始")
                })
            }
            
            .onAppear {
                inputTeamNames = Array(repeating: "",count: numberOfTeams)
            }
        }
    }
}

#Preview {
    input_team_names(numberOfTeams: .constant(2))
}
