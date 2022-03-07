//
//  LoginViewController.swift
//  FeedbackApp
//
//  Created by Ives Murillo on 3/2/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    //IB Outlet
    
    @IBOutlet weak var userText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var signInButton: UIButton!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    var user : String = " "
    var password : String = " "
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        userText.layer.cornerRadius = 22
        passwordText.layer.cornerRadius = 22
        signInButton.layer.cornerRadius = 22
        signUpButton.layer.cornerRadius = 22
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Disposse resosurces
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //clear out the text fields
        userText.text = nil
        passwordText.text = nil
        
    }
    

  //IB Actions
    
    
    @IBAction func signIn(_ sender: Any) {
       print("you tapped loguin button")
        if(userText.text!.isEmpty || passwordText.text!.isEmpty){
            showAlertView(msg: "Email and password are required")
            return
        }
        
        let username = userText.text!

        // Set query
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: username,
            kSecMatchLimit as String: kSecMatchLimitOne,
            kSecReturnAttributes as String: true,
            kSecReturnData as String: true,
        ]
        var item: CFTypeRef?

        // Check if user exists in the keychain
        if SecItemCopyMatching(query as CFDictionary, &item) == noErr {
            // Extract result
            if let existingItem = item as? [String: Any],
               let username = existingItem[kSecAttrAccount as String] as? String,
               let passwordData = existingItem[kSecValueData as String] as? Data,
               let password = String(data: passwordData, encoding: .utf8)
            {
                print(username)
                print(password)
                
                //create welcome page
                //extract method in refactoring
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let nexViewController = storyboard?.instantiateViewController(withIdentifier: "welcome") as? WelcomeViewController
                self.present(nexViewController!, animated: true, completion: nil)
                
            }
            
        } else {
            showAlertView(msg: "YOu are not register yet")
        }
        
    }
    
    
    
   
    
    @IBAction func signUp(_ sender: Any) {

        print("you tapped register button")
        
        //transition to register page programatically
        createRegisterPage()

    }
    
    //Alert function
    func showAlertView(msg: String){
        let alertController = UIAlertController(title: "Usder Autentication", message: msg, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertController.addAction(okButton)
        present(alertController, animated: true, completion: nil)
    }
    
   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    fileprivate func fetchUser() -> Bool{
        //Set query
        let query : [String : Any] = [ kSecClass as String : kSecClassGenericPassword, kSecAttrAccount as String : user, kSecReturnAttributes as String : true, kSecReturnData as String : true]
        var res : CFTypeRef?
        
        return  executeQuery(query, &res)
    }
    
    fileprivate func addUser() {
        //set Attributes dictionary form
        let attribute : [String : Any] = [ kSecClass as String: kSecClassGenericPassword, kSecAttrAccount as String : user, kSecValueData as String : password.data(using: .utf8)!]
        
        //add to the keychain or dispaly alert
        if SecItemAdd(attribute as CFDictionary, nil) == noErr {
            print("User \(user) was added to key chain")
        }
        else{
            print("User \(user) could not be added to key chain")        }
        
    }
    
    fileprivate func executeQuery(_ query: [String : Any], _ res: inout AnyObject?) -> Bool {
        if SecItemCopyMatching(query as CFDictionary, &res) == noErr {
            if let item = res as? [String : Any],
               let user = item [ kSecAttrAccount as String] as? String,
               let password = item [ kSecValueData as String] as? Data,
               let pass = String(data: password, encoding: .utf8)
            {
                print("User is \(user) and password is \(pass)")
                return true
            }
            else
            {
                print ("No data was stored")
                return false
            }
        }
        return false
    }
    
    fileprivate func createRegisterPage() {
        //create register page
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let registerViewController = storyBoard.instantiateViewController(withIdentifier: "register") as! RegisterViewController
        present(registerViewController, animated: true, completion: nil)
    }
    
   
    
}
