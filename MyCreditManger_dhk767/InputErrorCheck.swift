//
//  InputErrorCheck.swift
//  MyCreditManger_dhk767
//
//  Created by 김동현 on 2022/12/05.
//

import Foundation

class InputErrorCheck {
    /*
    func blankCheck(_ input: )
     */
    func inputName() -> String? {
        if let input = readLine() {
            // 공백과 nil 체크
            if input.isEmpty || input.hasPrefix(" ") || input.hasSuffix(" ") {
                print("🙅🏻 잘못된 입력입니다. 다시 확인해주세요")
                return self.inputName()
            }
            return input
        }
        return nil
    }
    
    func inputDataSet() -> [String] {
        let scoreAToF: [String] = ["A+", "A", "B+", "B", "C+", "C", "D+", "D", "F"]
        
        if let input = readLine() {
            if input.isEmpty || input.hasPrefix(" ") || input.hasSuffix(" ") {
                print("🙅🏻 잘못된 입력입니다. 다시 확인해주세요")
                return self.inputDataSet()
            }
            
            let nameSubjectScoreSet = input.components(separatedBy: " ")
            
            if nameSubjectScoreSet.count != 2 || nameSubjectScoreSet.count != 3 {
                print("🙅🏻 잘못된 입력입니다. 다시 확인해주세요")
                return self.inputDataSet()
            }
            
            if nameSubjectScoreSet.count == 2 {
                return nameSubjectScoreSet
            }
            
            if nameSubjectScoreSet.count == 3 && scoreAToF.contains(nameSubjectScoreSet[2]){
                return nameSubjectScoreSet
            }
        }
        print("비정상적 접근입니다.")
        exit(0)
    }
}
