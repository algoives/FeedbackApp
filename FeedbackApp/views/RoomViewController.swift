//
//  RoomViewController.swift
//  FeedbackApp
//
//  Created by Ives Murillo on 3/2/22.
//

import UIKit

class RoomViewController: UIViewController {
    
    //IB outlets
    //question 1
    @IBOutlet weak var q1Good: UIButton!
    
    @IBOutlet weak var q1regular: UIButton!
    
    @IBOutlet weak var q1Bad: UIButton!
  
    //Question 2
    
    @IBOutlet weak var q2Good: UIButton!
    
    @IBOutlet weak var q2Regular: UIButton!
    
    @IBOutlet weak var q2Bad: UIButton!
    
    //Question3
    
    @IBOutlet weak var q3Good: UIButton!
    
    @IBOutlet weak var q3Regular: UIButton!
    
    @IBOutlet weak var q3Bad: UIButton!
    
    //Rating properties
    var q1score = 0
    var q2score = 0
    var q3score = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
//IB ACTIONS
   
    
    //question 1
    @IBAction func q1goodSelcted(_ sender: Any) {
        q1score = 5
        
        selectButton(q1Good,q1regular,q1Bad)
    }
  
    @IBAction func q1regularSelected(_ sender: Any) {
        q1score = 3
        selectButton(q1regular, q1Bad, q1Good)
    }
    
    @IBAction func q1BadSelected(_ sender: Any) {
        q1score = 2
        selectButton(q1Bad, q1regular, q1Good)
    }
    
    //Question2
    
    @IBAction func q2goodSelected(_ sender: Any) {
        q2score = 5
        selectButton(q2Good, q2Bad, q2Regular)
    }
    
    @IBAction func q2regularSelected(_ sender: Any) {
        q2score = 3
        selectButton(q2Regular, q2Bad, q2Good)
    }
    
    @IBAction func q2badSelected(_ sender: Any) {
        q2score = 2
        selectButton(q2Bad, q2Good, q2Regular)
    }
    //Question3
    
    @IBAction func q3goodSelected(_ sender: Any) {
        q3score = 5
        selectButton(q3Good, q3Bad, q3Regular)
    }
    
    
    @IBAction func q3regularSelected(_ sender: Any) {
        q3score = 2
        selectButton(q3Regular, q3Good, q3Bad)
    }
    
    
    @IBAction func q3badSelected(_ sender: Any) {
        q3score = 2
        selectButton(q3Bad, q3Good, q3Regular)
    }
    
    //Submit Action
    
    @IBAction func submit(_ sender: Any) {
        var rating = (q1score + q2score + q3score)/3
       
    }
    
    //Privet functions
    
    //Fucntion to select a button
    fileprivate func selectButton(_ selected : UIButton,_ unselected1 : UIButton,_ unselected2: UIButton
    ) {
        selected.backgroundColor = UIColor.darkGray
        unselected1.backgroundColor = UIColor.lightGray
        unselected2.backgroundColor = UIColor.lightGray
    }
    
    
    func showAlertView(msg: String){
        let alertController = UIAlertController(title: "Was a pleasurue to Serve you", message: msg, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertController.addAction(okButton)
        present(alertController, animated: true, completion: nil)
    }
    
}
