//
//  ThankYouViewController.swift
//  FeedbackApp
//
//  Created by Ives Murillo on 3/3/22.
//

import UIKit

class ThankYouViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var labelThank: UILabel!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   //TABLE VIEW
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       150
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell5stars") as! OverAllTableViewCell
        cell.start9.image = UIImage(systemName: "star.fill")
      
        
        let cell3start = tableView.dequeueReusableCell(withIdentifier: "cell3stars") as! Stars3TableViewCell
        cell3start.start3.image = UIImage(systemName: "star.fill")
        
        let cell1star = tableView.dequeueReusableCell(withIdentifier: "cell1stars") as! Star1TableViewCell
        
     
        
        switch indexPath.row{
        case 0:
            return cell
        case 1:
            return cell3start
        default :
            return cell1star
        }
        
        
    }
}
