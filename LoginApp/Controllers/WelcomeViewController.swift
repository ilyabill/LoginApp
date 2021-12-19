//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by ILYA BILARUS on 14.12.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var person: Person?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        welcomeLabel.text = "Welcome, \(person?.userName ?? "User")!"
        
    }
    
    
}
