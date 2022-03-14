//
//  ViewControllerHomePage.swift
//  FeedbackApp
//
//  Created by admin on 3/1/22.
//

import UIKit
import AVFoundation

class ViewControllerHomePage: UIViewController {
    
    
   
    //IB outlets
    
    
    @IBOutlet weak var videoPlayer: UIView!
    
    @IBOutlet weak var company: UILabel!
    
    @IBOutlet weak var logo: UIImageView!
    
    @IBOutlet weak var prove: UIButton!
    @IBOutlet weak var srartButton: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       playBacgroundVideo()
    }
    
    
    
    @IBAction func startAction(_ sender: Any) {
        
        
    }
    
    func playBacgroundVideo(){
        guard let path = Bundle.main.path(forResource: "video 2", ofType: ".mp4") else {
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
       // player!.actionAtItemEnd = AVPlayer.ActionAtItemEnd.none
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        self.videoPlayer.layer.addSublayer(playerLayer)
        player.play()
        self.videoPlayer.bringSubviewToFront(srartButton)
        self.videoPlayer.bringSubviewToFront(prove)
        self.videoPlayer.bringSubviewToFront(company)
     /*  self.view.layer.insertSublayer(playerLayer)
        NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: player?.currentItem)
        player!.seek(to: CMTime.zero)
        player!.play()
        self.player?.isMuted = true*/
    }
    
   

}
