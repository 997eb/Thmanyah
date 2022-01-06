//
//  articalTableViewCell.swift
//  thmanyah
//
//  Created by Ebtsam alkhuzai on 19/05/1443 AH.
//

import UIKit

class articalTableViewCell: UITableViewCell {
    @IBOutlet weak var authorImage: UIImageView!
    
    @IBOutlet weak var articalImage: UIImageView!
    @IBOutlet weak var publishDate: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var articalTitle: UILabel!
    @IBOutlet weak var authorName: UILabel!
    
    @IBOutlet weak var readTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        authorImage.layer.borderWidth = 1
        authorImage.layer.masksToBounds = false
        authorImage.layer.borderColor = UIColor.black.cgColor
        authorImage.layer.cornerRadius = authorImage.frame.height/2
        authorImage.clipsToBounds = true
        
        articalImage.layer.cornerRadius = 3
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
