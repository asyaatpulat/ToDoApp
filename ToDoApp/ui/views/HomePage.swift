//
//  ViewController.swift
//  ToDoApp
//
//  Created by Asya Atpulat on 2.08.2023.
//

import UIKit

class HomePage: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tasksTableView: UITableView!
    
    var tasks = [Tasks]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tasksTableView.delegate = self
        tasksTableView.dataSource = self
        
        let t1 = Tasks(id: 1, name: "yoga")
        let t2 = Tasks(id: 2, name: "work")
        let t3 = Tasks(id: 3, name: "gym")
        tasks.append(t1)
        tasks.append(t2)
        tasks.append(t3)
      
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            if let task = sender as? Tasks {
                let segueVC = segue.destination as! TaskDetailPage
                segueVC.task = task
            }
        }
    }
}

extension HomePage : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Search for task : \(searchText)")
    }
}

extension HomePage : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = tasks[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell") as! TasksCell
        cell.labelTask.text = task.name

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: task)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){ _,_,_ in
            let task = self.tasks[indexPath.row]
            
            let alert = UIAlertController(title: "Delete", message: "Do you want to delete \(task.name!)?", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(cancelAction)
            
            let yesAction = UIAlertAction(title: "Yes", style: .destructive){ action in
                print("Delete : \(task.id!)")

            }
            alert.addAction(yesAction)
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
}
