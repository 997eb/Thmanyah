//
//  articalMainTableViewCell.swift
//  thmanyah
//
//  Created by Ebtsam alkhuzai on 24/05/1443 AH.
//

import UIKit

class articalMainTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mainArticalName: UITextView!
    @IBOutlet weak var mainArticalPublishDate: UILabel!
    @IBOutlet weak var mainArticalAuthor: UILabel!
    @IBOutlet weak var mainArticalImage: UIImageView!
    
    static let identifier = "articalMainTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "articalMainTableViewCell",
                     bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        mainArticalImage.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func configureMain(with list: mainArtical ){
        
        self.mainArticalName.text = list.mainArticalName
        self.mainArticalPublishDate.text = list.mainArticalPublishDate
        self.mainArticalAuthor.text = list.mainArticalAuthor
        self.mainArticalImage.image =  UIImage(named: list.mainArticalImage!)
        
        self.mainArticalName.font = UIFont(name: "IBMPlexSansArabic-Bold", size: 25)
        self.mainArticalPublishDate.font = UIFont(name: "IBMPlexSansArabic-Medium", size: 12)
        self.mainArticalAuthor.font =  UIFont(name: "IBMPlexSansArabic-SemiBold", size: 15)
        
    }
    
}
