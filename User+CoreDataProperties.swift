//
//  User+CoreDataProperties.swift
//  FeedbackApp
//
//  Created by Ives Murillo on 3/8/22.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var email: String?
    @NSManaged public var raiting: Rating?

}

extension User : Identifiable {

}
