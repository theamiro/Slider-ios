//
//  MainViewController.swift
//  Slider
//
//  Created by Michael Amiro on 27/04/2020.
//  Copyright © 2020 Michael Amiro. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var swipeForMenu: UIPanGestureRecognizer!
    @IBOutlet weak var menuContainer: UIView!
    @IBOutlet weak var menuContainerLeading: NSLayoutConstraint!
    @IBOutlet weak var mainContainer: UIView!
    @IBOutlet weak var mainContainerCenter: NSLayoutConstraint!
    
    var menuVisible: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuContainerLeading.constant = 0 - menuContainer.frame.size.width
    }
    @IBAction func swipeForMenu(_ sender: Any) {
        let translation = swipeForMenu.translation(in: self.view)
        print(translation.x)
        if (swipeForMenu.state == .ended || swipeForMenu.state == .cancelled || swipeForMenu.state == .failed) {
            if (!menuVisible) {
                if (translation.x > 100) {
                    showSideMenu()
                } else {
                    hideSideMenu()
                }
            }
            return
        }
        
        if (!menuVisible && translation.x > 0 && translation.x <= menuContainer.frame.size.width){
            menuContainerLeading.constant = 0 - menuContainer.frame.size.width + translation.x
            mainContainerCenter.constant = 0 + translation.x
            view.layoutIfNeeded()
        }
        if (menuVisible && translation.x >= 0 - menuContainer.frame.size.width && translation.x < 0.0) {
            menuContainerLeading.constant = 0 + translation.x
            mainContainerCenter.constant = 0
            view.layoutIfNeeded()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
    }

    func showSideMenu(){
            UIView.animateKeyframes(withDuration: 0.3, delay: 0, options: [], animations: {
                self.menuContainerLeading.constant = 0
                self.mainContainerCenter.constant = 0 + self.menuContainer.frame.size.width
                self.view.layoutIfNeeded()
            }, completion: { (_ ) in
                self.menuVisible = true
            })
        }

    func hideSideMenu(){
        UIView.animateKeyframes(withDuration: 0.3, delay: 0, options: [], animations: {
            self.menuContainerLeading.constant = 0 - self.menuContainer.frame.size.width
            self.mainContainerCenter.constant = 0
            self.view.layoutIfNeeded()
        }, completion: {(_ ) in
            self.menuVisible = false
        })
    }
}
