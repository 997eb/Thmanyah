//
//  playingPodcastViewController.swift
//  thmanyah
//
//  Created by Ebtsam alkhuzai on 25/05/1443 AH.
//

import UIKit
import AVFoundation

class playingPodcastViewController: UIViewController {
    
    @IBOutlet weak var podcastCover: UIImageView!
    @IBOutlet weak var timerView: UIView!
    @IBOutlet weak var playView: UIView!
    @IBOutlet weak var podcast: UILabel!
    @IBOutlet weak var podcastname: UILabel!
    
    var audio:AVAudioPlayer!
    var podcastProgram:String?
    var podcasrEposideName:String?
    var podcasTCoverS:String?
    
    @IBOutlet weak var playBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playView.layer.cornerRadius = playView.layer.bounds.width / 2
        
        timerView.layer.cornerRadius = timerView.layer.bounds.width / 2
        
        podcastCover.layer.cornerRadius = 5
        FillPodcastInfo()
        playAudio()

    }
    
    func playAudio(){
        
        let url = Bundle.main.url(forResource: "audio1", withExtension: "mp3")
        
        do {
            audio = try AVAudioPlayer(contentsOf: url!)
            audio.prepareToPlay()
            audio.play()
            playBtn.setImage(UIImage(named: "pause.jpg"), for: .normal)

        }
        catch let error as NSError {
            print(error.debugDescription)
        }
    }
    
    func FillPodcastInfo(){
        
        self.podcastname.text = podcasrEposideName
        self.podcast.text = podcastProgram
        self.podcastCover.image = UIImage(named: podcasTCoverS!)
        

        self.podcastname.font = UIFont(name: "IBMPlexSansArabic-Bold", size: 22)
        self.podcast.font = UIFont(name: "IBMPlexSansArabic-Bold", size: 23)
       
    }
    
    @IBAction func pause(_ sender: Any) {
        if  playBtn.tag == 0 {
            
            playBtn.setImage(UIImage(named: "play-button.jpg"), for: .normal)
            audio.pause()
            playBtn.tag = 1
            
        }
        else
        {
            playBtn.setImage(UIImage(named: "pause.jpg"), for: .normal)
            audio.play()
            playBtn.tag = 0
        }
    }
    }
    



