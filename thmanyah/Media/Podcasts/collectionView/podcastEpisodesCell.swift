//
//  podcastEpisodesCell.swift
//  thmanyah
//
//  Created by Ebtsam alkhuzai on 21/05/1443 AH.
//

import UIKit

class podcastEpisodesCell: UICollectionViewCell {
    
    @IBOutlet weak var podcastEpView: UIView!
    @IBOutlet weak var audioView: UIView!
    @IBOutlet weak var podcastName: UILabel!
    @IBOutlet weak var podacastEpisodeName: UITextView!
    @IBOutlet weak var podcastImage: UIImageView!
    
    static let identifier = "podcastEpisodesCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "podcastEpisodesCell",
                     bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        podcastImage.layer.cornerRadius = 5
        audioView.layer.cornerRadius = audioView.layer.bounds.width / 2
        audioView.layer.borderWidth = 2
        audioView.layer.borderColor = UIColor.white.cgColor

    }

    
  
    
    public func configureInfo(with info: PodcastInfo){
        self.podcastImage.image = UIImage(named: info.podcastImage!)
        self.podacastEpisodeName.text = info.podcastEpsiodeTitle
        self.podcastName.text = info.podcastPeriod
        
        self.podacastEpisodeName.font = UIFont(name: "IBMPlexSansArabic-SemiBold", size: 16)
        self.podcastName.font = UIFont(name: "IBMPlexSansArabic-Regular", size: 12)
    
    }
}
