//
//  Tasks.swift
//  ToDoApp
//
//  Created by Asya Atpulat on 2.08.2023.
//

import Foundation

class Tasks {
    var id : Int?
    var name : String?
    
    init(){
        
    }
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
    
}
