//
//  InfoViewController.swift
//  LoginApp
//
//  Created by ILYA BILARUS on 19.12.2021.
//

import UIKit

class InfoViewController: UIViewController {
    
    var person: Person?
    
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var aboutMeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //navigationController?.navigationBar.tintColor = UIColor.white
        UINavigationBar.appearance().tintColor = .white
        
        if let person = person {
            personImage.image = person.image
            aboutMeLabel.text = person.aboutMe
        }
        
    }
    
    
    override func viewDidLayoutSubviews() {
        
        personImage.layer.cornerRadius  = personImage.bounds.height / 2
        
    }
    
    
}
