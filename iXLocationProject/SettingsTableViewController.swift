//
//  SettingsTableViewController.swift
//  iXLocationProject
//
//  Created by Ryann Consalo on 2017/06/06.
//  Copyright © 2017 Ryann Consalo. All rights reserved.
//

import UIKit
import MapKit

class SettingsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    override func tableView(_tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let color = UserDefaults.standard.string(forKey: "color")
        
        if indexPath.section == 2 && color == nil {
            cell.accessoryType = .checkmark
        }
        
        if indexPath.section == 2 && indexPath.row == 0 && color == "black" {
            cell.accessoryType = .checkmark
        }
        
        if indexPath.section == 2 && indexPath.row == 1 && color == "red" {
            cell.accessoryType = .checkmark
        }
        
        if indexPath.section == 2 && indexPath.row == 2 && color == "green" {
            cell.accessoryType = .checkmark
        }
    }
    
    
    override func tableView(_tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Go to map
        if indexPath.section == 1 && indexPath.row == 0 {
            self.tabBarController?.selectedIndex = 0
        }
        
        // Go to activity log
        if indexPath.section == 1 && indexPath.row == 1 {
            self.tabBarController?.selectedIndex = 1
        }
        
        if indexPath.section == 2 {
            
            // un-select all 
            tableView.cellForRow(at: IndexPath(row:0, section: 2))?.accessoryType = .none
            tableView.cellForRow(at: IndexPath(row:1, section: 2))?.accessoryType = .none
            tableView.cellForRow(at: IndexPath(row:2, section: 2))?.accessoryType = .none
            
            if let cell = tableView.cellForRow(at: indexPath) {
                if indexPath.row == 0 {
                    // set pin to black
                }
                
                if indexPath.row == 1 {
                    // set pin to red
                }
                
                if indexPath.row == 2 {
                    // set pin to green
                }
                
                // Add a checkmark
                cell.accessoryType = .checkmark
            }
            
            
        }
    }
    

}
