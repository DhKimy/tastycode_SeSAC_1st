//
//  SearchTool.swift
//  MyCreditManger_dhk767
//
//  Created by 김동현 on 2022/12/06.
//

import Foundation

class SearchTool {
    func searchForName(studentName name: String, arrayLength len: Int, dataSet datum: [StudentData]) -> Int? {
        for i in stride(from: 0, to: len, by: 1) {
            if datum[i].name == name {
                return i
            }
        }
        return nil
    }
}

/*
for i in stride(from: 0, to: datum.count, by: 1) {
    if datum[i].name == input {
        print("🙅🏻 \(input)은 이미 존재하는 학생입니다. 추가할 수 없습니다.")
        return
    }
}

for i in stride(from: 0, to: datum.count, by: 1) {
    if datum[i].name == input {
        datum.remove(at: i)
        print("🗑️ \(input) 학생을 삭제하였습니다.")
        return
    }
}

for i in stride(from: 0, to: datum.count, by: 1) {
    if datum[i].name == nameSubjectScoreSet[0] {
        datum[i].subjectScore["\(nameSubjectScoreSet[1])"] = nameSubjectScoreSet[2]
        
        print("🙆🏻‍♀️ \(nameSubjectScoreSet[0]) 학생의 \(nameSubjectScoreSet[1]) 과목이 \(nameSubjectScoreSet[2])로 추가(변경)되었습니다.")
        return
    }
}

for i in stride(from: 0, to: datum.count, by: 1) {
    if datum[i].name == nameAndScoreSet[0] {
        datum[i].subjectScore.removeValue(forKey: nameAndScoreSet[1])
        print("🙆🏻‍♀️ \(nameAndScoreSet[0]) 학생의 \(nameAndScoreSet[1]) 과목 성적이 삭제되었습니다.")
        return
    }
}

for i in stride(from: 0, to: datum.count, by: 1) {
    if datum[i].name == input {
        for (key, value) in datum[i].subjectScore {
            print("\(key) : \(value)")
        }
        print("평점 : \(calScore(scoreSet: datum[i].subjectScore))")
        return
    }
}
*/
