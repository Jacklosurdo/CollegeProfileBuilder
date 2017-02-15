//
//  CollegeClass.swift
//  College Profile Builder
//
//  Created by jlosurdo on 2/8/17.
//  Copyright © 2017 Jack. All rights reserved.
//

import UIKit

class CollegeClass: NSObject
{
    var college = ""
    var location = ""
    var numberOfStudents = ""
    var image = UIImage(named: "default")
    
    init(College:String, Location:String, NumberOfStudents:String, Image:UIImage)
    {
        college = College
        location = Location
        numberOfStudents = NumberOfStudents
        image = Image
    }
    
    init(College:String, Location:String)
    {
        college = College
        location = Location
    }

}
