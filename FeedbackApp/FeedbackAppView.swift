//
//  FeedbackAppView.swift
//  FeedbackApp
//
//  Created by Ives Murillo on 3/6/22.
//

import Foundation
import UIKit

class FeedbackAppView : UIView{
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        FeedbackAppView.appearance().backgroundColor = UIColor.systemBackground
        
        UIButton.appearance().backgroundColor = UIColor.darkGray
        UIButton.appearance().layer.cornerRadius = 22
        // appearance().layer.cornerRadius = 22
        
    }
}


@IBDesignable class LogAndRegisterButtons : UIButton{
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setProperties()
    }
    
    func setProperties(){
        LogAndRegisterButtons.appearance().backgroundColor = UIColor.purple
      
        var cornerRadius: CGFloat = 22.0 {
                didSet {
                    layer.cornerRadius = cornerRadius
                    layer.masksToBounds = cornerRadius > 0
                }
            }
    }
}
