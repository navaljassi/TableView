//
//  ViewController.swift
//  TableView
//
//  Created by Naval Jassi on 21/2/18.
//  Copyright © 2018 Naval Jassi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITabBarDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myTableView: UITableView!
    
    
    var data = [Employee]();

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadData();
    }
    
    var filePath: String {
        let manager = FileManager.default;
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first;
        return url!.appendingPathComponent("Data").path;
    }
    
    private func loadData() {
        if let ourData = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as? [Employee] {
            data = ourData;
        }
        
    }
    
    private func saveData(employee: Employee){
        data.append(employee)
        
        NSKeyedArchiver.archiveRootObject(data, toFile: filePath)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count;
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row].FirstName
        //cell.textLabel?.text = data[indexPath.row].LastName
        return cell
    }

    
    @IBAction func addEmployee(_ sender: Any) {
        
        let alert = UIAlertController(title: "Add Employee", message: "Enter Employee's Name", preferredStyle: .alert)
        
        let save = UIAlertAction(title: "Save", style: .default) { (alertAction: UIAlertAction) in
            
            let firstName = alert.textFields?[0].text!;
            let lastName = alert.textFields?[1].text!;
            
            let newEmployee = Employee(firstName: firstName!, lastName: lastName!)
            
            
           // self.data.append(newEmployee);
            self.saveData(employee: newEmployee)
            self.myTableView.reloadData();
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alert.addTextField(configurationHandler: nil)
        alert.addTextField(configurationHandler: nil)

        alert.addAction(save)
        alert.addAction(cancel)
        
        self.present(alert, animated: true, completion: nil);
    }
    

}

