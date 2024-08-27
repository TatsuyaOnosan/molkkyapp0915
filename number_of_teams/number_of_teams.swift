//
//  number_of_teams.swift
//  molkkyapp
//
//  Created by 井久保春雅 on 2024/08/19.
//

import SwiftUI

struct number_of_teams: View {
    @State var numberOfTeams:Int = 0
    
    @State private var goToNextPage = false
    
    var body: some View {
        if goToNextPage {
            input_team_names(numberOfTeams: $numberOfTeams)
        } else {
                        
            VStack {
                Text("何人で遊ぶんだい？")
                    .padding()

                ForEach(0...3,id:\.self) {team in
                    ZStack {
                        Button(action: {
                            numberOfTeams = team + 1
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
        }
    }
}


#Preview {
    number_of_teams()
}
