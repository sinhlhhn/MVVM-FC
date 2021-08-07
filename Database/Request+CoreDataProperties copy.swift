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

    static func insertObject( name: String, fullName: String, star: Int, watch: Int, fork: Int, descriptionDetail: String, avatar: String) -> Request {
        let new = NSEntityDescription.insertNewObject(forEntityName: "Request", into: AppDelegate.manageObjectContext!)  as! Request
        new.name = name
        new.fullName = fullName
        new.star = Int64(star)
        new.watch = Int64(watch)
        new.fork = Int64(fork)
        new.sumary = descriptionDetail
        new.avatar = avatar
        do {
            try AppDelegate.manageObjectContext?.save()
        } catch  {
            print("Insert failed")
        }
        return new
    }
    
    static func deleteObject(){
        var result:[Request]
        do {
            result = try AppDelegate.manageObjectContext?.fetch(fetchRequest()) as! [Request]
            for item in result {
                AppDelegate.manageObjectContext?.delete(item)
            }
        } catch  {
            print("Delete failed")
        }
    }
    
    static func ShowObject(){
        do {
            try AppDelegate.manageObjectContext?.fetch(fetchRequest())
        } catch  {
            print("Show failed")
        }
    }
    
    
    
}
