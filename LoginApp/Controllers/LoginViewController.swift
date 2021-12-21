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
    @IBOutlet weak var logPassStackView: UIStackView!
    
    let user = User.getUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userTextField.delegate = self
        passwordTextField.delegate = self
        
    }
    
    //MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.user = user
            } else if let navigationVC = viewController as? UINavigationController {
                let aboutUserVC = navigationVC.topViewController as! AboutMeViewController
                aboutUserVC.user = user
            }
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape {
            print("Landscape")
            logPassStackView.axis = .horizontal
        } else {
            print("Portrait")
            logPassStackView.axis = .vertical
        }
    }
    
    @IBAction func unwind(_ sender: UIStoryboardSegue) {
        userTextField.text?.removeAll()
        passwordTextField.text?.removeAll()
    }
    
    

    
    
    @IBAction func logInPressed() {
        guard userTextField.text == user.userName, passwordTextField.text == user.password else {
            userTextField.text?.removeAll()
            passwordTextField.text?.removeAll()
            incorrectLogAlert()
            return
        }
        performSegue(withIdentifier: "goToWelcome", sender: nil)
    }
    
    
    
    @IBAction func forgotNamePressed(_ sender: Any) {
        showUserNameAllert()
    }
    
    
    @IBAction func forgotPasswordPressed(_ sender: Any) {
        showPasswordAllert()
    }
    
    
    
}


//MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField.tag == 0 {
            passwordTextField.becomeFirstResponder()
        } else {
            logInPressed()
        }
        
        return true
    }
    
}






//MARK: - UIAllertNotifications
extension LoginViewController {
    
    private func showUserNameAllert() {
        let alert = UIAlertController(title: "😱", message: "your username: \(user.userName)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.userTextField.text = self.user.userName
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    
    private func showPasswordAllert() {
        let alert = UIAlertController(title: "😱", message: "your password: \(user.password)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTextField.text = self.user.password
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


