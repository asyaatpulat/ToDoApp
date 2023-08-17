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
        copyDatabase()
        tasksList = trepo.tasksList
    }
    
    func delete (id: Int) {
        trepo.delete(id: id)
        trepo.loadTasks()
    }
    
    func search (text : String){
        trepo.search(text: text)
    }
    
    func loadTasks(){
        trepo.loadTasks()
    }
    
    func copyDatabase() {
        let bundlePath = Bundle.main.path(forResource: "tasks", ofType: ".sqlite")
        
        let filePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseURL = URL(fileURLWithPath: filePath).appendingPathComponent("tasks.sqlite")
        
        let fm = FileManager.default
        if fm.fileExists(atPath: databaseURL.path()){
            print("there is already database.")
        }else{
            do{
                try fm.copyItem(atPath: bundlePath!, toPath: databaseURL.path)
            }
            catch{
                print(error.localizedDescription)
            }
        }
    }
}

