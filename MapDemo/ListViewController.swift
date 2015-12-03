//
//  ListViewController.swift
//  MapDemo
//
//  Created by Sultan Nakyp on 2015-12-02.
//  Copyright © 2015 Sultanio. All rights reserved.
//

import Foundation
import MapKit

class ListViewController: UITableViewController {
    var mapItems = [MapItem]()
    let userLocation = CLLocation(latitude: 49.14, longitude: -122.86)
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mapItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ListViewCell", forIndexPath: indexPath)
        let item = mapItems[indexPath.row]
        cell.textLabel?.text = item.name
        let dist = Int(userLocation.distanceFromLocation(item.location) / 1000)
        cell.detailTextLabel?.text = "\(dist) km"
        return cell
    }
    
    @IBAction func unwindToList(segue: UIStoryboardSegue) {
        if segue.identifier == "Done" {
            let addItemController = segue.sourceViewController as! MapViewController
            if let addItem = addItemController.newItem {
                mapItems.append(addItem)
                let indexPath = NSIndexPath(forRow: mapItems.count - 1, inSection: 0)
                tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            }
        }
    }
}