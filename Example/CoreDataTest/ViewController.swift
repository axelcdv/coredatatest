//
//  ViewController.swift
//  CoreDataTest
//
//  Created by Axel Colin de Verdière on 11/27/2015.
//  Copyright (c) 2015 Axel Colin de Verdière. All rights reserved.
//

import UIKit
import CoreDataTest

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let myService = MyService.sharedInstance()
        myService.showEntities()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

