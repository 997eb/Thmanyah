//
//  movieCollectionViewCell.swift
//  thmanyah
//
//  Created by Ebtsam alkhuzai on 19/05/1443 AH.
//

import UIKit

class movieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var moviePeriod: UILabel!
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var playView: UIView!
    
    override func awakeFromNib() {
        moviePoster.layer.cornerRadius = 4
        moviePoster.clipsToBounds = true
        
        playView.layer.cornerRadius = playView.layer.bounds.width / 2
        playView.layer.borderWidth = 2
        playView.layer.borderColor = UIColor.white.cgColor

    }
    
}
