//
//  CoreDataMethod.swift
//  MyCreditManger_dhk767
//
//  Created by 김동현 on 2022/12/07.
//

import Foundation
import SQLite3

class DBHelper {
    static let shared = DBHelper()
    
    var db: OpaquePointer?
    let databaseName = "UsersName.sqlite"
    
    init() {
        self.db = createDB()
    }
    
    deinit {
        sqlite3_close(db)
    }
    
    private func createDB() -> OpaquePointer? {
        var db: OpaquePointer? = nil
        do {
            let dbPath: String = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(databaseName).path
            
            if sqlite3_open(dbPath, &db) == SQLITE_OK {
                print("데이터베이스 생성에 성공하였습니다. 경로 : \(dbPath)")
                return db
            }
        } catch {
            print("데이터베이스 생성에 실패하였습니다. - \(error.localizedDescription)")
        }
        return nil
    }
    
    func createEntity(){
            /**
             usersName이라는 Entity를 생성한다. Attribute는 id(int, auto-increment primary key), student_name(String not null)로 구성한다.
             */
            let query = """
               CREATE TABLE IF NOT EXISTS usersName(
               id INTEGER PRIMARY KEY AUTOINCREMENT,
               student_name TEXT NOT NULL,
               );
               """
            var statement: OpaquePointer? = nil
            
            if sqlite3_prepare_v2(self.db, query, -1, &statement, nil) == SQLITE_OK {
                if sqlite3_step(statement) == SQLITE_DONE {
                    print("Creating table has been succesfully done. db: \(String(describing: self.db))")
                    
                }
                else {
                    let errorMessage = String(cString: sqlite3_errmsg(db))
                    print("\nsqlte3_step failure while creating table: \(errorMessage)")
                }
            }
            else {
                let errorMessage = String(cString: sqlite3_errmsg(self.db))
                print("\nsqlite3_prepare failure while creating table: \(errorMessage)")
            }
            
            sqlite3_finalize(statement) // 메모리에서 sqlite3 할당 해제.
        }
    
}
