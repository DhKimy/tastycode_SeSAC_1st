//
//  main.swift
//  MyCreditManger_dhk767
//
//  Created by 김동현 on 2022/12/05.
//

import Foundation

let dummyData = StudentData()
var data: [StudentData] = [dummyData]

print("""
--- 성적관리 프로그램 ---
안녕하세요. 성적관리 프로그램에 오신 것을 환영합니다.
""")

while(true) {
    print("""
          원하는 기능을 입력해주세요.
          1: 학생추가  2: 학생삭제  3: 성적추가  4: 성적삭제  5: 평점보기  X : 종료
          
          """)
    let input = readLine()
    switch input {
    case "1":
        print("✏️ 학생을 추가합니다.")
        createStudent()
    case "2":
        print("✏️ 학생을 삭제합니다.")
        deleteStudent()
    case "3":
        print("✏️ 성적을 추가합니다.")
        updateScore()
    case "4":
        print("✏️ 성적을 삭제합니다.")
        deleteScore()
    case "5":
        print("✏️ 평점을 검색합니다.")
    case "X":
        print("프로그램을 종료합니다...")
        exit(0)
    default:
        print("잘못된 입력입니다. 다시 입력하세요")
        continue
    }
}

func createStudent() {
    print("추가할 학생의 이름을 입력해주세요")
    
    // 공백과 nil 체크
    if let input = readLine() {
        if input.isEmpty || input.hasPrefix(" ") || input.hasSuffix(" "){
            print("🙅🏻 잘못된 입력입니다. 다시 확인해주세요")
            return
        }
        
        // 기존 데이터 중 중복 이름 체크
        for i in stride(from: 0, to: data.count, by: 1) {
            if data[i].name == input {
                print("🙅🏻 \(input)은 이미 존재하는 학생입니다. 추가할 수 없습니다.")
                return
            }
        }
            
        var newStudentData = StudentData()
        newStudentData.name = input
        data.append(newStudentData)
        print("🙌🏻 \(input) 학생을 추가했습니다. 🙌🏻")
    }
}

func deleteStudent() {
    print("삭제할 학생의 이름을 입력해주세요")
    
    if let input = readLine() {
        // 공백과 nil 체크
        if input.isEmpty || input.hasPrefix(" ") {
            print("🙅🏻 잘못된 입력입니다. 다시 확인해주세요")
            return
        }
        
        for i in stride(from: 0, to: data.count, by: 1) {
            if data[i].name == input {
                data.remove(at: i)
                print("🗑️ \(input) 학생을 삭제하였습니다.")
                return
            }
        }
        
        print("🙅🏻 \(input) 학생을 찾지 못했습니다. 다시 확인해주세요")
    }
}

func updateScore() {
    print("""
성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.
입력예) Mickey Swift A+

만약, 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.
""")
    if let input = readLine() {
        // 공백과 nil 체크
        if input.isEmpty || input.hasPrefix(" ") || input.hasSuffix(" ") {
            print("🙅🏻 잘못된 입력입니다. 다시 확인해주세요")
            return
        }
        
        let nameSubjectScoreSet = input.components(separatedBy: " ")
        
        if nameSubjectScoreSet.count != 3 {
            print("🙅🏻 잘못된 입력입니다. 다시 확인해주세요")
            return
        }
        /*
          성적 값이 제대로 들어오는 지 확인하는 절차 필요
         */
        
        for i in stride(from: 0, to: data.count, by: 1) {
            if data[i].name == nameSubjectScoreSet[0] {
                data[i].subjectScore["\(nameSubjectScoreSet[1])"] = nameSubjectScoreSet[2]
                
                print("🙆🏻‍♀️ \(nameSubjectScoreSet[0]) 학생의 \(nameSubjectScoreSet[1]) 과목이 \(nameSubjectScoreSet[2])로 추가(변경)되었습니다.")
                return
            }
        }
        
        print("🙅🏻 \(nameSubjectScoreSet[0]) 학생은 존재하지 않습니다. 다시 입력해주세요.")
    }
}

func deleteScore() {
    print("""
성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.
입력예) Mickey Swift
""")
    
    if let input = readLine() {
        // 공백과 nil 체크
        if input.isEmpty || input.hasPrefix(" "){
            print("🙅🏻 잘못된 입력입니다. 다시 확인해주세요")
            return
        }
        
        let nameAndScoreSet = input.components(separatedBy: " ")
        
        if nameAndScoreSet.count != 2 {
            print("🙅🏻 잘못된 입력입니다. 다시 확인해주세요")
            return
        }
        
        for i in stride(from: 0, to: data.count, by: 1) {
            if data[i].name == nameAndScoreSet[0] {
                data[i].subjectScore.removeValue(forKey: nameAndScoreSet[1])
                print("🙆🏻‍♀️ \(nameAndScoreSet[0]) 학생의 \(nameAndScoreSet[1]) 과목 성적이 삭제되었습니다.")
                return
            }
        }
        
        print("🙅🏻 \(nameAndScoreSet[0]) 학생이 존재하지 않거나 \(nameAndScoreSet[0]) 학생은 \(nameAndScoreSet[1]) 과목 성적을 가지고 있지 않습니다. 다시 입력해주세요.")
    }
}
