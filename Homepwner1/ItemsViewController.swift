//
//  ItemsViewController.swift
//  Homepwner1
//
//  Created by Yingqi Liu on 3/13/17.
//  Copyright © 2017 Yingqi Liu. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {
    var itemStore: ItemStore!
    
    @IBAction func addNewItem(_ sender: UIButton) {
        //Create a new item and add it to the store
        let newItem = itemStore.createItem()
        
        //figure out where that item is in the array
        if let index = itemStore.allItems.index(of: newItem){
            let indexPath = IndexPath(row: index, section: 0)
            
            //insert this new row into the table
            tableView.insertRows(at: [indexPath], with:.automatic)
        }
    }
    
    @IBAction func toggleEditingMode(_ sender: UIButton) {
        //if you are currently in editing mode...
        if isEditing {
            //change text of button to inform user of state
            sender.setTitle("Edit", for: .normal)
            
            //turn off editing mode
            setEditing(false, animated: true)
        } else {
            //change text of button to inform user of state
            sender.setTitle("Done", for:.normal)
            
            //enter editing mode
            setEditing(true, animated: true)
        }
    }
    
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section:Int) -> Int {
        return itemStore.allItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Get a new or recycled cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        //Set the text on the cell with the decription of the item
        //that is at the nth index of items, where n = row this cell
        //will appear in on the tableView
        let item = itemStore.allItems[indexPath.row]
        
        let title = "Delete\(item.name)?"
        let message = "Are you sure you want to delete this item?"
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        ac.addAction(cancelAction)
        
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: {(action)-> Void in
            //Remove the item from the store
            self.itemStore.removeItem(item)
            
            //Also remove that row from the tableiew with an animation
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            
        })
        ac.addAction(deleteAction)
        
        //Present the alert controller
        present(ac, animated: true, completion: nil)
        
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$\(item.valueInDollars)"

        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle,
                            forRowAt indexPath: IndexPath){
        // if hte table view is asking to commit a delete command
        if editingStyle == .delete {
            let item = itemStore.allItems[indexPath.row]
            //Remocw the item from the store
            itemStore.removeItem(item)
            
            //Also remove that row from the table view with an animation
            tableView.deleteRows(at: [indexPath],with: .automatic)
        }
    }
    
   override func tableView(_ tableView: UITableView,
                            moveRowAt sourceIndexPath: IndexPath,
                            to destinationIndexPath: IndexPath) {
        //update the model
        itemStore.moveItem(from: sourceIndexPath.row , to: destinationIndexPath.row)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Get the height of the status bar
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight, left:0 , bottom: 0, right:0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
    }
    
 

    
}
