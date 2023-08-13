//
//  TaskDetailPageViewModel.swift
//  ToDoApp
//
//  Created by Asya Atpulat on 13.08.2023.
//

import Foundation

class TaskDetailViewModel {
    var trepo = TasksDaoRepository()
    
    func update(id:Int , name: String) {
        trepo.update(id: id, name: name)
    }
}
