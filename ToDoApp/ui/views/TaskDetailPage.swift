//
//  TaskDetailPage.swift
//  ToDoApp
//
//  Created by Asya Atpulat on 2.08.2023.
//

import UIKit

class TaskDetailPage: UIViewController {

    @IBOutlet weak var tfTaskName: UITextField!
    var task : Tasks?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let t = task {
            tfTaskName.text = t.name
        }
    }
    
    @IBAction func updateButton(_ sender: Any) {
        if let tn = tfTaskName.text , let t = task {
            update(id: t.id!, name: tn)
        }
    }
    
    func update(id:Int , name: String) {
        print("save task : \(id) - \(name) ")
    }
}
