//
//  Stars3TableViewCell.swift
//  FeedbackApp
//
//  Created by Ives Murillo on 3/3/22.
//

import UIKit

class Stars3TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var start3: UIImageView!
    
    
    @IBOutlet weak var start2: UIImageView!
    
    @IBOutlet weak var start1: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
