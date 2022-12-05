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
    case "4":
        print("✏️ 성적을 삭제합니다.")
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
        if input.isEmpty || input.hasPrefix(" "){
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
