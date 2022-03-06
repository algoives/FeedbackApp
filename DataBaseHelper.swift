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
    
    //get data
    func getUser() -> [User]{
        
        var users = [User]()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        
        do{
            users = try contex?.fetch(fetchRequest) as! [User]
        }catch{
            print("cant not fech data")
        }
        
        return users
    }
    
    
    
}
