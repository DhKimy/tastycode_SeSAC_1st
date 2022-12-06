//
//  CalculateScore.swift
//  MyCreditManger_dhk767
//
//  Created by 김동현 on 2022/12/06.
//

import Foundation

class CalculateScore {
    func calculatingScore(scoreSet: Dictionary<String, String>) -> Double {
        var scoreSum: Double = 0.0
        
        for (_, value) in scoreSet{
            switch value {
            case "A+":
                scoreSum += 4.5
            case "A":
                scoreSum += 4.0
            case "B+":
                scoreSum += 3.5
            case "B":
                scoreSum += 3.0
            case "C+":
                scoreSum += 2.5
            case "C":
                scoreSum += 2.0
            case "D+":
                scoreSum += 1.5
            case "D":
                scoreSum += 1.0
            case "F":
                scoreSum += 0
            default:
                print("🙅🏻 성적 입력 데이터가 잘못되었습니다. \(scoreSet.keys) 과목의 성적을 대문자로 수정하고 시도하여 주세요.")
            }
        }
        
        return round(scoreSum/Double(scoreSet.count) * 100) / 100
    }

}
