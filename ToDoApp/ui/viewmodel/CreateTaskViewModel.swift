//
//  CreateTaskPageViewModel.swift
//  ToDoApp
//
//  Created by Asya Atpulat on 13.08.2023.
//

import Foundation

class CreateTaskViewModel {
    var trepo = TasksDaoRepository()
    
    func save(name: String) {
        trepo.save(name: name)
    }
}
