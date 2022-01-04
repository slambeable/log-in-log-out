//
//  LoginViewController.swift
//  LogInLogOut
//
//  Created by Андрей Евдокимов on 18.12.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    var gradientOfView: CAGradientLayer!

//    private let name = "Bob"
//    private let password = "Password"
    private let user = User.getUser()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        
        usernameTextField.returnKeyType = .next
        passwordTextField.returnKeyType = .done
        
        let gradient = GradientForView()

        gradient.setBackground(for: view)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        
        for viewController in tabBarController.viewControllers! {
            if let welcomeSegue = viewController as? WelcomeViewController {
                welcomeSegue.person = user.person
            } else if let navigationVC = viewController as? UINavigationController {
                let personVC = navigationVC.topViewController as! PersonViewController
                personVC.person = user.person
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    @IBAction func showHint(_ sender: UIButton) {
        let place = sender.restorationIdentifier == "nameHint" ? "name" : "password"
        let value = sender.restorationIdentifier == "nameHint" ? user.login : user.password

        showAlert(
            title: "OOOPS!",
            message: "You \(place) is \(value).")
    }
    
    @IBAction func logIn() {
        if (usernameTextField.text != user.login || passwordTextField.text != user.password) {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login and password")

            self.passwordTextField.text = ""
        }
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }

    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - UITextFieldDelegate Protocol
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.restorationIdentifier == "nameField" && !(textField.text?.isEmpty ?? true) {
            passwordTextField.becomeFirstResponder()
        } else if textField.restorationIdentifier == "passwordField" {
            logIn()
            performSegue(withIdentifier: "showWelcomeVC", sender: nil)
        }
        
        return true
    }
}
