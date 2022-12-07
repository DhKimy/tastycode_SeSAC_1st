//
//  InputErrorCheck.swift
//  MyCreditManger_dhk767
//
//  Created by 김동현 on 2022/12/05.
//

import Foundation

class InputErrorCheck {
    
    /**
        학생추가 시 이름에 영어 이외의 값이 들어가 있는지 체크하는 메서드
     */
    func isVaildName (_string : String) -> Bool { // 문자열 변경 실시
        let strArr = Array(_string) // 문자열 한글자씩 확인을 위해 배열에 담는다
        let pattern = "^[a-zA-Z]$" // 정규식 : 영어만 허용
        var resultString = ""
        var matchPoint = 0
        
        if let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive) {
            var index = 0
            while index < strArr.count { // string 문자 하나 마다 개별 정규식 체크
                let checkString = regex.matches(in: String(strArr[index]), options: [], range: NSRange(location: 0, length: 1))
                
                if checkString.count == 0 {
                    index += 1 // 정규식 패턴 외의 문자가 포함된 경우
                    matchPoint -= 1
                }
                else { // 정규식 포함 패턴의 문자
                    resultString += String(strArr[index]) // 리턴 문자열에 추가
                    index += 1
                    matchPoint += 1
                }
            }
        }
        
        if _string.count == matchPoint {
            return true
        }
        return false
    }
    
    /**
     성적추가 시 화살표 이동 등의 값이 들어가 있는지 체크
     */
    func textFilter (_string : String) -> String { // 문자열 변경 실시
        let strArr = Array(_string) // 문자열 한글자씩 확인을 위해 배열에 담는다
        
        let pattern = "^[ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z0-9!-=\\s]$"
        
        // 문자열 길이가 한개 이상인 경우만 패턴 검사 수행
        var resultString = ""
        if strArr.count > 0 {
            if let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive) {
                var index = 0
                while index < strArr.count { // string 문자 하나 마다 개별 정규식 체크
                    let checkString = regex.matches(in: String(strArr[index]), options: [], range: NSRange(location: 0, length: 1))
                    if checkString.count == 0 {
                        index += 1 // 정규식 패턴 외의 문자가 포함된 경우
                    }
                    else { // 정규식 포함 패턴의 문자
                        resultString += String(strArr[index]) // 리턴 문자열에 추가
                        index += 1
                    }
                }
            }
            return resultString
        }
        else {
            return _string // 원본 문자 다시 리턴
        }
    }
    
    /**
     학생추가, 학생삭제, 평점보기 탭에서 활용한다.
     단순히 이름만 입력할 때 쓰는 메서드
     매개변수를 가지지 않고, return 값으로 Optional<String>을 반환한다.
     입력값이 없을 때는 nil을 반환한다.
     */
    func inputName() -> String? {
        if let input = readLine() {
            // 공백과 nil 체크
            if input.isEmpty || input.hasPrefix(" ") || input.hasSuffix(" ") || !isVaildName(_string: input) {
                print("🙅🏻 잘못된 입력입니다. 다시 확인해주세요")
                return self.inputName()
            }
            
            return textFilter(_string: input)
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
            
            let checkInput = textFilter(_string: input)
            
            let nameSubjectScoreArray = checkInput.components(separatedBy: " ")
            
            if nameSubjectScoreArray.count == 2 {
                return nameSubjectScoreArray
            }
            
            if nameSubjectScoreArray.count == 3 && scoreAToF.contains(nameSubjectScoreArray[2]){
                return nameSubjectScoreArray
            }
            
            if nameSubjectScoreArray.count == 3 && !scoreAToF.contains(nameSubjectScoreArray[2]) {
                print("🙅🏻 성적은 대문자 알파벳이며 A or B+ 과 같이 입력해야 합니다. 다시 확인해주세요")
                return self.inputDataArray()
            }
        }
        print("🙅🏻 잘못된 입력입니다. 다시 확인해주세요")
        return self.inputDataArray()
    }
}
