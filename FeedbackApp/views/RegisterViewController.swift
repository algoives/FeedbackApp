//
//  RegisterViewController.swift
//  FeedbackApp
//
//  Created by Ives Murillo on 3/5/22.
//

import UIKit

class RegisterViewController: UIViewController {
    
    //IB outlets
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var confirmedPassword: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   
    @IBAction func registerUser(_ sender: Any) {
        //get input
        let userEmail = emailTextField.text!
        let userPassword = passwordTextField.text!
        let confirmedPass = confirmedPassword.text!
        
        //CHECK FOR EMTY FIELDS
        if(userEmail.isEmpty || userPassword.isEmpty || confirmedPass.isEmpty){
            //Display alert message and return
            displayAlert(userMessage: "Fill all the fields")
            return
        }
        
        //Check if password match
        if(userPassword != confirmedPass)
        {
            //display mesage and return
            displayAlert(userMessage: "Passwords must match")
            return
        }
        
        //store data
        UserDefaults.standard.set(userEmail, forKey: "userEmail")
        UserDefaults.standard.set(userEmail, forKey: "userPassword")
        UserDefaults.standard.synchronize()
        
        //display alert message
        var alert = UIAlertController(title: "Alert", message: "Succefull registration thank you", preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default){
            action in self.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
        
        //
        
        
        
    }
    
    
    //display alert message fucntion
    
    func displayAlert(userMessage : String){
        var myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated: true, completion: nil)
    }
    
}
