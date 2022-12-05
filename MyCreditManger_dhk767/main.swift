//
//  main.swift
//  MyCreditManger_dhk767
//
//  Created by 김동현 on 2022/12/05.
//

import Foundation

print("""
--- 성적관리 프로그램 ---
안녕하세요. 성적관리 프로그램에 오신 것을 환영합니다.
""")

while(true){
    print("""
          원하는 기능을 입력해주세요.
          1: 학생추가  2: 학생삭제  3: 성적추가  4: 성적삭제  5: 평점보기  X : 종료
          
          """)
    
    let input = readLine()
    switch input {
    case "1":
        print("✏️ 학생을 추가합니다.")
    case "2":
        print("✏️ 학생을 삭제합니다.")
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

