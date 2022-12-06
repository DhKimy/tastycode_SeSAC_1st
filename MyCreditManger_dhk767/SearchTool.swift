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
