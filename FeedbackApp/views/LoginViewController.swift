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
    
    private var user : String
    private var password : String
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        userText.layer.cornerRadius = 22
        passwordText.layer.cornerRadius = 22
        signInButton.layer.cornerRadius = 22
        signInButton.layer.cornerRadius = 22
        
    }
    

  //IB Actions
    
    
    @IBAction func signIn(_ sender: Any) {
        fetchUser()
        
    }
    
    
    
   
    
    @IBAction func signUp(_ sender: Any) {

        

        addUser()
        createRegisterPage()
    }
    
    fileprivate func fetchUser() {
        //Set query
        let query : [String : Any] = [ kSecClass as String : kSecClassGenericPassword, kSecAttrAccount as String : user, kSecReturnAttributes as String : true, kSecReturnData as String : true]
        var res : CFTypeRef?
        
        executeQuery(query, &res)
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
    
    fileprivate func executeQuery(_ query: [String : Any], _ res: inout AnyObject?) {
        if SecItemCopyMatching(query as CFDictionary, &res) == noErr {
            if let item = res as? [String : Any],
               let user = item [ kSecAttrAccount as String] as? String,
               let password = item [ kSecValueData as String] as? Data,
               let pass = String(data: password, encoding: .utf8)
            {
                print("User is \(user) and password is \(pass)")
            }
            else
            {
                print ("No data was stored")
            }
        }
    }
    
    fileprivate func createRegisterPage() {
        //create register page
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let registerViewController = storyBoard.instantiateViewController(withIdentifier: "register") as! RegisterViewController
        present(registerViewController, animated: true, completion: nil)
    }
    
   
    
}
