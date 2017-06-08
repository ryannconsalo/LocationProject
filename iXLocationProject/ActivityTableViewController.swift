//
//  ActivityTableViewController.swift
//  iXLocationProject
//
//  Created by Ryann Consalo on 2017/06/06.
//  Copyright © 2017 Ryann Consalo. All rights reserved.
//

import UIKit
import Alamofire
import Gloss

class ActivityTableViewController: UITableViewController, AddActivityDelegate {
    
    var activities : [Activity] = []
    var currentlySelectedIndexPath : IndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()
        
       /* let activity = Activity()
        activity?.name = "First"
        activity?.description = "First Activity"
        activities.append(activity!)
        
        let activity2 = Activity()
        activity2?.name = "Second"
        activity2?.description = "Second Activity"
        activities.append(activity2!)
       */
        Alamofire.request("https://ixlocationproject.firebaseio.com/activities.json?auth=4oN5mfyh6Y82NBiSMCnvW3FzkXGNIkhSYz7PvUkA").responseJSON { response in
        
        
        if let JSON = response.result.value {
            print("JSON: \(JSON)")
            let response = JSON as! NSDictionary
            
            for (key, value) in response {
                let activity = Activity()
                if let actDictionary = value as? [String: AnyObject] {
                    activity?.name = actDictionary["name"] as! String
                    activity?.description = actDictionary["description"] as! String
                    if let geoPointDictionary = actDictionary["location"] as? [String: AnyObject] {
                        let location = GeoPoint()
                        location.lat = geoPointDictionary["lat"] as? Double
                        activity?.location = location
                    }
                }
                
                self.activities.append(activity!)
                
            }
            
            self.tableView.reloadData()
        }

        }
    }
    
    
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return activities.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentlySelectedIndexPath = indexPath
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "activityCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = activities[indexPath.item].name
        cell.detailTextLabel?.text = activities[indexPath.item].description
        
        return cell
    }
    
    func didSaveActivity(activity: Activity) {
        activities.append(activity)
        self.tableView.reloadData()
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "details" {
            let activityDetailsViewController = segue.destination as! ActivityDetailsViewController
            
            let cell = sender as! UITableViewCell
            let indexPath = tableView.indexPath(for: cell)
            
            activityDetailsViewController.activity = activities[(indexPath?.row)!]
        }
        
        if segue.identifier == "navToAddActivity" {
            let navigationViewController = segue.destination as! UINavigationController
            let addActivityViewController = navigationViewController.topViewController as! AddActivityViewController
            addActivityViewController.delegate = self
        }
        
    }
 

}
