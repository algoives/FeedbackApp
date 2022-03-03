//
//  RoomSurveyViewController.swift
//  FeedbackApp
//
//  Created by Ives Murillo on 3/2/22.
//

import UIKit

class RoomSurveyViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate {
   
    
    
    
    //IB outlets
    @IBOutlet weak var labelRoom: UILabel!
    
    @IBOutlet weak var table: UITableView!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    //Ib Actions

    @IBAction func saverate(_ sender: Any) {
    }
    
    
    @IBAction func submit(_ sender: Any) {
    }
    
    
    
    
    //table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellQuestion = tableView.dequeueReusableCell(withIdentifier: "question") as! QuestionTableViewCell
        cellQuestion.question.text = "Question"
       
        return cellQuestion
    }
}
