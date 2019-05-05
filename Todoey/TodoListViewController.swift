//
//  ViewController.swift
//  Todoey
//
//  Created by Henry on 5/5/19.
//  Copyright © 2019 Henry Kivimaa. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = ["Find Mike", "Buy Eggos", "Destroy Demogorgon"]
    let defaults  = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let items = defaults.array(forKey: "TodoListArray") as? [String] {
            itemArray = items
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell  = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        let title = itemArray[indexPath.row]
        
        cell.textLabel?.text = title
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark ? .none : .checkmark
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let alert     = UIAlertController(title: "Add new Todoey item", message: "", preferredStyle: .alert)
        let action    = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            self.itemArray += [textField.text!]
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

