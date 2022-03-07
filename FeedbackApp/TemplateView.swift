//
//  TemplateView.swift
//  FeedbackApp
//
//  Created by Ives Murillo on 3/7/22.
//

import Foundation
import UIKit

class TemplateView : UIView{
    
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        TemplateView.appearance().backgroundColor = UIColor.lightGray
        UIButton.appearance().backgroundColor = UIColor.blue
       // UIButton.a
    }
}
