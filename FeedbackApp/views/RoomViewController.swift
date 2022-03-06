//
//  RoomViewController.swift
//  FeedbackApp
//
//  Created by Ives Murillo on 3/2/22.
//

import UIKit

class RoomViewController: UIViewController {
    
    //IB outlets
    
    @IBOutlet weak var q1Good: UIButton!
    
    @IBOutlet weak var q1regular: UIButton!
    
    @IBOutlet weak var q1Bad: UIButton!
    
    //Rating properties
    var rating = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
//IB ACTIONS
   
    
    //question 1
    @IBAction func q1goodSelcted(_ sender: Any) {
        rating = 5
        
        selectButton(q1Good,q1regular,q1Bad)
    }
  
    @IBAction func q1regularSelected(_ sender: Any) {
        rating = 3
        selectButton(q1regular, q1Bad, q1Good)
    }
    
    @IBAction func q1BadSelected(_ sender: Any) {
        rating = 2
        selectButton(q1Bad, q1regular, q1Good)
    }
    
    //Question2
    
    //Question3
    
    
    //Submit Action
    
    @IBAction func submit(_ sender: Any) {
        
        DataBaseHelper.dataBaseHelper.addRoomRating(newRoomRating: rating)
        
    }
    
    //Privet functions
    
    //Fucntion to select a button
    fileprivate func selectButton(_ selected : UIButton,_ unselected1 : UIButton,_ unselected2: UIButton
    ) {
        selected.backgroundColor = UIColor.darkGray
        unselected1.backgroundColor = UIColor.lightGray
        unselected2.backgroundColor = UIColor.lightGray
    }
    
    
}
