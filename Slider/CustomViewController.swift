//
//  CustomViewController.swift
//  Slider
//
//  Created by Michael Amiro on 27/04/2020.
//  Copyright © 2020 Michael Amiro. All rights reserved.
//

import UIKit

class CustomViewController: UIViewController {

    let profileButton = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        profileButton.setImage(UIImage(named: "avatar") , for: .normal)
        profileButton.contentMode = .scaleAspectFit
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        
        // function performed when the button is tapped
        profileButton.addTarget(self, action: #selector(profileButtonTapped(_:)), for: .touchUpInside)
        
        // Add the profile button as the left bar button of the navigation bar
        let barbutton = UIBarButtonItem(customView: profileButton)
        self.navigationItem.leftBarButtonItem = barbutton
        
        // Set the width and height for the profile button
        NSLayoutConstraint.activate([
            profileButton.widthAnchor.constraint(equalToConstant: 35.0),
            profileButton.heightAnchor.constraint(equalToConstant: 35.0)
        ])
        // Make the profile button become circular
        profileButton.layer.cornerRadius = 35.0 / 2
        profileButton.clipsToBounds = true
        
    }
    @objc private func profileButtonTapped(_ sender: Any){
        if let mainViewController = self.navigationController?.tabBarController?.parent as? MainViewController {
            mainViewController.toggleSideMenu()
        }
    }
}
