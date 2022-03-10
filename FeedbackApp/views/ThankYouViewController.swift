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
    
    @IBOutlet weak var rooratinglabel: UILabel!
    // Overall rating
    
    var overalRating = 0
    
    //data to recive
   var roomScore = 0
   var foodScore = 0
   var gymScore = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()

        rooratinglabel.text = String(gymScore)
        rooratinglabel.text = String(foodScore)
        rooratinglabel.text = String(roomScore)
        
    }

    
    //IB Actions
    
    
    @IBAction func submitOverallrating(_ sender: Any) {
      
        
        displayFerewell()
       
        
    
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
        case 2:
            return cell1star
        default :
            return cell1star
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let message = "selected rating"
        switch indexPath.item {
            
       
        case 0:
            overalRating = 5
            
            print(message,overalRating)
        case 1:
            overalRating = 3
            print(message,overalRating)
        case 2:
            overalRating = 1
            print(message,overalRating)
        default :
          
            print(0)
            
        }
        
    }
    
    
    //Auxiliart functions
    func showAlertView(title: String,msg: String){
        let alertController = UIAlertController(title: title, message: msg, preferredStyle: .alert)
       // let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default){
            action in self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(okButton)
        present(alertController, animated: true, completion: nil)
    }
    
    
    //calculating rating
    
    func displayFerewell(){
        let averageRating = calculateAverage()
        let cupon = issueCupon(averageRating)
         
        if(averageRating >= 4){
            showAlertView(title: "Until the next time ", msg: "Thanks for staying whit us,the next number cupo is for a surprice in your next vacation \(cupon)")
            
        }else if(averageRating == 3){
            showAlertView(title: "We want to see you again", msg: "Please take the next cupon ,whit discounts and surprises  \(cupon)")
            
        }else if(averageRating < 3){
            showAlertView(title: "We so sorry ", msg: "we sorry you didnt enjoy our services, please take the next cupon for a free vacation  \(cupon)")
        }else{
            
        }
    
    }
    //averagfe rating
    func calculateAverage() -> Int32{
        let roomRating = roomScore
        print(roomScore)
        let gymrating = gymScore
        print(gymScore)
        let foodrating = foodScore
        print(foodScore)
        let allrating = overalRating
        print(overalRating)
        
        //save rating
        
        DataBaseHelper.dataBaseHelper.addRating(newRoomRating: Int32(roomRating), newFoodRating: Int32(gymrating), newGymRating: Int32(gymrating), newOverall: Int32(allrating))
        
        let average = Int32(Float16((Int(Int32(roomRating)) + gymrating + foodrating + allrating)/4))
        print("the average rrating is \(average)")
        
        return average
    }
    
    //cupon
    
    func issueCupon(_ rating : Int32) -> Int32{
        let startRange = rating * 1000
        let endRange = (startRange + 1000) - 1
        return Int32.random(in: startRange ... endRange)
    }
    
    
    
}
