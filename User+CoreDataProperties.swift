//
//  User+CoreDataProperties.swift
//  FeedbackApp
//
//  Created by Ives Murillo on 3/5/22.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var email: String?

}

extension User : Identifiable {

}
