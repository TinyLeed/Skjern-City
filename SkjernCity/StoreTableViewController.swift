//
//  StoresableViewController.swift
//  SkjernCity
//
//  Created by Mads Pedersen on 10/10/15.
//  Copyright © 2015 Mads Pedersen. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class StoreTableViewController: PFQueryTableViewController {

    // Initialise the PFQueryTable tableview
    override init(style: UITableViewStyle, className: String!) {
        super.init(style: style, className: className)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Configure the PFQueryTableView
        self.parseClassName = "StoreProfiles"
        self.textKey = "storeName"
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false
    }
    
    // Define the query that will provide the data for the table view
    override func queryForTable() -> PFQuery {
        let query = PFQuery(className: "StoreProfiles")
        query.orderByAscending("storeName")
        return query
    }
    
    //override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! PFTableViewCell!
        if cell == nil {
            cell = PFTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        }
        
        // Extract values from the PFObject to display in the table cell
        if let storeName = object?["storeName"] as? String {
            cell?.textLabel?.text = storeName
        }
        if let storeAddress = object?["storeAddress"] as? String {
            cell?.detailTextLabel?.text = storeAddress
        }
        
        return cell
    }
}
