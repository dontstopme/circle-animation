//
//  AnimationView.swift
//  test circle animation
//
//  Created by Zoltan Damo on 18.01.2024.
//

import UIKit

class AnimationView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configure()
    }
    
    
    func configure() {
        self.backgroundColor = .red
        self.setNeedsDisplay()
    }
}
