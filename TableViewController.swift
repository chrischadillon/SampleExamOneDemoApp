//
//  TableViewController.swift
//  SampleExam
//
//  Created by Chris Chadillon on 2017-02-26.
//  Copyright © 2017 Chris Chadillon. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, UpdateAvatar {

    var thePeople:[Person] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var theAvatars:[String?] = ["1", "2", "3", "4", "5", "6",
                                "7", "8", "9", "10" ,"11", "12",
                                "13", "14", "15", "16", "17", "18"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Sample Exam One"
    }
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.thePeople.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TheCell", for: indexPath) as! CustomTableViewCell

        cell.theName.text = self.thePeople[indexPath.row].theName
        
        if let avatarName = self.thePeople[indexPath.row].theAvatar {
            cell.theImage.image = UIImage(named: avatarName)
            cell.theImage.backgroundColor = UIColor.white
        } else {
            cell.theImage.backgroundColor = UIColor.lightGray
        }

        return cell
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if let indexPath = self.tableView.indexPathForSelectedRow {
            if let _ = self.thePeople[indexPath.row].theAvatar {
                return false
            }
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! CollectionViewController
        if let indexPath = self.tableView.indexPathForSelectedRow {
            nextVC.theListOfAvatars = self.theAvatars
            nextVC.theUpdateObject = self
            nextVC.indexOfPerson = indexPath.row
        }
    }
    
    func updateAvatar(indexOfPerson:Int, indexOfImage:Int) {
        if indexOfImage != 0 {
            self.thePeople[indexOfPerson].theAvatar = self.theAvatars[indexOfImage]!
            self.theAvatars.remove(at: indexOfImage)
            self.tableView.reloadData()
        }
    }
    
    @IBAction func doAdd(_ sender: UIBarButtonItem) {
        let addAlert = UIAlertController(title: "Add A Name", message: "Enter Name To Add", preferredStyle: .alert)
        addAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        addAlert.addTextField(configurationHandler: nil)
            addAlert.addAction(UIAlertAction(title: "Add", style: .default ) { (_) in
                guard let name = addAlert.textFields!.first?.text else {
                    return
                }
                self.thePeople.append(Person(theName: name))
            });
        present(addAlert, animated: true, completion: nil)
    }
}
