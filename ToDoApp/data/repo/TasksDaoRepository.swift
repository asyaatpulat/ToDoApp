//
//  TasksDaoRepository.swift
//  ToDoApp
//
//  Created by Asya Atpulat on 13.08.2023.
//

import Foundation
import RxSwift

class TasksDaoRepository {
    var tasksList = BehaviorSubject<[Tasks]>(value: [Tasks]())
    func save(name: String) {
        print("save task : \(name) ")
    }
    
    func update(id:Int , name: String) {
        print("save task : \(id) - \(name) ")
    }
    
    func delete (id: Int) {
        print("Delete : \(id)")
    }
    
    func search (text : String){
        print("Search for task : \(text)")
    }
    
    func loadTasks(){
        var list = [Tasks]()
        let t1 = Tasks(id: 1, name: "yoga")
        let t2 = Tasks(id: 2, name: "work")
        let t3 = Tasks(id: 3, name: "gym")
        list.append(t1)
        list.append(t2)
        list.append(t3)
        tasksList.onNext(list)
      
    }
}
