//
//  ViewController.swift
//  Todoey
//
//  Created by Henry on 5/5/19.
//  Copyright © 2019 Henry Kivimaa. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = [Item]()
    let defaults  = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem   = Item()
        newItem.title = "Find Mike"
        itemArray    += [newItem]
        
        let newItem2   = Item()
        newItem2.title = "Buy Eggos"
        itemArray     += [newItem2]
        
        let newItem3   = Item()
        newItem3.title = "Destroy Demogorgon"
        itemArray     += [newItem3]
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell  = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        let item  = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        cell.accessoryType   = item.done ? .checkmark : .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let alert     = UIAlertController(title: "Add new Todoey item", message: "", preferredStyle: .alert)
        let action    = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            let newItem     = Item()
            newItem.title   = textField.text!
            self.itemArray += [newItem]
            
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            self.tableView.reloadData()
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Enter a new Todoey item"
            textField = alertTextField
            
        }
        
        alert.addAction(action)
        present(alert, animated: true)
    }
    
}

