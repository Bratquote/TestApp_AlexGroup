//
//  InfoVC.swift
//  TimeTableForSamara
//
//  Created by Timur Karimov on 10/12/2018.
//  Copyright © 2018 Timur Karimov. All rights reserved.
//

import UIKit

class InfoVC: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var teacherName: UILabel!
    @IBOutlet weak var place: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var day: UILabel!
    @IBOutlet weak var detailInfo: UILabel!
    
    
    var event: Event!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        // Do any additional setup after loading the view.
    }
    
    func setup() {
        name.text = event.name
        teacherName.text = event.teacher
        place.text = event.place
        time.text = DateTimeHandler.getTime(event: event)
        day.text = DateTimeHandler.getDayOfWeek(day: event.weekDay!)
        detailInfo.text = event.description
        
        if event.weekDay == 6 || event.weekDay == 7 {
            day.textColor = UIColor.red
        } else {
            day.textColor = UIColor.blue
        }
        
    }

}
