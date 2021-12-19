//
//  WelcomeViewController.swift
//  LogInLogOut
//
//  Created by Андрей Евдокимов on 18.12.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    
    var username = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradient = GradientForView()
        
        view.backgroundColor = UIColor.clear
        let backgroundLayer = gradient.gradientLayer
        backgroundLayer.frame = view.frame
        view.layer.insertSublayer(backgroundLayer, at: 0)

        welcomeLabel.text = "Welcome, \(username)!"
    }

    @IBAction func closeWelcome() {
        dismiss(animated: true)
    }
}
