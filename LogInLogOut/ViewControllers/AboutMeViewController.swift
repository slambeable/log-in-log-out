//
//  AboutMeViewController.swift
//  LogInLogOut
//
//  Created by Андрей Евдокимов on 04.01.2022.
//

import UIKit

class AboutMeViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var foodLabel: UILabel!
    @IBOutlet var aboutLabel: UILabel!
    
    var person: Person?

    override func viewDidLoad() {
        super.viewDidLoad()

        setValueForLabel()
    }

    private func setValueForLabel() {
        nameLabel.text = person?.name
        ageLabel.text = String(person?.age ?? 0)
        foodLabel.text = person?.favoriteFood
        aboutLabel.text = person?.about
    }
 }
