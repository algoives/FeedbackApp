//
//  Rating+CoreDataProperties.swift
//  FeedbackApp
//
//  Created by Ives Murillo on 3/8/22.
//
//

import Foundation
import CoreData


extension Rating {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Rating> {
        return NSFetchRequest<Rating>(entityName: "Rating")
    }

    @NSManaged public var food: Int64
    @NSManaged public var gym: Int64
    @NSManaged public var overall: Int64
    @NSManaged public var room: Int64
    @NSManaged public var user: User?

}

extension Rating : Identifiable {

}
