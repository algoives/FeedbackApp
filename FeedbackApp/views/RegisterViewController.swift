//
//  RegisterViewController.swift
//  FeedbackApp
//
//  Created by Ives Murillo on 3/5/22.
//
import Security
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
        let userPassword = passwordTextField.text!.data(using: .utf8)!
        let confirmedPass = confirmedPassword.text!.data(using: .utf8)!
        
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
        
        //create attributes to save in keychain
        //create a dictionary type string : any to represent the keychain
        let attri : [String : Any] = [kSecClass as String : kSecClassGenericPassword,
                                           kSecAttrAccount as String : userEmail,
                                           kSecValueData as String : userPassword]
        
        //Add user
        
        if SecItemAdd(attri as CFDictionary, nil) == noErr {
            print("user safe succefully in the keychain")
          //  displayAlert(userMessage: "Sig up was succefull")
        }else{
            print("something went wrong triying to save the user in keychain")
            displayAlert(userMessage: "sorry something went wrong ,try again ")
            return
        }
        
        //transition to wellcome View Controller
        //extract method in refactorin to be available to all views
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nexViewController = storyboard?.instantiateViewController(withIdentifier: "welcome") as? WelcomeViewController
        self.present(nexViewController!, animated: true, completion: nil)
        
        
        //save data in data core
        
        DataBaseHelper.dataBaseHelper.addUser(newEmail: userEmail)
        
        
        
    }
    
    
    
    fileprivate func alertAndCallNextView() {
     
        //display alert message
        var alert = UIAlertController(title: "Alert", message: "Succefull registration thank you", preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default){
            action in self.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
        
        
      
        
        
    }
    
    
    
    //display alert message fucntion
    
    func displayAlert(userMessage : String){
        var myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated: true, completion: nil)
    }
    
}
