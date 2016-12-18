//
//  MyTableViewCell.swift
//  weather
//
//  Created by mike on 12/11/16.
//  Copyright © 2016 mike. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var vv_zipCode: UILabel!
    @IBOutlet weak var Temp: UILabel!
    @IBOutlet weak var cv_lbCityname: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
