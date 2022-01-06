//
//  articalListTableViewCell.swift
//  thmanyah
//
//  Created by Ebtsam alkhuzai on 24/05/1443 AH.
//

import UIKit

class articalListTableViewCell: UITableViewCell {
    static let identifier = "articalListTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "articalListTableViewCell",
                     bundle: nil)
    }

    @IBOutlet weak var listArticalImage: UIImageView!
    @IBOutlet weak var listread: UILabel!
    @IBOutlet weak var listArticalName: UITextView!
    @IBOutlet weak var listAuthorName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        listArticalImage.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func configureList(with list: listArtials ){
        self.listArticalImage.image = UIImage(named: list.listArticalImage!)
        self.listread.text = list.listread
        self.listArticalName.text = list.listArticalName
        self.listAuthorName.text = list.listAuthorName
        
        self.listArticalName.font = UIFont(name: "IBMPlexSansArabic-Bold", size: 18)
        self.listread.font = UIFont(name: "IBMPlexSansArabic-Medium", size: 12)
        self.listAuthorName.font =  UIFont(name: "IBMPlexSansArabic-SemiBold", size: 13)
    
        
    }
    
}
