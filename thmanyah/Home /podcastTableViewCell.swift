//
//  podcastTableViewCell.swift
//  thmanyah
//
//  Created by Ebtsam alkhuzai on 19/05/1443 AH.
//

import UIKit

class podcastTableViewCell: UITableViewCell {

    @IBOutlet weak var podcastDetails: UILabel!
    @IBOutlet weak var line: UIView!
    @IBOutlet weak var podcastPeriod: UILabel!
    @IBOutlet weak var podcastDescription: UILabel!
    @IBOutlet weak var podcastTitle: UILabel!
    @IBOutlet weak var publishedDate: UILabel!
    @IBOutlet weak var podcastImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      podcastImage.layer.cornerRadius = 5
        let frame2 = CGRect(x: 0, y: podcastDetails.frame.size.height, width: podcastDetails.frame.size.width, height: 0.3)
        let borderBottom2 = UIView(frame: frame2)
        borderBottom2.backgroundColor = UIColor(red: 180/255, green: 74.0/255, blue: 39.0/255, alpha: 1.0)
        podcastDetails.addSubview(borderBottom2)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
