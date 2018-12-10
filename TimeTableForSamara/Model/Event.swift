//
//  Event.swift
//  TimeTableForSamara
//
//  Created by Timur Karimov on 10/12/2018.
//  Copyright © 2018 Timur Karimov. All rights reserved.
//

import Foundation

struct Event: Codable {
    var name: String?
    var startTime: String?
    var endTime: String?
    var teacher: String?
    var place: String?
    var description: String?
    var weekDay: Int?
}
