//
//  ViewController.swift
//  loginpage
//
//  Created by Manoj on 07/02/19.
//  Copyright © 2019 Manoj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tiger: UIImageView!
    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        image.layer.cornerRadius = image.frame.size.width/2
        image.clipsToBounds = true
        
        tiger.layer.cornerRadius = tiger.frame.size.width/2
        tiger.clipsToBounds = true
    }


}

