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
    let db:FMDatabase?
    
    init(){
        let filePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseURL = URL(fileURLWithPath: filePath).appendingPathComponent("tasks.sqlite")
        db = FMDatabase(path: databaseURL.path)
    }
    func save(name: String) {
        db?.open()
        do{
            try db!.executeUpdate("INSERT INTO tasks (name) VALUES (?)", values: [name])
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func update(id:Int , name: String) {
        db?.open()
        do{
            try db!.executeUpdate("UPDATE tasks SET name = ? WHERE id = ?", values: [ name ,id])
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
        
    }
    
    func delete (id: Int) {
        db?.open()
        do{
            try db!.executeUpdate("DELETE FROM tasks WHERE id = ?", values: [id])
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
        
    }
    
    func search (text : String){
        db?.open()
        var list = [Tasks]()
        
        do{
            let result = try db!.executeQuery("SELECT * FROM tasks WHERE name like '%\(text)%'", values: nil)
            while result.next() {
                let id = Int(result.string(forColumn: "id") )!
                let name = result.string(forColumn: "name")!
                let tasks = Tasks(id: id, name: name)
                
                list.append(tasks)
            }
            tasksList.onNext(list)

        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func loadTasks(){
        db?.open()
        var list = [Tasks]()
        
        do{
            let result = try db!.executeQuery("SELECT * FROM tasks", values: nil)
            while result.next() {
                let id = Int(result.string(forColumn: "id") )!
                let name = result.string(forColumn: "name")!
                let tasks = Tasks(id: id, name: name)
                list.append(tasks)
            }
            tasksList.onNext(list)

        }catch{
            print(error.localizedDescription)
        }
        db?.close()
        
    }
}
