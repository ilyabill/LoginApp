//
//  Person.swift
//  LoginApp
//
//  Created by ILYA BILARUS on 19.12.2021.
//

import UIKit

struct DataBase {
    
    static func getPerson() -> Person{
        Person(userName: "Ilya",
               password: "123456",
               image: UIImage(named: "myImage")!,
               aboutMe: "I work as a design engineer, create complex 3D models and drawings, I want to retrain as an iOS developer")
    }
    
}



struct Person {
    
    let userName: String
    let password: String
    let image: UIImage
    let aboutMe: String
    
}


