//
//  AnimationView.swift
//  test circle animation
//
//  Created by Zoltan Damo on 18.01.2024.
//

import UIKit

class AnimationView: UIView {

    override class var layerClass: AnyClass {
        return CAShapeLayer.self
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configure()
    }
      
    
    func configure() {
        self.layer.backgroundColor = UIColor.animationBackground.cgColor
        var circle: CALayer = .circleLayer
        
        self.layer.addSublayer(circle)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
    }
}

extension CALayer {
    static var circleLayer: CALayer {
        var layer = CAShapeLayer()
        layer.backgroundColor = UIColor.animationBackground.cgColor
        
        let circle = CGPath(
            ellipseIn: CGRect(
                x: 100.0,
                y: 100.0,
                width: 20.0,
                height: 20.00),
            transform: nil)
        
        layer.path = circle
        layer.strokeColor = UIColor.circle.cgColor
        layer.fillColor = UIColor.animationBackground.cgColor

        
        return layer
    }
}

extension UIColor {
    static var animationBackground: UIColor {
        return UIColor(red: 2.0 / 255.0, green: 3.0 / 255.0, blue: 46.0 / 255.0, alpha: 1.0)
    }
    
    static var circle: UIColor {
        return UIColor(red: 195.0 / 255.0, green: 196.0 / 255.0, blue: 221.0 / 255.0, alpha: 1.0)
    }
}
