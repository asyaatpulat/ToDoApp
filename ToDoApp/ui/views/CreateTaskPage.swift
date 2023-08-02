//
//  CreateTaskPage.swift
//  ToDoApp
//
//  Created by Asya Atpulat on 2.08.2023.
//

import UIKit

class CreateTaskPage: UIViewController {

    @IBOutlet weak var tfTaskName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonSave(_ sender: Any) {
        if let tn = tfTaskName.text {
            save(name: tn)
        }
    }
    
    func save(name: String) {
        print("save task : \(name) ")
    }
}
