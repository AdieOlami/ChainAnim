//
//  Animation.swift
//  ChainAnimation
//
//  Created by Olar's Mac on 3/23/19.
//  Copyright © 2019 Adie Olami. All rights reserved.
//

import UIKit

enum KeyPath: String {
    case positionX = "position.x"
    case positionY = "position.y"
}

enum TranslationX: CGFloat {
    case left = -30
    case right = 30
}

enum TranslationY: CGFloat {
    case value = 0
}

extension UIView {
    
    func baseAnimate(duration: TimeInterval? = 0.5, delay: TimeInterval? = 0, damping: CGFloat? = 0.5, velocity: CGFloat? = 0.5, options: UIView.AnimationOptions? = [.curveEaseOut], translation: TranslationX? = .left) {
        
        UIView.animate(withDuration: duration!, delay: delay!, usingSpringWithDamping: damping!, initialSpringVelocity: velocity!, options: options!, animations: {
            self.transform = CGAffineTransform(translationX: (translation?.rawValue)!, y: TranslationY.value.rawValue)
        }) { (_) in
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.alpha = 0
                self.transform = self.transform.translatedBy(x: 0, y: -200)
            })
        }
    }
    
    func animateChanined(duration: TimeInterval? = 0.5, delay: TimeInterval? = 0, damping: CGFloat? = 0.5, velocity: CGFloat? = 0.5, options: UIView.AnimationOptions? = [.curveEaseOut], translation: TranslationX? = .left) {
        
        UIView.animate(withDuration: duration!, delay: delay! + 0.5 , usingSpringWithDamping: damping!, initialSpringVelocity: velocity!, options: options!, animations: {
            self.transform = CGAffineTransform(translationX: (translation?.rawValue)!, y: TranslationY.value.rawValue)
        }) { (_) in
            UIView.animate(withDuration: duration!, delay: delay!, usingSpringWithDamping: damping!, initialSpringVelocity: velocity!, options: options!, animations: {
                self.alpha = 0
                self.transform = self.transform.translatedBy(x: 0, y: -200)
            })
        }
    }
    
    
    func animateShake(duration: CFTimeInterval? = 0.4, path: KeyPath? = .positionX) {
        let animation = CAKeyframeAnimation()
        animation.keyPath = path?.rawValue
        animation.values = [0, 10, -10, 10, -5, 5, -5, 0 ]
        animation.keyTimes = [0, 0.125, 0.25, 0.375, 0.5, 0.625, 0.75, 0.875, 1]
        animation.duration = duration!
        animation.isAdditive = true
        
        self.layer.add(animation, forKey: "shake")
        
    }
    
    func animateRotate(){
        let animation = CAKeyframeAnimation()
        animation.keyPath = "transform.rotation"
        animation.values = [0, 0.3, -0.3, 0.3, 0]
        animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
        animation.duration = CFTimeInterval(1)
        animation.isAdditive = true
        animation.repeatCount = 1
        animation.beginTime = CACurrentMediaTime() + CFTimeInterval(0)
        layer.add(animation, forKey: "swing")
    }
    
    func animateMomentum(){
        //Total animation duration is 1.0 seconds - This time is inside the
        UIView.animateKeyframes(withDuration: 1.0, delay: 0.0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25, animations: {
                //1.Expansion
                self.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
                //2.Shrink
                self.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.50, relativeDuration: 0.25, animations: {
                //3.Grant momentum
                self.frame.origin.x -= 16
            })
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25, animations: {
                //4.Move out of screen and reduce alpha to 0
                self.frame.origin.x = self.frame.size.width
//                self.transform = self.transform.translatedBy(x: 0, y: -200)
                self.alpha = 0.0
            })
        }) { (completed) in
            //Completion of whole animation sequence
        }
    }
    
    func animateColor() {
        UIView.animateKeyframes(withDuration: 2, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5, animations: {
                self.backgroundColor = .green
            })
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5, animations: {
                self.backgroundColor = .blue
            })
        }) { (completed) in
            //Completion of whole animation sequence
        }
    }
}

