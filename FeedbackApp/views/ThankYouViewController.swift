//
//  ThankYouViewController.swift
//  FeedbackApp
//
//  Created by Ives Murillo on 3/3/22.
//

import UIKit

class ThankYouViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //IB outlets
   
    @IBOutlet weak var labelThank: UILabel!
    
    // Overall rating
    
    var overalRating = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    //IB Actions
    
    
    @IBAction func submitOverallrating(_ sender: Any) {
        let rating = Int64(overalRating)
        
        DataBaseHelper.dataBaseHelper.addOverallRating(newOverallRating: Int(rating))
        
        var user1 = DataBaseHelper.dataBaseHelper.getOneData(n: "asha")
        print(user1.overall)
        
        var message : String = " "
        var cupon = Int.random(in: 1...10000)
        
        
        if (rating >= 8){
            message = "We glad you enjoy our services,we aprecciate your feedback,apply this number cupon for a discount in your next vacation : \(cupon)"
        }else if (rating >= 5 || rating >= 7){
            message = "Your opinion is very inportant for us ,we invite you to stay whit us again and we promise we deliver a wow next time ,ples copy the next cupon number for big discounts and surprises \(cupon)"
        }else if (rating < 5){
            message = "We sorry about your experiense, wtake our cupon for free vacation : \(cupon)"
        }
        
        showAlertView(msg: message)
        
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.item {
        case 0:
            overalRating = 5
            print(5)
            
        case 1:
            overalRating = 3
            print(3)        case 2:
            overalRating = 2
        default :
            overalRating = 0
            print(2)
            
        }
        
    }
    
    
    func showAlertView(msg: String){
        let alertController = UIAlertController(title: "Was a pleasurue to Serve you", message: msg, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertController.addAction(okButton)
        present(alertController, animated: true, completion: nil)
    }
}
