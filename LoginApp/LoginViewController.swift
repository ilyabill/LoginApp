//
//  ViewController.swift
//  LoginApp
//
//  Created by ILYA BILARUS on 14.12.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    private let userName = "Eugenya"
    private let password = "1234"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userTextField.delegate = self
        passwordTextField.delegate = self
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToWelcome" {
            let destinationVC = segue.destination as! WelcomeViewController
            destinationVC.userName = userTextField.text
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    
    @IBAction func unwind(_ sender: UIStoryboardSegue) {
        userTextField.text?.removeAll()
        passwordTextField.text?.removeAll()
    }
    
    
    @IBAction func logInPressed() {
        login()
    }
    
    
    
    @IBAction func forgotNamePressed(_ sender: Any) {
        showUserNameAllert()
    }
    
    
    @IBAction func forgotPasswordPressed(_ sender: Any) {
        showPasswordAllert()
    }
    
    
    private func login() {
        guard userTextField.text == userName, passwordTextField.text == password else {
            incorrectLogAlert()
            return
        }
        self.performSegue(withIdentifier: "goToWelcome", sender: self)
    }
    
    
}


//MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 0:
            userTextField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        default:
            passwordTextField.resignFirstResponder()
            login()
        }
        return true
    }
    
}





//MARK: - UIAllertNotifications
extension LoginViewController {
    
    private func showUserNameAllert() {
        let alert = UIAlertController(title: "😱", message: "your username: \(userName)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.userTextField.text = self.userName
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    
    private func showPasswordAllert() {
        let alert = UIAlertController(title: "😱", message: "your password: \(password)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTextField.text = self.password
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    private func incorrectLogAlert() {
        let alert = UIAlertController(title: "error", message: "Your username or password incorrect, please try again", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
}


