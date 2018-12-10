//
//  CoreDataHandler.swift
//  TimeTableForSamara
//
//  Created by Timur Karimov on 10/12/2018.
//  Copyright © 2018 Timur Karimov. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class CoreDataHandler {

    let appDelegate: AppDelegate
    let context: NSManagedObjectContext!
    let EventEntity: NSEntityDescription?
    
    init() {
        self.appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.context = appDelegate.persistentContainer.viewContext
        self.EventEntity = NSEntityDescription.entity(forEntityName: "EventData", in: context)
        
        
    }
    
     func addEvents(eventArray: [Event]) {
        
        for event in eventArray {
            
            let newEvent = NSManagedObject(entity: EventEntity!, insertInto: context)
            newEvent.setValue(event.name, forKey: Key.name.rawValue)
            newEvent.setValue(event.teacher, forKey: Key.teacher.rawValue)
            newEvent.setValue(event.place, forKey: Key.place.rawValue)
            newEvent.setValue(event.startTime, forKey: Key.startTime.rawValue)
            newEvent.setValue(event.endTime, forKey: Key.endTime.rawValue)
            newEvent.setValue(event.weekDay, forKey: Key.day.rawValue)
            newEvent.setValue(event.description, forKey: Key.description.rawValue)
            do {
                try context.save()
            } catch {
                print("Failed saving")
            }
            
        }
    }
    
    func eventsCoreDataCount() -> Int {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "EventData")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request) as! [NSManagedObject]
            print("Result count: \(result.count)")
            return result.count
        } catch {
            
            print("Failed")
        }
        return 0
    }
    
    
    func getEvents() -> [Event] {
        var events = [Event]()
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "EventData")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                var event = Event()
                event.name = data.value(forKey: Key.name.rawValue) as? String
                event.teacher = data.value(forKey: Key.teacher.rawValue) as? String
                event.place = data.value(forKey: Key.place.rawValue) as? String
                event.startTime = data.value(forKey: Key.startTime.rawValue) as? String
                event.endTime = data.value(forKey: Key.endTime.rawValue) as? String
                event.weekDay = data.value(forKey: Key.day.rawValue) as? Int
                event.description = data.value(forKey: Key.description.rawValue) as? String
                
                events.append(event)
                
                
            }
        } catch {
            print("Error: \(error)")
        }
        
        return events
    }
}

enum Key: String {
    case name = "name"
    case teacher = "teacher"
    case place = "place"
    case day = "day"
    case startTime = "startTime"
    case endTime = "endTime"
    case description = "description_"
}


