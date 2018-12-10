//
//  ViewController.swift
//  TimeTableForSamara
//
//  Created by Timur Karimov on 10/12/2018.
//  Copyright © 2018 Timur Karimov. All rights reserved.
//

import UIKit

class MainVC: UITableViewController {

    var json: JSONHandler!
    var coreData: CoreDataHandler!
    var eventArray: [Event]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coreData = CoreDataHandler()
        json = JSONHandler()

        if coreData.eventsCoreDataCount() != 0{
            print("get from CoreData")
            eventArray = coreData.getEvents()
        } else {
            json.getData()
            print("Get from url")
            eventArray = json.eventArray
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Event", for: indexPath) as! EventCell
        let event = eventArray[indexPath.row]
        cell.name.text = event.name
        cell.teacherName.text = event.teacher
        cell.place.text = event.place
        cell.day.text = DateTimeHandler.getDayOfWeek(day: event.weekDay!)
        cell.time.text = DateTimeHandler.getTime(event: event)
        
        if event.weekDay == 6 || event.weekDay == 7 {
            cell.day.textColor = UIColor.red
        } else {
            cell.day.textColor = UIColor.blue
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "Info", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Info" {
            let vc = segue.destination as! InfoVC
            vc.event = eventArray[(tableView.indexPathForSelectedRow?.row)!]
        }
        
    }


}

