//
//  DetailViewController.swift
//  HoneyDew
//
//  Created by Alisher Abdukarimov on 5/22/17.
//  Copyright © 2017 MrAliGorithm. All rights reserved.
//

import UIKit
import FirebaseDatabase

class DetailViewController: UIViewController {
    
    
    var toDo: ToDo?
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var descriptionTextField: UITextField!
    @IBOutlet var datePickerLabel: UIDatePicker!
    @IBOutlet var tapGestureRecognizer: UITapGestureRecognizer!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(DetailViewController.dissmissKeyboard))
        view.addGestureRecognizer(tap)
        
        if self.toDo != nil {
            titleTextField.text = toDo?.title
            descriptionTextField.text = toDo?.description
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyy hh:mm a"
            let date = dateFormatter.date(from: (toDo?.dueDate)!)
            datePickerLabel.date = date!
            print("Displayed")
        }
    }


    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        
        if toDo == nil {
            toDo = ToDo()
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy hh:mm a"
        
        
        
        toDo?.title = self.titleTextField.text
        toDo?.description = self.descriptionTextField.text
        toDo?.dueDate = dateFormatter.string(from: self.datePickerLabel.date)
        
        let ref = Database.database().reference()
        let key = ref.child("list").childByAutoId().key
        guard let _title = toDo?.title else { return }
        guard let _description = toDo?.description else { return }
        guard let _dueDate = toDo?.dueDate else { return }
        
        let listTree = ["title" : _title,
                        "description" : _description,
                        "dueDate" : _dueDate]
        
        let childUpdates = ["/list/\(key)": listTree]
        ref.updateChildValues(childUpdates)
        sender.isEnabled = false
        dissmissKeyboard()
    }
    
    func dissmissKeyboard() {
        view.endEditing(true)
    }

}

