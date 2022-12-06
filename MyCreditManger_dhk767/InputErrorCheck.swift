//
//  InputErrorCheck.swift
//  MyCreditManger_dhk767
//
//  Created by 김동현 on 2022/12/05.
//

import Foundation

class InputErrorCheck {
    /**
     학생추가, 학생삭제, 평점보기 탭에서 활용한다.
     단순히 이름만 입력할 때 쓰는 메서드
     매개변수를 가지지 않고, return 값으로 Optional<String>을 반환한다.
     입력값이 없을 때는 nil을 반환한다.
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
    
    /**
     성적추가, 성적삭제 탭에서 활용함
     매개변수를 가지지 않고, return 값으로 [String]을 반환한다.
     입력값이 없을 때는 nil을 반환한다. 비정상적 접근일 시 프로그램이 종료된다.
     
     * components를 활용하여 공백을 기준으로 배열을 만든다. 배열의 길이가 2 or 3이 아닐 경우, 재귀적으로 함수를 다시 호출한다.
     * 배열의 길이가 2일 경우(성적삭제), 체크할 값이 없기 때문에 그대로 값을 반환한다.
     * 배열의 길이가 3일 경우(성적추가), scoreAToF 배열과 입력된 스코어의 값을 비교하여 scoreAToF 안에 값과 일치하는 것이 경우 다시 함수를 호출한다.
     * 위의 경우가 아닌 입력값이 주어졌을 경우, 다시 함수를 호출한다.
     
     */
    @discardableResult func inputDataArray() -> [String] {
        let scoreAToF: [String] = ["A+", "A", "B+", "B", "C+", "C", "D+", "D", "F"]
        
        if let input = readLine() {
            if input.isEmpty || input.hasPrefix(" ") || input.hasSuffix(" ") {
                print("🙅🏻 잘못된 입력입니다. 다시 확인해주세요")
                return self.inputDataArray()
            }
            
            let nameSubjectScoreArray = input.components(separatedBy: " ")
            
            if nameSubjectScoreArray.count == 2 {
                return nameSubjectScoreArray
            }
            
            if nameSubjectScoreArray.count == 3 && scoreAToF.contains(nameSubjectScoreArray[2]){
                return nameSubjectScoreArray
            }
        }
        print("🙅🏻 잘못된 입력입니다. 다시 확인해주세요")
        return self.inputDataArray()
    }
}
