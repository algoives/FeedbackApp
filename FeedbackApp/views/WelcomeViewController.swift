//
//  WelcomeViewController.swift
//  FeedbackApp
//
//  Created by Ives Murillo on 3/2/22.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    
    //segue
    var finalName = ""
    

    @IBOutlet weak var lwelcomeLabel: UILabel!
    
    
    @IBOutlet weak var userName: UILabel!
    
    //var nameToShow = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        userName.text =  finalName
    }
    
    
    //function to load name or email from user
  /*  func laodUserEmail(_ sender: Any) -> String{
        let users = DataBaseHelper.dataBaseHelper.getUsers()
        
        for user in users {
            nameToShow = user.email!
        }
        return nameToShow
    }*/
    
    
    @IBAction func servicesAction(_ sender: Any) {
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
