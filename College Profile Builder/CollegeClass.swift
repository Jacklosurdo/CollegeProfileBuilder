//
//  CollegeClass.swift
//  College Profile Builder
//
//  Created by jlosurdo on 2/8/17.
//  Copyright © 2017 Jack. All rights reserved.
//

import UIKit
import SafariServices

class CollegeClass: NSObject
{
    var college = ""
    var location = ""
    var numberOfStudents = ""
    var image = UIImage(named: "default")
    var webSite = ""
    
    init(College: String, Location: String, NumberOfStudents: String, Image: UIImage, WebSite: String)
    {
        college = College
        location = Location
        numberOfStudents = NumberOfStudents
        image = Image
        webSite = WebSite
    }
    
    init(College:String, Location:String, WebSite:String)
    {
        college = College
        location = Location
        webSite = WebSite
    }

}
