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

    private let name = "Bob"
    private let password = "Password"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        
        usernameTextField.returnKeyType = .next
        passwordTextField.returnKeyType = .done
        
        let gradient = GradientForView()
        
        view.backgroundColor = UIColor.clear
        let backgroundLayer = gradient.gradientLayer
        backgroundLayer.frame = view.frame
        view.layer.insertSublayer(backgroundLayer, at: 0)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let welcomeSegue = segue.destination as? WelcomeViewController {
            welcomeSegue.username = usernameTextField.text ?? "User"
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }

    @IBAction func showHint(_ sender: UIButton) {
        let place = sender.restorationIdentifier == "nameHint" ? "name" : "password"
        let value = sender.restorationIdentifier == "nameHint" ? name : password

        showAlert(
            title: "OOOPS!",
            message: "You \(place) is \(value).")
    }
    
    @IBAction func logIn() {
        if (usernameTextField.text != name || passwordTextField.text != password) {
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
            return false
        }
        
        return true
    }
}
