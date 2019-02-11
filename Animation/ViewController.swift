//
//  ViewController.swift
//  Animation
//
//  Created by Denis Bystruev on 11/02/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var centerX: NSLayoutConstraint!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let animator = UIViewPropertyAnimator(duration: 5, curve: .easeInOut) {
            self.button.center.x = 50
            self.button.center.y = 50
        }
        animator.addCompletion { position in
            switch position {
            case .start:
                print("Start")
            case .current:
                print("Current")
            case .end:
                print("Finish")
            }
        }
        animator.startAnimation()
        
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 5, delay: 0, options: [.autoreverse], animations: {
            self.button.transform = CGAffineTransform(rotationAngle: .pi / 2)
//            self.button.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        }) { position in
            print(#function, position)
            self.button.transform = CGAffineTransform.identity
        }
        
        let roundAnimator = UIViewPropertyAnimator(duration: 5, curve: .easeInOut) {
            self.button.layer.cornerRadius = 100
        }
        roundAnimator.startAnimation()
        
        UIView.animate(withDuration: 2, animations: {

            self.button.backgroundColor = .green
            self.button.backgroundColor = .black
            self.button.backgroundColor = .blue
        }) { flag in
            if flag {
                UIView.animate(withDuration: 2, animations: {
                    self.button.backgroundColor = .orange
                })
            }
        }
    }

    @IBAction func buttonPressed() {
        print(#function)
//        UIView.animate(withDuration: 5, delay: 3, options: [.autoreverse], animations: {
//            self.button.alpha = 0
//        }, completion: { _ in
//            self.button.alpha = 1
//        })
        
        view.layoutIfNeeded()
        centerX.constant = 100
        UIView.animate(withDuration: 5, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0, options: [.autoreverse], animations: {
            self.view.layoutIfNeeded()
        }, completion: { _ in
            self.centerX.constant = 0
        })
        
    }

}

