//
//  JSONHandler.swift
//  TimeTableForSamara
//
//  Created by Timur Karimov on 10/12/2018.
//  Copyright © 2018 Timur Karimov. All rights reserved.
//

import Foundation


class JSONHandler {
    var eventArray: [Event] = []
    
    let urlJSON = "https://sample.fitnesskit-admin.ru/schedule/get_group_lessons_v2/4/"
    
    
    func getData() {
        if let url = URL(string: urlJSON) {
            if let data = try? Data(contentsOf: url) {
                parse(data: data)
            }
        }
    }
    

    func parse(data: Data) {
        
        let decoder = JSONDecoder()
        
        if let jsonEvents = try? decoder.decode([Event].self, from: data) {
            eventArray = jsonEvents
            let core = CoreDataHandler()
            core.addEvents(eventArray: eventArray)
            
        }
    }
    
    
    
}
