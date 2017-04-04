//
//  CreateTaskViewController.swift
//  DOit
//
//  Created by Derek Jacobs on 2017-04-04.
//  Copyright © 2017 Derek Jacobs. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    @IBOutlet weak var importantSwitch: UISwitch!
    
    @IBOutlet weak var taskNameTextField: UITextField!
    
    var previousVC = TasksViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addTapped(_ sender: Any) {
        
        //need to create task from the outlets info, add to array in previous VC
        let task = Task()
        task.name = taskNameTextField.text! //  text entered in there
        task.important = importantSwitch.isOn
        
        // Add task to array in Previous VC
        
        previousVC.tasks.append(task)
        previousVC.tableView.reloadData() //refreshes that previous screen so the addition to the array is seen 
        navigationController!.popViewController(animated: true) // after the button is hit it pops back to the previous screen via animation
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
