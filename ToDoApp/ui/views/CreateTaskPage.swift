//
//  CreateTaskPage.swift
//  ToDoApp
//
//  Created by Asya Atpulat on 2.08.2023.
//

import UIKit

class CreateTaskPage: UIViewController {

    @IBOutlet weak var tfTaskName: UITextField!
    var viewModel = CreateTaskViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonSave(_ sender: Any) {
        if let tn = tfTaskName.text {
            viewModel.save(name: tn)
        }
    }
}
