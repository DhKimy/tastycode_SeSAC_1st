//
//  main.swift
//  MyCreditManger_dhk767
//
//  Created by 김동현 on 2022/12/05.
//

import Foundation

let dummyData = StudentData()
var datum: [StudentData] = [dummyData]
var searchTool = SearchTool()
var inputErrorCheck = InputErrorCheck()
var calculator = CalculateScore()

startProgram()

func startProgram() {
    print("""
    --- 성적관리 프로그램 ---
    안녕하세요. 성적관리 프로그램에 오신 것을 환영합니다.
    """)

    while(true) {
        print("""
              원하는 기능을 입력해주세요.
              1: 학생추가  2: 학생삭제  3: 성적추가  4: 성적삭제  5: 평점보기  X : 종료
              """)
        switch readLine() {
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
            searchScore()
        case "X":
            print("프로그램을 종료합니다...")
            exit(0)
        default:
            print("🙅🏻 잘못된 입력입니다. 다시 입력하세요")
            continue
        }
    }
}

func createStudent() {
    print("추가할 학생의 이름을 입력해주세요")
    
    guard let input = inputErrorCheck.inputName() else {
        print("🙅🏻 프로그램에 오류가 생겼습니다.")
        exit(0)
    }
    guard searchTool.searchForName(studentName: input, arrayLength: datum.count, dataSet: datum) != nil else {
        let newStudentData = StudentData()
        newStudentData.name = input
        datum.append(newStudentData)
        print("🙌🏻 \(input) 학생을 추가했습니다. 🙌🏻")
        return
    }
    
    print("🙅🏻 \(input)은 이미 존재하는 학생입니다. 추가할 수 없습니다.")
    return
}

func deleteStudent() {
    print("삭제할 학생의 이름을 입력해주세요")
    
    guard let input = inputErrorCheck.inputName() else {
        print("🙅🏻 프로그램에 오류가 생겼습니다.")
        exit(0)
    }
    guard let studentIndex = searchTool.searchForName(studentName: input, arrayLength: datum.count, dataSet: datum) else {
        print("🙅🏻 \(input) 학생을 찾지 못했습니다. 다시 확인해주세요")
        return
    }
    
    datum.remove(at: studentIndex)
    print("🗑️ \(input) 학생을 삭제하였습니다.")
}

func updateScore() {
    print("""
    성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.
    입력예) Mickey Swift A+

    만약, 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.
    """)
    
    let nameSubjectScoreArray = inputErrorCheck.inputDataArray()
    guard let studentIndex = searchTool.searchForName(studentName: nameSubjectScoreArray[0], arrayLength: datum.count, dataSet: datum) else {
        print("🙅🏻 \(nameSubjectScoreArray[0]) 학생은 존재하지 않습니다. 다시 입력해주세요.")
        return
    }
    
    datum[studentIndex].subjectScore["\(nameSubjectScoreArray[1])"] = nameSubjectScoreArray[2]
    print("🙆🏻‍♀️ \(nameSubjectScoreArray[0]) 학생의 \(nameSubjectScoreArray[1]) 과목이 \(nameSubjectScoreArray[2])로 추가(변경)되었습니다.")
}

func deleteScore() {
    print("""
    성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.
    입력예) Mickey Swift
    """)
    
    let nameAndScoreArray = inputErrorCheck.inputDataArray()
    guard let studentIndex = searchTool.searchForName(studentName: nameAndScoreArray[0], arrayLength: datum.count, dataSet: datum) else {
        print("🙅🏻 \(nameAndScoreArray[0]) 학생이 존재하지 않거나 \(nameAndScoreArray[0]) 학생은 \(nameAndScoreArray[1]) 과목 성적을 가지고 있지 않습니다. 다시 입력해주세요.")
        return
    }
    
    datum[studentIndex].subjectScore.removeValue(forKey: nameAndScoreArray[1])
    print("🙆🏻‍♀️ \(nameAndScoreArray[0]) 학생의 \(nameAndScoreArray[1]) 과목 성적이 삭제되었습니다.")
}

func searchScore() {
    print("평점을 알고 싶은 학생의 이름을 입력해주세요.")
    
    guard let input = inputErrorCheck.inputName() else {
        print("🙅🏻 프로그램에 오류가 생겼습니다.")
        exit(0)
    }
    guard let studentIndex = searchTool.searchForName(studentName: input, arrayLength: datum.count, dataSet: datum) else {
        print("🙅🏻 \(input) 학생을 찾지 못했습니다. 다시 확인해주세요")
        return
    }
    
    for (key, value) in datum[studentIndex].subjectScore {
        print("\(key) : \(value)")
    }
    print("평점 : \(calculator.calculatingScore(scoreSet: datum[studentIndex].subjectScore))")
}

