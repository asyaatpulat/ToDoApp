//
//  ViewController.swift
//  ToDoApp
//
//  Created by Asya Atpulat on 2.08.2023.
//

import UIKit

class HomePage: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func buttonDetail(_ sender: Any) {
        let task = Tasks(id: 1, name: "Workout")
        performSegue(withIdentifier: "toDetail", sender: task)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            if let task = sender as? Tasks {
                let segueVC = segue.destination as! TaskDetailPage
                segueVC.task = task
            }
        }
    }
}

