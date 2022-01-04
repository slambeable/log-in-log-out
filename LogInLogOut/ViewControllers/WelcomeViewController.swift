//
//  WelcomeViewController.swift
//  LogInLogOut
//
//  Created by Андрей Евдокимов on 18.12.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    
    var person: Person?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradient = GradientForView()
        
        gradient.setBackground(for: view)

        welcomeLabel.text = "Welcome, \(person?.name ?? "User")!"
    }

    @IBAction func closeWelcome() {
        dismiss(animated: true)
    }
}
