//
//  UsersName+CoreDataProperties.swift
//  MyCreditManger_dhk767
//
//  Created by 김동현 on 2022/12/07.
//
//

import Foundation
import CoreData


extension UsersName {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UsersName> {
        return NSFetchRequest<UsersName>(entityName: "UsersName")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: Int64
    @NSManaged public var relationship: Scores?

}

extension UsersName : Identifiable {

}
