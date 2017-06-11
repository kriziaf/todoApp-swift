//
//  MasterTableViewController.swift
//  Todolist-App
//
//  Created by Kriz Fern on 6/11/17.
//
//

import UIKit

class MasterTableViewController: UITableViewController {
    
    var reuse_cell_identifier = "ToDoCell"
    var todoListItems = ["Go to class", "Grab a bite", "Walk in the city", "Study Swift for an hour", "Watch Handmaids Tale"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Hey my Tableview just loaded YAY!!!")
    }
    
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
      
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.todoListItems.count
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.reuse_cell_identifier, for: indexPath)
        let item = self.todoListItems[indexPath.row]
        cell.textLabel?.text = item
        
        
        return cell
    }
    


    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    
        return true
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("I am on row: \(indexPath.row)")
        let cell = tableView.cellForRow(at: indexPath)
        
        if cell?.accessoryType == UITableViewCellAccessoryType.none {
            
            cell?.accessoryType = UITableViewCellAccessoryType.checkmark
        }
        
        else {
            
            cell?.accessoryType = UITableViewCellAccessoryType.none
        }
            cell?.setSelected(true, animated: true)
            
    }
    
    func doDeleteItem(indexForItem: Int) {
        let item = self.todoListItems[indexForItem]
        self.todoListItems.remove(at: indexForItem)
        print("Removing Item: \(item)")
        
    }
    
    // Override to support editing the table view.
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            // Delete the row from the data source
            self.doDeleteItem(indexForItem: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

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

    // Preparing for segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("About to segue to Add Controller")
        
        
    }
    
     // Making an Unwind Segue - which will bring back information from the Add Controller to the master
    
    @IBAction func prepareUnwindFromAddItemViewController(_ segue: UIStoryboardSegue) {
        
        if segue.source is AddItemViewController {
            let newItemVC = segue.source as? AddItemViewController
            
            if let newItem = newItemVC?.text_input {
                self.todoListItems.append(newItem)
            }
            tableView.reloadData()
        }
    }
    
   
    
    

}
