//
//  TasksViewController.swift
//  DOit
//
//  Created by Derek Jacobs on 2017-04-04.
//  Copyright © 2017 Derek Jacobs. All rights reserved.
//

import UIKit
// add to class the data source and delegate as before
class TasksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var tasks : [Task] = [] //empty array of type Task
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tasks = makeTasks() //must be done above the table otherwise table will be made too damn soon
        
        tableView.dataSource = self // if doing this must go adjust class
        tableView.delegate = self
        
    }
// how many rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
 // what to return for said cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell() //is the class and we're making an object of that class 
        let task = tasks[indexPath.row] //current task in order
        if task.important {
            cell.textLabel?.text = "❗️\(task.name)"
        } else {
            cell.textLabel?.text = task.name //gives the cell that name
        }
        
        return cell
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func makeTasks () -> [Task] {
        let task1 = Task()
        task1.name = "Walk the dog"
        task1.important = false
        
        let task2 = Task()
        task2.name = "Buy cheese"
        task2.important = true
        
        let task3 = Task()
        task3.name = "Mow Lawn"
        task3.important = false
        
        return [task1, task2, task3] //creating array of tasks, as a dummy list
    }

    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    } // give action to the button, and tie to the segue made in storyboard

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // giving  link back to this VC from createtaskVC
        let nextVC = segue.destination as! CreateTaskViewController
        nextVC.previousVC = self // creating a reference of its own type when going to the next VC so that VC can send info back
        
    }
}

