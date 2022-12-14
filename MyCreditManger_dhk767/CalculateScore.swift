//
//  CalculateScore.swift
//  MyCreditManger_dhk767
//
//  Created by κΉλν on 2022/12/06.
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
                print("ππ» μ±μ  μλ ₯ λ°μ΄ν°κ° μλͺ»λμμ΅λλ€. \(scoreSet.keys) κ³Όλͺ©μ μ±μ μ λλ¬Έμλ‘ μμ νκ³  μλνμ¬ μ£ΌμΈμ.")
            }
        }
        return round(scoreSum/Double(scoreSet.count) * 100) / 100
    }
}
