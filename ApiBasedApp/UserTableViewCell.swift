//
//  UserTableViewCell.swift
//  ApiBasedApp
//
//  Created by Namrata on 05/06/2019.
//  Copyright © 2019 Namrata. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var UserNameLabel: UILabel!
    
    @IBOutlet weak var EmailLabel: UILabel!
    @IBOutlet weak var UImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
}

