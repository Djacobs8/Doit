//
//  CompleteTaskViewController.swift
//  DOit
//
//  Created by Derek Jacobs on 2017-04-04.
//  Copyright © 2017 Derek Jacobs. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {

    @IBOutlet weak var taskLabel: UILabel!
    
    var task = Task()
    
    var previousVC = TasksViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if task.important {
            taskLabel.text = "❗️\(task.name)"
        } else {
            taskLabel.text = task.name //gives the cell that name
        }
    }

    @IBAction func completeTapped(_ sender: Any) {
        previousVC.tasks.remove(at: previousVC.selectedIndex)// deletes, no need for append as we aren't adding anything to the previous array
        previousVC.tableView.reloadData() //refreshes that previous screen so the addition to the array is seen
        navigationController!.popViewController(animated: true) // after the button is hit it pops back to the previous screen via animation
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
