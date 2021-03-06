//
//  DataBaseHelper.swift
//  FeedbackApp
//
//  Created by Ives Murillo on 3/6/22.
//

import Foundation
import UIKit
import CoreData

class DataBaseHelper {
    
    //create a reference to the persistance container
    let contex = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    static var dataBaseHelper = DataBaseHelper()
    
    //provide description of data
    func addUser(newEmail: String){
        
        let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: contex!) as! User
        
        user.email = newEmail
        
        do{
            try contex?.save()
        }catch{
            print("user coudnt be save")
        }
        
        
       
        
    }
    //add rating to user
    
    //get data
    func getUsers() -> [User]{
        
        var users = [User]()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        
        do{
            users = try contex?.fetch(fetchRequest) as! [User]
        }catch{
            print("cant not fech data")
        }
        
        return users
    }
    
    //add rating
    func addRating(newRoomRating: Int32, newFoodRating: Int32,newGymRating: Int32, newOverall: Int32){
        let userRating = NSEntityDescription.insertNewObject(forEntityName: "Rating", into: contex!) as! Rating
        
        
        var user = User()
        var fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        do{
            let req = try contex?.fetch(fetchRequest) as! [User]
            if(req.count != 0){
                user = req.first as! User
            }
                
        }catch{
            
        }
        
        userRating.room = newRoomRating
        userRating.gym = newGymRating
        userRating.food = newFoodRating
        userRating.overall = newOverall
        userRating.ratingToUser = user
        
        do{
            try contex?.save()
            print("rating room saved",userRating.room)
        }catch{
            print("can not save room rating")
        }
    }
    
    
    
    func addRoomRating(newRoomRating: Int){
        let userRating = NSEntityDescription.insertNewObject(forEntityName: "Rating", into: contex!) as! Rating
        
        userRating.room = Int32(newRoomRating)
        
        do{
            try contex?.save()
            print("rating room saved",userRating.room)
        }catch{
            print("can not save room rating")
        }
    }
    
    func addGymRating(newGymRating: Int){
        let userRating = NSEntityDescription.insertNewObject(forEntityName: "Rating", into: contex!) as! Rating
        
        userRating.gym = Int32(newGymRating)
        
        do{
            try contex?.save()
            print("rating gym saved",userRating.gym)
        }catch{
            print("can not save room rating")
        }
    }
    
    func addFoodRating(newGymRating: Int32){
        let userRating = NSEntityDescription.insertNewObject(forEntityName: "Rating", into: contex!) as! Rating
        
        userRating.food = newGymRating
        
        do{
            try contex?.save()
            print("rating foo saved",userRating.food)
        }catch{
            print("can not save room rating")
        }
    }
    
    //get ratings
    func getRating() -> [Rating]{
        
        var raitings = [Rating]()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Rating")
        
        do{
            raitings = try contex?.fetch(fetchRequest) as! [Rating]
        }catch{
            print("cant not fech data")
        }
        
        return raitings
    }
    
    //get user rating
   /* func getUserRating( name : String) -> Rating {
        
        var raiting = Rating()
        var fReq =  NSFetchRequest<NSFetchRequestResult>(entityName: "Rating")
        fReq.predicate = NSPredicate(format: "room == %@ ", room)
        fReq.fetchLimit = 1
        
        do{
            let req = try contex?.fetch(fReq) as! [Rating]
            if(req.count != 0){
                raiting = req.first as! Rating
            }
            else{
                print("data not found")
            }
        }
        catch {
            
        }
        return raiting}*/
    
    //add overall rating
    func addOverallRating(newOverallRating: Int){
        let userRating = NSEntityDescription.insertNewObject(forEntityName: "Rating", into: contex!) as! Rating
        
        userRating.overall = Int32(newOverallRating)
        
        do{
            try contex?.save()
            print("rating over all saved",userRating.overall)
        }catch{
            print("can not save room rating")
        }
    }}
