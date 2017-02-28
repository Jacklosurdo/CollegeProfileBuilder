//
//  ViewController.swift
//  College Profile Builder
//
//  Created by jlosurdo on 2/7/17.
//  Copyright © 2017 Jack. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var myTableView: UITableView!
    var myCollegeObject:[CollegeClass] = []
     

    override func viewDidLoad()
    {
        super.viewDidLoad()
        myCollegeObject.append(CollegeClass(College: "Loyola", Location: "Chicago", NumberOfStudents: "15,902", Image: UIImage(named: "loyola")!, WebSite:"http://www.luc.edu/"))
        myCollegeObject.append(CollegeClass(College: "La Crosse", Location: "La Crosse", NumberOfStudents: "10,669", Image: UIImage(named: "laCrosse")!, WebSite:"https://www.uwlax.edu/"))
        myCollegeObject.append(CollegeClass(College: "Madison", Location: "Madison", NumberOfStudents: "42,598", Image: UIImage(named: "madison")!, WebSite:"http://www.wisc.edu/"))
    }
    override func viewDidAppear(_ animated: Bool)
    {
        myTableView.reloadData()
    }

    @IBAction func addButtonTapped(_ sender: Any)
    {
        let alert = UIAlertController(title: "Add a College", message: nil, preferredStyle: .alert)
        alert.addTextField { (collegeTextField) in collegeTextField.placeholder = "Add College Here"}
        alert.addTextField { (locationTextField) in locationTextField.placeholder = "Add Location of College"}
        alert.addTextField { (webSiteTextField) in webSiteTextField.placeholder = "Add College URL"}
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "Add College", style: .default)
        {
            (action) in
            let collegeTextField = alert.textFields?[0]
            let locationTextField = alert.textFields?[1]
            let webSiteTextField = alert.textFields?[2]
            
            self.myCollegeObject.append(CollegeClass(College: (collegeTextField?.text)!, Location: (locationTextField?.text)!, WebSite: (webSiteTextField?.text)!))
            self.myTableView.reloadData()
        }
        alert.addAction(addAction)
        
        present(alert,animated: true, completion:nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return myCollegeObject.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = myCollegeObject[indexPath.row].college
        cell.detailTextLabel?.text = myCollegeObject[indexPath.row].location
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if (editingStyle == .delete)
        {
            myCollegeObject.remove(at: indexPath.row)
            myTableView.reloadData()
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let detailView = segue.destination as! DetailedViewController
        let selectedRow = myTableView.indexPathForSelectedRow?.row
        detailView.collegeDetail = myCollegeObject[selectedRow!]
    }
    
    

    



}

