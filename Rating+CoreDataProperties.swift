//
//  Rating+CoreDataProperties.swift
//  FeedbackApp
//
//  Created by Ives Murillo on 3/9/22.
//
//

import Foundation
import CoreData


extension Rating {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Rating> {
        return NSFetchRequest<Rating>(entityName: "Rating")
    }

    @NSManaged public var food: Int32
    @NSManaged public var gym: Int32
    @NSManaged public var overall: Int32
    @NSManaged public var room: Int32
    @NSManaged public var ratingToUser: User?

}

extension Rating : Identifiable {

}
