//
//  ViewController.swift
//  test circle animation
//
//  Created by Zoltan Damo on 18.01.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        (self.view as? AnimationView)?.startAnimation()
    }
}

