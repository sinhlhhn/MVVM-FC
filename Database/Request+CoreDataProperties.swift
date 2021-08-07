//
//  Request+CoreDataProperties.swift
//  
//
//  Created by Lê Hoàng Sinh on 9/7/20.
//
//

import Foundation
import CoreData


extension Request {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Request> {
        return NSFetchRequest<Request>(entityName: "Request")
    }

    @NSManaged public var avatar: String?
    @NSManaged public var sumary: String?
    @NSManaged public var fork: Int64
    @NSManaged public var fullName: String?
    @NSManaged public var star: Int64
    @NSManaged public var name: String?
    @NSManaged public var watch: Int64

}
