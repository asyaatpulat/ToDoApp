//
//  HomePageViewModel.swift
//  ToDoApp
//
//  Created by Asya Atpulat on 13.08.2023.
//

import Foundation
import RxSwift

class HomePageViewModel {
    var trepo = TasksDaoRepository()
    var tasksList = BehaviorSubject<[Tasks]>(value: [Tasks]())

    init() {
        tasksList = trepo.tasksList
    }
    
    func delete (id: Int) {
        trepo.delete(id: id)
    }
    
    func search (text : String){
        trepo.search(text: text)
    }
    
    func loadTasks(){
        trepo.loadTasks()
    }
}

