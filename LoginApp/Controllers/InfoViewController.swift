//
//  InfoViewController.swift
//  LoginApp
//
//  Created by ILYA BILARUS on 19.12.2021.
//

import UIKit

class InfoViewController: UIViewController {
    
    
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var aboutMeLabel: UILabel!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //navigationController?.navigationBar.tintColor = UIColor.white
        UINavigationBar.appearance().tintColor = .white
        
        if let user = user {
            personImage.image = user.person.image
            aboutMeLabel.text = user.person.aboutMe
        }
        
    }
    
    
    override func viewDidLayoutSubviews() {
        personImage.layer.cornerRadius  = personImage.bounds.height / 2
    }
    
    
}
