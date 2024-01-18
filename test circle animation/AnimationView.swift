//
//  AnimationView.swift
//  test circle animation
//
//  Created by Zoltan Damo on 18.01.2024.
//

import UIKit
import CoreGraphics

class AnimationView: UIView, CAAnimationDelegate {

    var circles = [CAShapeLayer]()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configure()
    }
      
    override var bounds: CGRect {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    func configure() {
        self.layer.backgroundColor = UIColor.animationBackground.cgColor

        for _ in 0 ..< 29 {
            let circle = CALayer.circleLayer
            self.layer.addSublayer(circle)
            circles.append(circle)
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        let circleSize = CGFloat(25)
        let distance = CGFloat(10)
        
        let formationHeight = CGFloat(circleSize * 13 + distance * 12)
        let verticalPadding = CGFloat((bounds.height - formationHeight) * 0.5)
        
        let formationWidth = CGFloat(circleSize * 8 + distance * 7)
        let horizontalPadding = CGFloat((bounds.width - formationWidth) * 0.5)

        layoutLeftSide(verticalPadding, horizontalPadding, circleSize, distance)
        layoutTop(verticalPadding, horizontalPadding, circleSize, distance)
        layoutRightSide(verticalPadding, horizontalPadding, circleSize, distance)
    }
    
    func startAnimation() {
        
        circles[0].animateFillColorChange(to: UIColor.blue.cgColor, delegate: self)
    }
    
    @objc func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag {
            circles[0].animateFillColorChange(to: UIColor.green.cgColor)
            circles[1].animateFillColorChange(to: UIColor.blue.cgColor)
        }
    }
    
    
    private func layoutLeftSide(_ verticalPadding: CGFloat, _ horizontalPadding: CGFloat, _ circleSize: CGFloat, _ distance: CGFloat) {
        var bottomY = bounds.height - verticalPadding
        
        for i in 0 ..< 11 {
            let circle = circles[i]
            
            circle.path = CGPath(
                ellipseIn: CGRectMake(horizontalPadding, bottomY - circleSize, circleSize, circleSize),
                transform: nil)
            
            bottomY -= distance
            bottomY -= circleSize
        }
    }
    
    private func layoutTop(_ verticalPadding: CGFloat, _ horizontalPadding: CGFloat, _ circleSize: CGFloat, _ distance: CGFloat) {
        
        let topY = bounds.height - verticalPadding - 12 * circleSize - 10 * distance
        var horizontalX = horizontalPadding + circleSize + distance

        let leftCornerCircle = circles[11]
        leftCornerCircle.path = CGPath(
            ellipseIn: CGRectMake(horizontalX, topY, circleSize, circleSize),
            transform: nil)

        let rightCornerCircle = circles [17]
        rightCornerCircle.path = CGPath(
            ellipseIn: CGRectMake(bounds.width - horizontalPadding - circleSize, topY, circleSize, circleSize),
            transform: nil)
        
        horizontalX += circleSize + distance
        for i in 12 ..< 17 {
            let circle = circles[i]
            
            circle.path = CGMutablePath(
                ellipseIn: CGRectMake(horizontalX, topY - circleSize, circleSize, circleSize),
                transform: nil)
            
            horizontalX += distance
            horizontalX += circleSize
        }
    }
    
    private func layoutRightSide(_ verticalPadding: CGFloat, _ horizontalPadding: CGFloat, _ circleSize: CGFloat, _ distance: CGFloat) {
        var bottomY = bounds.height - verticalPadding
        let rightX = bounds.width - horizontalPadding
        
        for i in (18 ..< 29).reversed() {
            let circle = circles[i]
            
            circle.path = CGMutablePath(
                ellipseIn: CGRectMake(rightX, bottomY - circleSize, circleSize, circleSize),
                transform: nil)
            
            bottomY -= distance
            bottomY -= circleSize
        }
    }
}

extension CALayer {
    static var circleLayer: CAShapeLayer {
        let layer = CAShapeLayer()
        
        layer.backgroundColor = UIColor.animationBackground.cgColor
        layer.strokeColor = UIColor.circle.cgColor
        layer.fillColor = UIColor.animationBackground.cgColor

        return layer
    }
}

extension CAShapeLayer {
    func animateFillColorChange(to color: CGColor, delegate: CAAnimationDelegate? = nil) {
        let transition = CATransition()
        transition.type = .fade
        transition.duration = 5
        transition.delegate = delegate
        
        self.add(transition, forKey: "com.testcircleanimation.fade")
        self.fillColor = color
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
