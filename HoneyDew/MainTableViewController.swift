//
//  MainTableViewController.swift
//  HoneyDew
//
//  Created by Alisher Abdukarimov on 5/22/17.
//  Copyright © 2017 MrAliGorithm. All rights reserved.
//

import UIKit
import Firebase
class MainTableViewController: UITableViewController {
    
    
    var todoList = [ToDo]()

    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
    }

    func loadData() {
        
        todoList.removeAll()
        
        let ref = Database.database().reference()
        ref.child("list").observeSingleEvent(of: .value, with: { (snapshot) in
            if let toDoList = snapshot.value as? [String:AnyObject] {
                
                for (_,listElement) in toDoList {
                    print(listElement)
                    let list = ToDo()
                    list.title = listElement["title"] as? String
                    list.description = listElement["description"] as? String
                    list.dueDate = listElement["dueDate"] as? String
                    self.todoList.append(list)
                    
                }
            }
            

            
            
            self.tableView.reloadData()
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todoList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        cell?.textLabel?.text = todoList[indexPath.row].title
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "detailVC") as! DetailViewController
         detailVC.toDo = todoList[indexPath.row]
         self.navigationController?.pushViewController(detailVC, animated: true)
    }

}
