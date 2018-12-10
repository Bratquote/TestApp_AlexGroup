//
//  DateTimeHandler.swift
//  TimeTableForSamara
//
//  Created by Timur Karimov on 10/12/2018.
//  Copyright © 2018 Timur Karimov. All rights reserved.
//

import Foundation

class DateTimeHandler {
    static func getTime(event: Event) -> String {
        let time = "\(event.startTime!) - \(event.endTime!)"
        return time
    }
    
    static func getDayOfWeek(day: Int) -> String {
        let days = ["Понедельник","Вторник","Среда","Четверг","Пятница","Суббота","Воскресенье"]
        if day > days.count {
            return "Error"
        }
        else {
            return days[day-1]
        }
    }
}
