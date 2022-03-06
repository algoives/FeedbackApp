//
//  Rating+CoreDataProperties.swift
//  FeedbackApp
//
//  Created by Ives Murillo on 3/6/22.
//
//

import Foundation
import CoreData


extension Rating {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Rating> {
        return NSFetchRequest<Rating>(entityName: "Rating")
    }

    @NSManaged public var room: Int64
    @NSManaged public var gym: Int64
    @NSManaged public var food: Int64}

extension Rating : Identifiable {

}
