//
//  menuTableViewCell.swift
//  thmanyah
//
//  Created by Ebtsam alkhuzai on 20/05/1443 AH.
//

import UIKit

class menuTableViewCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var more: UIImageView!
    @IBOutlet weak var `switch`: UISwitch!
    @IBOutlet weak var meneItem: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if self.traitCollection.userInterfaceStyle == .dark {
            `switch`.isOn = true
        }
        else {
            `switch`.isOn = false
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
