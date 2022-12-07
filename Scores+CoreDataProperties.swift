//
//  Scores+CoreDataProperties.swift
//  MyCreditManger_dhk767
//
//  Created by 김동현 on 2022/12/07.
//
//

import Foundation
import CoreData


extension Scores {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Scores> {
        return NSFetchRequest<Scores>(entityName: "Scores")
    }

    @NSManaged public var name: String?
    @NSManaged public var score: String?
    @NSManaged public var subject: String?
    @NSManaged public var id: Int64
    @NSManaged public var relationship: UsersName?

}

extension Scores : Identifiable {

}
