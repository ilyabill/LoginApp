//
//  AboutMeViewController.swift
//  LoginApp
//
//  Created by ILYA BILARUS on 19.12.2021.
//

import UIKit

class AboutMeViewController: UIViewController {

    var user: User?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVC = segue.destination as! InfoViewController
        destinationVC.user = user   
    }

}
