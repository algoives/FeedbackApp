//
//  GyMViewController.swift
//  FeedbackApp
//
//  Created by Ives Murillo on 3/8/22.
//

import UIKit

class GyMViewController: UIViewController {
    
    
    //Data to pass in segue
    var score : Int32 = 0

    //IB Ouitlets
    //Q1
   
    @IBOutlet weak var q1Good: UIButton!
    
    @IBOutlet weak var q1regular: UIButton!
    
    
    @IBOutlet weak var q1Bad: UIButton!
    
    //q2
    
    
    @IBOutlet weak var q2Good: UIButton!
    
    @IBOutlet weak var q2Regular: UIButton!
    
    @IBOutlet weak var q2Bad: UIButton!
    
    //Q3
    
    @IBOutlet weak var q3Good: UIButton!
    
    @IBOutlet weak var q3Regular: UIButton!
    
    
    @IBOutlet weak var q3Bad: UIButton!
    
    
    //RATING PROPERTIES
    var q1score = 0
    var q2score = 0
    var q3score = 0
    
    
  //  public var gymscore : Int = 5
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //prepare data for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let scv = segue.destination as! ThankYouViewController
        scv.gymScore = Int(score)
    }
    
    
//Ib Actions
    //q1
    @IBAction func q1GoodSelected(_ sender: Any) {
        q1score = 5
        
        selectButton(q1Good,q1regular,q1Bad)    }
    
    @IBAction func q1RegularSelected(_ sender: Any) {
        q1score = 3
        selectButton(q1regular, q1Bad, q1Good)    }
    
    @IBAction func q1BadSelected(_ sender: Any) {
        q1score = 2
        selectButton(q1Bad, q1regular, q1Good)    }
    
    //q2
    
    @IBAction func q2GoodSelected(_ sender: Any) {
        q2score = 5
        selectButton(q2Good, q2Bad, q2Regular)
        
    }
    
    @IBAction func q2RegularSelected(_ sender: Any) {
        q2score = 3
        selectButton(q2Regular, q2Bad, q2Good)
    }
    @IBAction func q2BadSelected(_ sender: Any) {
        q2score = 2
        selectButton(q2Bad, q2Good, q2Regular)
        
    }
    //q3
    
    @IBAction func q3GoodSelected(_ sender: Any) {
        q3score = 5
        selectButton(q3Good, q3Bad, q3Regular)    }
    
    
    @IBAction func q3RegularSelected(_ sender: Any) {
        q3score = 3
        selectButton(q3Regular, q3Good, q3Bad)    }
    
    
    @IBAction func q3BadSelected(_ sender: Any) {
        q3score = 2
        selectButton(q3Bad, q3Good, q3Regular)
        
        
    }
    
    
    @IBAction func nextAction(_ sender: Any) {
        performSegue(withIdentifier: "gymtothank", sender: nil)
        
    }
    
    
    
    @IBAction func submit(_ sender: Any) {
        score = Int32(q1score + q2score + q3score)/3
        
        //DataBaseHelper.dataBaseHelper.addGymRating(newGymRating: rating)
        
        print("Gym rating is",score)
        
    }
    
    
    //auxiliar functions
    fileprivate func selectButton(_ selected : UIButton,_ unselected1 : UIButton,_ unselected2: UIButton
    ) {
        selected.backgroundColor = UIColor.darkGray
        unselected1.backgroundColor = UIColor.lightGray
        unselected2.backgroundColor = UIColor.lightGray
    }
    
}
