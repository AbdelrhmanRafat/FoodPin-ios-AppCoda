//
//  FavouriteTableViewCell.swift
//  FoodPin
//
//  Created by Macbook on 18/12/2020.
//  Copyright © 2020 AppCoda. All rights reserved.
//

import UIKit

class FavouriteTableViewCell: UITableViewCell {
 
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var phoneLabel: UILabel!
    @IBOutlet var thumbnailImageView: UIImageView!
    @IBOutlet var icon1 : UIImageView!
    @IBOutlet var icon2 : UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
