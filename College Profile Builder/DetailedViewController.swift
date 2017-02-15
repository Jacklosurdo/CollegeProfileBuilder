//
//  DetailedViewController.swift
//  College Profile Builder
//
//  Created by jlosurdo on 2/8/17.
//  Copyright © 2017 Jack. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController
{
    @IBOutlet weak var myImageview: UIImageView!
    @IBOutlet weak var collegeTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var numberOfStudentsTextField: UITextField!
    
    var collegeDetail:CollegeClass!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        myImageview.image = collegeDetail.image
        collegeTextField.text = collegeDetail.college
        locationTextField.text = collegeDetail.location
        numberOfStudentsTextField.text = collegeDetail.numberOfStudents
    }

    @IBAction func saveButtonTapped(_ sender: Any)
    {
        
    }
    
    
}
