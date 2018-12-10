//
//  EventCell.swift
//  TimeTableForSamara
//
//  Created by Timur Karimov on 10/12/2018.
//  Copyright © 2018 Timur Karimov. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var teacherName: UILabel!
    @IBOutlet weak var place: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var day: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    

    

}
