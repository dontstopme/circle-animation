//
//  AnimationCompletionAdapter.swift
//  test circle animation
//
//  Created by Zoltan Damo on 18.01.2024.
//

import UIKit

class AnimationCompletionAdapter: NSObject, CAAnimationDelegate {
    typealias Completion = () -> Void

    private let completion: Completion

    init(completion: @escaping Completion) {
        self.completion = completion
    }
    
    @objc func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag {
            self.completion()
        }
    }
}
