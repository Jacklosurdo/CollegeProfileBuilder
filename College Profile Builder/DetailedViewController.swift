//
//  DetailedViewController.swift
//  College Profile Builder
//
//  Created by jlosurdo on 2/8/17.
//  Copyright © 2017 Jack. All rights reserved.
//

import UIKit
import SafariServices

class DetailedViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    @IBOutlet weak var myImageview: UIImageView!
    @IBOutlet weak var collegeTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var numberOfStudentsTextField: UITextField!
    
    var collegeDetail:CollegeClass!
    let imagePicker = UIImagePickerController()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        print(collegeDetail.webSite)
        print(collegeDetail.college, collegeDetail.location)
        myImageview.image = collegeDetail.image
        collegeTextField.text = collegeDetail.college
        locationTextField.text = collegeDetail.location
        numberOfStudentsTextField.text = collegeDetail.numberOfStudents
        imagePicker.delegate = self
    }

    @IBAction func saveButtonTapped(_ sender: Any)
    {
        collegeDetail.image = myImageview.image
        collegeDetail.college = collegeTextField.text!
        collegeDetail.location = locationTextField.text!
        collegeDetail.numberOfStudents = numberOfStudentsTextField.text!
    }
    
    
    @IBAction func openSafariForColleges(_ sender: Any)
    {
        let URLstring = URL(string: collegeDetail.webSite)
        let svc = SFSafariViewController(url: URLstring!)
        present(svc, animated: true, completion: nil)
    }
    

    @IBAction func photoLibraryTapped(_ sender: Any)
    {
        getPhotoLibrary()
    }
    
    func getPhotoLibrary()
    {
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
   {
        imagePicker.dismiss(animated: true) { 
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.myImageview.image = selectedImage
        }
    
    }

    
    
    
}
