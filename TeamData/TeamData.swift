//
//  TeamData.swift
//  EnvironmentTest
//
//  Created by 井久保春雅 on 2024/09/06.
//

import Foundation


class TeamData:Identifiable {
    var id = UUID()
    var name:String
    var nowScore:Int
    var totalScore:Int
    var resultScore:[Int]
    var missShot:[Bool]
    var setPoint:Int
    
    init(name: String, nowScore: Int, totalScore: Int, resultScore: [Int], missShot: [Bool], setPoint: Int) {
            self.name = name
            self.nowScore = nowScore
            self.totalScore = totalScore
            self.resultScore = resultScore
            self.missShot = missShot
            self.setPoint = setPoint
        }
}
