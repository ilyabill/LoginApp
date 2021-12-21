//
//  Person.swift
//  LoginApp
//
//  Created by ILYA BILARUS on 19.12.2021.
//

import UIKit

struct User {
    
    let userName: String
    let password: String
    let person: Person
    static func getUser() -> User{
        User(userName: "Ilya",
             password: "123456",
             person: Person(image: UIImage(named: "myImage") ?? UIImage(),
                            aboutMe: "I work as a design engineer, create complex 3D models and drawings, I want to retrain as an iOS developer"))
    }
    
}



struct Person {

    let image: UIImage
    let aboutMe: String
    
}


