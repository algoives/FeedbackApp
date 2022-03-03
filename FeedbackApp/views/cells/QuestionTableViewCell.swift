//
//  QuestionTableViewCell.swift
//  FeedbackApp
//
//  Created by Ives Murillo on 3/2/22.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {
    
    
    
   
    @IBOutlet weak var question: UILabel!
    
  
    @IBOutlet weak var image2: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func happyFaceAction(_ sender: Any) {
        
    }
    
    
    @IBAction func straighFaceAction(_ sender: Any) {
        
    }
    
    
    @IBAction func sadAction(_ sender: Any) {
        
    }
    
}
